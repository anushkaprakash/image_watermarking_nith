%function [NC] = nc_def(exwat1,wat1)
%calculating nc value
wat1 = im2double(imread('moon.png'));
exwat1 = im2double(imread('ex_wat_att.png'));
[m,n,x] = size(exwat1);
wat1 = imresize(wat1,[m,n]);
figure, imshow(exwat1);
%calculation of NC value
% m no of rows, n no of columns and k no of bands
[m,n,k] = size(exwat1);
wat1 = imresize(wat1,[m n]);
    for a=1:k % for bands (1,2,3)
    dm=0;
    nm=0;
    for c=1:m %for rows
        for b=1:n %for columns
            nm = nm + exwat1(c,b,a)*wat1(c,b,a);
            dm = dm + wat1(c,b,a)*wat1(c,b,a);
        end
    end
    nc(a)=nm/dm; % NC for different k values(bands)
end
avgnc=mean(nc);
display(avgnc);
NC=avgnc;
%end
%calculation of NC value



