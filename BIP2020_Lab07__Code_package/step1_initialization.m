function [LUT, M] = step1_initialization(S, k)

[m,n] = size(S);
LUT = zeros(1,m);
M = zeros(k,n);
% equidistant distribution step:
step = floor(m/k);
rows = 1:step:m;
rows = rows(1:k);
M = S(rows,:);
    
end
