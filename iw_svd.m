clear all;
close all;

%embed 

k =0.1;

x=im2double(imread('lena.jpg'));
a=im2double(imread('moon2.jpg'));
y=x;

figure, imshow(x); title('ORIGINAL');
figure, imshow(a); title('WATERMARK');

x1=x(:,:,1);
x2=x(:,:,2);
x3=x(:,:,3);

a1=a(:,:,1);
a2=a(:,:,2);
a3=a(:,:,3);

[Ux1,Sx1,Vx1] = svd(x1);
[Ux2,Sx2,Vx2] = svd(x2);
[Ux3,Sx3,Vx3] = svd(x3);

[Ua1,Sa1,Va1] = svd(a1);
[Ua2,Sa2,Va2] = svd(a2);
[Ua3,Sa3,Va3] = svd(a3);

Sn1 = Sx1 + k * Sa1;
Sn2 = Sx2 + k * Sa2;
Sn3 = Sx3 + k * Sa3;

y1 = Ux1 * Sn1 * Vx1';
y2 = Ux2 * Sn2 * Vx2';
y3 = Ux3 * Sn3 * Vx3';

y(:,:,1) = y1;
y(:,:,2) = y2;
y(:,:,3) = y3;

figure, imshow(y); title('WATERMARKED IMAGE');

figure, imshow(abs(x-y)); title('DIFFERENCE');

%extract
y1 = y(:,:,1);
y3 = y(:,:,2);
y3 = y(:,:,3);

[Uy1,Sy1,Vy1] = svd(y1);
[Uy2,Sy2,Vy2] = svd(y2);
[Uy3,Sy3,Vy3] = svd(y3);

Sw1 = (Sy1 - Sx1) / k;
Sw2 = (Sy2 - Sx2) / k;
Sw3 = (Sy3 - Sx3) / k;

w1 = Ua1 * Sw1 * Va1';
w2 = Ua2 * Sw2 * Va2';
w3 = Ua3 * Sw3 * Va3';

w(:,:,1) = w1;
w(:,:,2) = w2;
w(:,:,3) = w3;

figure, imshow(w); title('EXTRACTED WATERMARK');
nc_def(a,w);
