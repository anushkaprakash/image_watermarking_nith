close all;
clear all;

cover=im2double(imread('anu.png'));
a=im2double(imread('moon.png'));
figure, imshow(cover);
figure, imshow(a);


k = 1;

lshaar = liftwave('haar'); 
els = {'p',[-0.125 0.125],0};
lsnew = addlift(lshaar,els);

[LL1,LH1,HL1,HH1] = lwt2(cover,lsnew);  %lwt on cover image
    
[LL2,LH2,HL2,HH2] = lwt2(LL1,lsnew);  %lwt on LH1 subband

a = ar_enc(a);  %encrypt the watermark
 
    
%apply dct on LL2
x=LL2;
x1 = x(:,:,1);
x2 = x(:,:,2);
x3 = x(:,:,3);    
    
dx1=dct2(x1);
dx2=dct2(x2);
dx3=dct2(x3);
    
%apply DCT on a
a1 = a(:,:,1);
a2 = a(:,:,2);
a3 = a(:,:,3);
    
da1=dct2(a1);
da2=dct2(a2);
da3=dct2(a3);
  
dx1 = dx1 + k * da1;
dx2 = dx2 + k * da2;
dx3 = dx3 + k * da3;

LL2new1 = idct2(dx1);   %inverse DCT to get new LL2
LL2new2 = idct2(dx2);
LL2new3 = idct2(dx3);

LL2new(:,:,1) = LL2new1;  
LL2new(:,:,2) = LL2new2;
LL2new(:,:,3) = LL2new3;
    
LL1new = ilwt2(LL2new,LH2,HL2,HH2,lsnew);  %inverse DCT to get new LL1
output = ilwt2(LL1new,LH1,HL1,HH1,lsnew);  %inverse DCT to get watermarked image

figure, imshow(output), title('WATERMARKED IMAGE');
%display(psnr(cover,output));
imwrite(output,'wm_image.png');

