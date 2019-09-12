function p=figureBinColors(p)
% conver the 2 to 0, the 1 to 2 and the 0 to 1
% this function is used so that when 

% 2 to 0:
p(find(p==0)) = 10;
p(find(p==2)) = 0;

% 1 to 0
p(find(p==1)) = 11;
p(find(p==10)) = 1;

p(find(p==11)) = 2;
imagesc(p)

colormap bone


