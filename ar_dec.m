function [inverse] = ar_dec(input)
    [m,n,c] = size(input);
    iter=5;
    input1=input(:,:,1);
    input2=input(:,:,2);
    input3=input(:,:,3);

    inverse1 =  zeros(m);
    inverse2 =  zeros(m);
    inverse3 =  zeros(m);

    n = n - 1;
    for j=1:iter
        for y=0:n
            for x=0:n
                p = [ 2 -1 ; -1 1 ] * [ x ; y ];
                inverse1(mod(p(2), m)+1, mod(p(1), m)+1) = input1(y+1, x+1);
                inverse2(mod(p(2), m)+1, mod(p(1), m)+1) = input2(y+1, x+1);
                inverse3(mod(p(2), m)+1, mod(p(1), m)+1) = input3(y+1, x+1);
            end
        end
        input1 = inverse1;
        input2 = inverse2;
        input3 = inverse3;
    end

    inverse(:,:,1)=inverse1;
    inverse(:,:,2)=inverse2;
    inverse(:,:,3)=inverse3;
end