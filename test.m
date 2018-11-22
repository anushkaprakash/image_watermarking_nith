a=imread('anu.png');
size(a)
a=imresize(a,[512 512]);
imwrite(a,'anu.png');


