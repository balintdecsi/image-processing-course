function [F] = my_fourier(I)
    
[szI1, szI2] = size(I);
F = complex(zeros(szI1,szI2));
for k1 = 0:(szI1-1)
    for k2 = 0:(szI2-1)
        i_sum = 0+0i;
        for n1 = 0:(szI1-1)
            for n2 = 0:(szI2-1)
                i_sum = i_sum + I(n1+1,n2+1)*exp(-1i*(2*pi/szI1)*k1*n1)*exp(-1i*(2*pi/szI2)*k2*n2);
            end
        end
        F(k1+1,k2+1) = i_sum;        
    end
end

end
