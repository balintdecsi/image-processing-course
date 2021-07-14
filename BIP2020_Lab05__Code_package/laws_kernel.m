function H = laws_kernel(k)

if k < 1 || k > 9
    error('k must be between 1 and 9!');
end
kernels = {1/6 * [1;2;1], 1/2 * [1;0;-1], 1/2 * [1;-2;1]};
[i, j] = ind2sub([3 3],k);
H = kernels{j} * kernels{i}.';
    
end
