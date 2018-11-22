close all; 
clear all;

input = im2double(imread('wm_image.png'));
cover = im2double(imread('anu.png'));
a = im2double(imread('moon.png'));

[m,n,x] = size(input);
cover = imresize(cover,[m n]);

k = 1;

%input is the watermarked image
lshaar = liftwave('haar');
els = {'p',[-0.125 0.125],0};
lsnew = addlift(lshaar,els);
    
[LLw1,LHw1,HLw1,HHw1] = lwt2(input,lsnew); %LWT on watermarked image(input)
[LLw2,LHw2,HLw2,HHw2] = lwt2(LLw1,lsnew);
    
[LLc1,LHc1,HLc1,HHc1] = lwt2(cover,lsnew); %LWT on cover image
[LLc2,LHc2,HLc2,HHc2] = lwt2(LLc1,lsnew);    
    
%dct on LLw2 band of input image(watermarked image)
y=LLw2;
y1 = y(:,:,1);  
y2 = y(:,:,2);
y3 = y(:,:,3);
    
dy1 = dct2(y1);
dy2 = dct2(y2);
dy3 = dct2(y3);
    
%dct on LLc2 band of cover image
x=LLc2;
x1 = x(:,:,1); 
x2 = x(:,:,2);
x3 = x(:,:,3);
    
dx1 = dct2(x1);
dx2 = dct2(x2);
dx3 = dct2(x3);
    
%extraction
wm1 = (dy1 - dx1)/k;
wm2 = (dy2 - dx2)/k;
wm3 = (dy3 - dx3)/k;

wm1 = idct2(wm1);
wm2 = idct2(wm2);
wm3 = idct2(wm3);

wm(:,:,1) = wm1;
wm(:,:,2) = wm2;
wm(:,:,3) = wm3;
    
%wm = ar_dec(wm);  %decrypting the extracted watermark

figure, imshow(wm), title('EXTRACTED WATERMARK');
imwrite(wm,'ex_wat.png');

%nc_def(wm,a);
