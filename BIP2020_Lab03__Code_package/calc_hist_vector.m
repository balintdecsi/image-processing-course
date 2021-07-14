function hist_vector = calc_hist_vector(input_img)

[sz1,sz2] = size(input_img);
hist_vector = zeros(1, 256);
for i = 1:sz1
    for j = 1:sz2
        hist_vector(input_img(i,j)+1) = hist_vector(input_img(i,j)+1) + 1;
    end
end

end