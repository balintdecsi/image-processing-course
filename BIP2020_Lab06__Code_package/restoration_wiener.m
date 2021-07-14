function [x_tilde] = restoration_wiener(y, h, n)

Y = fft2(y);
H = psf2otf(h,size(Y));
N = fft2(n);
P_XX = Y .* conj(Y);
P_NN = N .* conj(N);

R_denominator = abs(H).^2 + P_NN./P_XX;
R = conj(H) ./ R_denominator;

x_tilde = ifft2(R.*Y);
    
end
