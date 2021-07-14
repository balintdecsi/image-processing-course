function [TH] = threshold(IMG, level)

szrgb = size(IMG,3);
if szrgb ~= 1
    warning('Input image is not grayscale, an attempt to convert it will be made');
    IMG = rgb2gray(IMG);
end
level = level/255;
TH = imbinarize(IMG, level);
% maximum = double(max(IMG,[],'all'));
% tic;
% random = rand(size(IMG));
% IMG = (double(IMG)+random*maximum)>=maximum;
% toc;
% tic;
% for i = 1:numel(IMG)
%     IMG(i) = ((IMG(i)+rand*maximum)>=maximum);
% end
% toc;
end