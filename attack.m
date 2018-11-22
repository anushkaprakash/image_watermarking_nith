y = im2double(imread('wm_image.png'));
x = im2double(imread('lena.png'));

%att = median_filter(y);
%att = imnoise(y,'salt & pepper',0.01);
%att = imgaussfilt(att,1);
att = imnoise(y,'speckle',0.02);
att = median_filter(att);
%h = ones(5,5)/25;
%att = imfilter(y,h);
%att = imrotate(y,5);
%att = imcrop(y,[64,164,256,256]);
%att = imresize(y,0.75);


imwrite(att,'att_image.png');
%figure, imshow(y);
%figure, imshow(att);

