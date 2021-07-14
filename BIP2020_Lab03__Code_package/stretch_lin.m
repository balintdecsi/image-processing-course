function output_img = stretch_lin(input_img)

inp_min = double(min(input_img, [], 'all'));
inp_max = double(max(input_img, [], 'all'));
output_img = uint8(round(255 / (inp_max - inp_min) * (double(input_img) - inp_min)));

end