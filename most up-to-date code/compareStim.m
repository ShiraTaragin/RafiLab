function [picGray] = compareStim( imageName )
% compareStim - displays the image alongside the brightness values of the
% different stimuli;
% Note - this is based on columns;

pic = imread(imageName);
figure;
subplot(1,2,1)
picGray = rgb2gray(pic);
imshow(picGray)
res = input('uniform; enter line \n');
u = picGray(:,res,1);
res = input('gaussian; enter line \n');
g = picGray(:,res,1);
res = input('truncated gaussian; enter line \n');
t = picGray(:,res,1);
res = input('square; enter line \n');
s = picGray(:,res,1);
res = input('background; enter line \n');
b = picGray(:,res,1);

subplot(1,2,2)
plot(u);
hold all
plot(g);
plot(t);
plot(s);
plot(b);
legend('uniform','gaussian', 'truncated', 'square', 'background')
title(imageName);
hold off;
end
