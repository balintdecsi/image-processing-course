I = imread('input/AlfredoBorba_TuscanLandscape.jpg');
iGray = rgb2gray(I);
row = 150;
width = size(iGray,2);
x = 1:width;
y1 = repelem(row,width);
subplot(211); imshow(iGray);
hold on
plot(x,y1,'r','LineWidth',1);
y2 = iGray(row,:);
subplot(212); plot(x,y2,'r','LineWidth',1);
xlabel('column index'); ylabel('pixel intensity value');