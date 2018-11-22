y = rgb2hsv(y);
y1 = y(:,:,1);
y2 = y(:,:,2);
y3 = y(:,:,3);

att1 = histeq(y1);
att2 = histeq(y2);
att3 = histeq(y3);

att(:,:,1) = att1;
att(:,:,2) = att2;
att(:,:,3) = att3;

att = hsv2rgb(att);