close all;
clear all;

x=im2double(imread('lena.jpg'));
a=im2double(imread('moon.jpg'));

figure, imshow(x), title('ORIGINAL IMAGE');
k=0.01;

y = embed(x,a,k);  %watermarked image
figure, imshow(y), title('WATERMARKED IMAGE');

%att = median_filter(y);  %attacked image
%att = imnoise(y,'salt & pepper',0.02);
%att = imgaussfilt(y,0.5);
%att = imnoise(y,'speckle',0.2);

%figure, imshow(att), title('ATTACKED IMAGE');

%w = extract(att,x,k);
figure, imshow(w), title('EXTRACTED WATERMARK');

display(psnr(x,y));
nc_def(w,a);