function [y, h, n] = degradation(x)

h = fspecial('motion',42,30);
n = randn(size(x)) * sqrt(.001);
y = imfilter(x,h,'replicate','conv') + n;
    
end
