
function [p, r, un, sharedExcSpots] = compare2LpPmaps (lp1, lp2, plotFlag)
% check if the hotmap of lp1 is significantly similar to lp1
% if p > 0.05 it means they are not similar above chance
% different
    
% 
pVal1=lp1.pVal;
pVal2=lp2.pVal;

nonExcSpots = [intersect(find(pVal1 ~= 1), find(pVal2 ~= 1))]';

frVals1 = lp1.map;
frVals2 = lp2.map;

[r,p]=corrcoef(frVals1(:), frVals2(:));
r=r(1,2)
p=p(1,2)

[r,p]=corrcoef(frVals1(nonExcSpots), frVals2(nonExcSpots));
[r,p] = corr(frVals1(nonExcSpots)', frVals2(nonExcSpots)', 'type','spearman');
disp(['correaltion betweent the hotmaps (without the ex spots)= ' num2str(r) ' p=' num2str(p)])
if plotFlag
    figure; 
    scatter(frVals1(:), frVals2(:),'.'); title (['r= ' num2str(r) ' p= ' num2str(p)])
end

excSpotsIndx1 = find(pVal1==1);
excSpotsIndx2 = find(pVal2==1);
 
pVal1(find(pVal1==1))=0; %remove all excitation
pVal2(find(pVal2==1))=0;

pVal1=pVal1(:); pVal2=pVal2(:);
un = sum(pVal1.*pVal2)/4; %union between the 2 inhibitory maps
%% permutation test
z=[pVal1(:); pVal2(:)]';
unList=[];
for i=1:10000
    p=randperm(length(z));
    p1t=z(p((1:length(pVal1))));
    p2t=z(p((length(pVal1)+1:end)));
    unList(end+1) = sum(p1t.*p2t)/4;
end    
    
sharedExcSpots = length(intersect(excSpotsIndx1,excSpotsIndx2));

disp(['number of shared excittory and inhibitory hotspot: ' num2str(sharedExcSpots) , ' -- ' num2str(un)])
disp('p value of the probbality of getting this amount of overlap. thus if p<0.05 we may say these maps are not randomly similar')
p = length(find(unList >= un))/10000

% verify the spike trains are not of the same neuron...
[a,b,c]=intersect(lp1.t, lp2.t);
disp(['percent of overlap between spike trains '  num2str(length(a)/max(length(lp1.t),length(lp2.t))*100) '%'])


