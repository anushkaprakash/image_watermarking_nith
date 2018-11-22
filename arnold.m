clear all;
close all;

x=im2double(imread('moon.jpg'));

y=ar_enc(x);
figure, imshow(y);

z=ar_dec(y);
figure, imshow(z);
