function [PAD] = pad_image(varargin)

if nargin == 1
    border_size = 10;
else
    border_size = varargin{2};
end
IMG = varargin{1};
szrgb = size(IMG,3);
if szrgb ~= 1
    warning('Input image is not grayscale, an attempt to convert it will be made')
    IMG = rgb2gray(IMG);
end
PAD = uint8(zeros((size(IMG,1) + border_size * 2),(size(IMG,2) + border_size * 2)));
PAD((border_size+1):(end-border_size),(border_size+1):(end-border_size)) = IMG(:,:);

    
end