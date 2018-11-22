function [output] = ar_enc(input)
    iter = 5;
    [m,n,c]=size(input);
    
    input1=input(:,:,1);
    input2=input(:,:,2);
    input3=input(:,:,3);

    output1 = zeros(m);
    output2 = zeros(m);
    output3 = zeros(m);
    n=n-1;
    for j=1:iter
        for y=0:n
            for x=0:n
                p = [ 1 1 ; 1 2 ] * [ x ; y ];
                output1(mod(p(2), m)+1, mod(p(1), m)+1) = input1(y+1, x+1);
                output2(mod(p(2), m)+1, mod(p(1), m)+1) = input2(y+1, x+1);
                output3(mod(p(2), m)+1, mod(p(1), m)+1) = input3(y+1, x+1);
            end
        end
        input1 = output1;
        input2 = output2;
        input3 = output3;
    end

    output(:,:,1)=output1;
    output(:,:,2)=output2;
    output(:,:,3)=output3;
    figure, imshow(output);
end