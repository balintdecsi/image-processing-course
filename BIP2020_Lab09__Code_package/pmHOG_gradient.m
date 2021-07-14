function [PHI, MAG] = pmHOG_gradient(I)

I = double(I)/255;
Hx = [-1 0 1];
Hy = [-1; 0; 1];
X = imfilter(I,Hx,'replicate');
Y = imfilter(I,Hy,'replicate');
PHI = rad2deg(atan(Y./X));
MAG = sqrt(X.^2+Y.^2);
    
end
