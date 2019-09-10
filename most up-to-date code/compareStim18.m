% imageName = 'both_10_255.jpg';

pic = imread(imageName);
figure;
subplot(1,2,1)
imshow(pic)
res = input('uniform; enter line \n');
u = pic(:,res,1);
res = input('gaussian; enter line \n');
g = pic(:,res,1);
res = input('truncated gaussian; enter line \n');
t = pic(:,res,1);
res = input('square; enter line \n');
s = pic(:,res,1);
res = input('background; enter line \n');
b = pic(:,res,1);

subplot(1,2,2)
plot(u(368:end));
hold all
plot(g(145:end));
plot(t);
plot(s(223:end));
plot(b);
%plot(glow);
legend('uniform','gaussian', 'truncated', 'square', 'glow')
title(imageName);
hold off;

% both_10_255 = pic;