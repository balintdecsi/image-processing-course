function newF = mask_fourier(F, x, y, r)
    
G = fftshift(F);
[sz1, sz2] = size(G);
x = round(x);
y = round(y);
for i = 1:length(y)
    y_1 = max([1, y(i)-r]);
    y_2 = min([sz1, y(i)+r]);
    x_1 = max([1, x(i)-r]);
    x_2 = min([sz2, x(i)+r]);
    G(y_1:y_2, x_1:x_2) = 0+0i;
end
newF = ifftshift(G);
end
