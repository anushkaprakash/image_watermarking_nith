clear all;
close all;

k = 0.1;

x=im2double(imread('lena_gray.jpg'));
a=im2double(imread('moon2_gray.jpg'));
figure, imshow(x);
figure, imshow(a);

[LL1,LH1,HL1,HH1] = dwt2(x,'haar');
p=size(LL1);

[Ux,Sx,Vx] = svd(LH1);

a1=imresize(a,p);

[Uw,Sw,Vw] = svd(a1);

Snew = Sx + k * Sw;

LH1_new = Ux*Snew*Vx';
figure, imshow(LH1_new);

y = idwt2(LL1,LH1_new,HL1,HH1,'haar');

figure, imshow(y);