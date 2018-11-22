clear all;
close all;

k=0.1;

x=im2double(imread('lena.jpg'));
figure, imshow(x); title('ORIGINAL');
a=im2double(imread('flower.jpg'));
figure, imshow(a); title('WATERMARK');

[h_LL,h_LH,h_HL,h_HH]=dwt2(x,'haar');
p=size(h_LH);
a=imresize(a,[p(1) p(2)]);

hnew_LH = h_LH + (k * a);
%figure, imshow(hnew_LH);

new = idwt2(h_LL,hnew_LH,h_HL,h_HH,'haar');
figure, imshow(new);


figure, imshow(z);