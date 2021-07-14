function [x_tilde] = restoration_CLS(y, h, alpha, c)

Y = fft2(y);
H = psf2otf(h,size(Y));
C = psf2otf(c,size(Y));

R_denominator = abs(H).^2 + alpha * abs(C).^2;
R = conj(H)./R_denominator;

x_tilde = ifft2(R.*Y);
    
end
