function [output] = median_filter(input)
    output(:,:,1) = medfilt2(input(:,:,1));
    output(:,:,2) = medfilt2(input(:,:,2));
    output(:,:,3) = medfilt2(input(:,:,3));
end