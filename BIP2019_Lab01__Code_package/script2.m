I2 = imread('input/AlfredoBorba_TuscanLandscape.jpg');
[VER, HOR, ROT] = flip_and_rotate(I2);
subplot(1,3,1,'align');
imshow(VER);
subplot(1,3,2,'align');
imshow(HOR);
subplot(1,3,3,'align');
imshow(ROT);
