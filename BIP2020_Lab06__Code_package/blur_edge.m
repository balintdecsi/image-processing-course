function out_img = blur_edge(in_img)

H = psf2otf(fspecial('gaussian',60,10),size(in_img));
% H = psf2otf(imgaussfilt(in_img,10,'FilterSize',60),size(in_img));
blurred_img = abs(ifft2(H .* fft2(in_img)));
wm = ones(70);
wm = padarray(wm,[1 1]);
wm2 = imresize(wm,size(in_img),'bilinear');
wm2 = mat2gray(wm2,[0 1]);
in_img = in_img .* wm2;
blurred_img = blurred_img .* (1-wm2);
out_img = blurred_img + in_img;
    
end
