
function [p, r,pro, un] =compare2Pmaps (exp, indx1,indx2, th, statTest, rng)
% check if the hotmap of lp1 is significantly similar to lp1
% if p > 0.05 it means they are not similar above chance
% different
    
% 
if nargin < 6
    rng = [];
end
lp = initLightParam(exp,1,1); 
lp = readLpData(lp,[-10 10],[1 1],indx1);

lp.TTLEvents = lp.TTLEvents(:,rng);

lp1=lp;
lp1 = scanHotSpotMap(lp1, 4);

lp = initLightParam(exp,1,1);
lp = readLpData(lp,[-10 10],[1 1],indx2);

lp.TTLEvents = lp.TTLEvents(:,rng);



lp2=lp;
lp2 = scanHotSpotMap(lp2, 4);

[p1 , ~, frVals1]=hotSpotMapPvalue(lp1,th,1, statTest);
[p2 , ~, frVals2]=hotSpotMapPvalue(lp2,th,1, statTest);
[r,pro]=corrcoef(frVals1(:), frVals2(:))
figure; scatter(frVals1(:), frVals2(:),'.'); title (['r= ' num2str(r(1,2)) ' p= ' num2str(pro(1,2))])


 
p1(find(p1==1))=0; %remove all excitation
p2(find(p2==1))=0;

p1=p1(:); p2=p2(:);
un = sum(p1.*p2)/4 %union between the 2 inhibitory maps
%%
z=[p1(:); p2(:)]';
unList=[];
for i=1:10000
    p=randperm(length(z));
    p1t=z(p((1:length(p1))));
    p2t=z(p((length(p1)+1:end)));
    unList(end+1) = sum(p1t.*p2t)/4;
end    
    

disp('p value of the probbality of getting this amount of overlap. thus if p<0.05 we may say these maps are similar')
p = length(find(unList >= un))/10000
figure; hist(unList); title(num2str(p))


%
