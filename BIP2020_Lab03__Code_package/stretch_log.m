function output_img = stretch_log(input_img, c)

log_img = log(c * double(input_img) + 1);
output_img = stretch_lin(log_img);

%% The details hard coded:
% log_min = double(min(log_img, [], 'all'));
% log_max = double(max(log_img, [], 'all'));
% output_img = uint8(round(255 / (log_max - log_min) * (log_img - log_min)));

end