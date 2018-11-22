x=im2double(imread('lena_gray.jpg'));
picCrypt(x);

function [cryptPic, keyVec, baseto, baseKey] = picCrypt(imMat,key,key2,key3)
    if nargin == 1    %picture is going to be encrypted
       key = rand;
       key2 = rand;
       key3 = rand;
       baseto = rand*1000;
       baseKey = max(floor(1000000*[key key2 key3])) + rand*100;
       keyVec = baseVecExpand(floor(1000000*[key key2 key3]),baseKey,baseto);
       pic = 10000*imMat;
       cryptPic = ((floor(pic)/key2).^key)+key3;
       figure, imshow(cryptPic);
       axis equal;
       axis tight;
    elseif nargin == 4    %picture is going to be decrypted
       key10 = baseVecExpand(key,key3,key2)/1000000;
       cryptPic = im2uint8(((imMat - key10(3)).^(1/key10(1))*key10(2))/10000); % CHANGE THIS FORMULA (this is the opposite of the formula above
       imagesc(cryptPic);
       axis equal;
       axis tight;  
    else
        error('You must enter the correct number of parameters');
    end
end

function baseExpanded = baseVecExpand(n,c,b)
    i = length(n);
    j = 0;
    y = 1;
    mainForm = zeros(1,i);
    for k = 0:i-1
        mainForm(k+1) = (c^(i-k-1))*n(k+1);
    end
    mainForm = sum(mainForm);
    while floor(mainForm/(b^j)) ~= 0
        j = j+1;
    end
    baseExp = zeros(1,j);
    for p = 1:j
        baseExp(p) = mod(floor(mainForm/(b^(j-y))),b);
        y = y+1;
    end
    baseExpanded = baseExp;
    disp(['You have entered ' ' ' num2str(nargin) ' ' 'parameters']);
end


   