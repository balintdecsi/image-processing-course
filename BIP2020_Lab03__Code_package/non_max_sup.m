function [r_vect, t_vect] = non_max_sup(H, k, p)

r_vect = [];
t_vect = [];
[sz1, sz2] = size(H);
while k > 0
    [m, idx] = max(H,[],'all','linear');
    [i, j] = ind2sub([sz1,sz2],idx);
    r_vect = [r_vect, i];
    t_vect = [t_vect, j];
    x_1 = max([1, i-p]);
    x_2 = min([sz1, i+p]);
    y_1 = max([1, j-p]);
    y_2 = min([sz2, j+p]);
    H(x_1:x_2, y_1:y_2) = 0;
    k = k - 1;
end
end