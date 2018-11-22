clear all;
close all;

x=im2double(imread('lena.jpg'));
figure, imshow(x), title('ORIGINAL IMAGE');
a=im2double(imread('moon.jpg'));

%EMBEDDING
x1 = x(:,:,1);
x2 = x(:,:,2);
x3 = x(:,:,3);

a1 = a(:,:,1);
a2 = a(:,:,2);
a3 = a(:,:,3);

dx1=dct2(x1);
dx2=dct2(x2);
dx3=dct2(x3);

da1=dct2(a1);
da2=dct2(a2);
da3=dct2(a3);

k=0.1;  %watermark strength

dx1 = dx1 + k * da1;
dx2 = dx2 + k * da2;
dx3 = dx3 + k * da3;

%figure, imshow(dx1);
%figure, imshow(dx2);
%figure, imshow(dx3);

y1 = idct2(dx1);
y2 = idct2(dx2);
y3 = idct2(dx3);

y(:,:,1) = y1;
y(:,:,2) = y2;
y(:,:,3) = y3;

figure, imshow(y), title('WATERMARKED IMAGE');

%extraction
y1 = y(:,:,1);  %watermarked image
y2 = y(:,:,2);
y3 = y(:,:,3);

x1 = x(:,:,1); %cover image
x2 = x(:,:,2);
x3 = x(:,:,3);  

%dct of watermarked image
dy1 = dct2(y1);
dy2 = dct2(y2);
dy3 = dct2(y3);

%dct of cover image
dx1 = dct2(x1);
dx2 = dct2(x2);
dx3 = dct2(x3);

%extract
wm1 = (dy1 - dx1)/k;
wm2 = (dy2 - dx2)/k;
wm3 = (dy3 - dx3)/k;

wm1 = idct2(wm1);
wm2 = idct2(wm2);
wm3 = idct2(wm3);

wm(:,:,1) = wm1;
wm(:,:,2) = wm2;
wm(:,:,3) = wm3;

figure, imshow(wm), title('EXTRACTED WATERMARK');







