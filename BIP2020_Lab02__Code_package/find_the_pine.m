function pine = find_the_pine(I)

I_hsv = rgb2hsv(I);
I_hsv_h = I_hsv(:,:,1);
pine = I_hsv_h < 55/360;

end