function [P, M] = fourier_parts(F)
    
G = fftshift(F);
P = angle(G);
M = abs(G);

end
