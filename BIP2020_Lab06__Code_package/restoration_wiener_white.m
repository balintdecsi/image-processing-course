function [x_tilde] = restoration_wiener_white(y, h, var_n)

Y = fft2(y);
H = psf2otf(h,size(Y));
nspr = var_n / var(y(:));

R = conj(H) ./ (abs(H).^2 + nspr);
x_tilde = ifft2(R.*Y);
    
end
