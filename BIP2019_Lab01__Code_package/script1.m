I = imread('input/AlfredoBorba_TuscanLandscape.jpg');
imshow(I);
szrgb = size(I, 3);
isColor = szrgb == 3;
iGray = rgb2gray(I);
figure;
imshow(iGray);
imwrite(iGray, 'output/AlfredoBorba_TuscanLandscape_GRAY.jpg');