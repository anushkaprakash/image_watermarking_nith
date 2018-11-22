function [NC] = nc_def1(exwat1,wat1)
    [m n k] = size(exwat1);
    nc = [0 0 0];
    for a=1:k
        for i=1:m
            for j=1:n
                nc(a)= nc(a) + corr2(exwat1(i,j,a),wat1(i,j,a))/corr2(abs(exwat1(i,j,a)),abs(wat1(i,j,a)));
            end
        end
    end
    NC=mean(nc);    
end