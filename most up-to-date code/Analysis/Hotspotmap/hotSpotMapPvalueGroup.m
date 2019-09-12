function pValueMap = hotSpotMapPvalueGroup(lp, pTH, groupSize, plotFlag)
% calculate the p value between light and bg 
% this function consider group of spots
if ~exist('pTH', 'var')
    pTH = 0.05;
end

if ~exist('plotFlag', 'var')
    plotFlag = 0;
end

if ~exist('groupSize', 'var')
    groupSize = 0;
end

P1=[]; m1=[]; m2=[]; P2=[];

map = reshape(lp.lightSpikesFRnew, lp.dims(2), lp.dims(1))';
mapbg = reshape(lp.nonLightSpikes_allNew, lp.dims(2), lp.dims(1))';


for ii=1:(lp.dims(1)*lp.dims(2))  
    spikePerSec=[]; spikePerSec_bg=[];
    res2dIndx = convert2DIndx(lp.dims(2), [ii], map, 0);   % return the 2d index in map
    for jjRows=res2dIndx(1):min(res2dIndx(1)+groupSize,lp.dims(1))
        for kkCols=res2dIndx(2):min(res2dIndx(2)+groupSize,lp.dims(2))
            res1dIndx = convert2DIndx(lp.dims(2 ), [jjRows kkCols], map, 0);
            spikePerSec = [spikePerSec lp.lightFR{res1dIndx}];
            spikePerSec_bg = [spikePerSec_bg lp.nonLightFR{res1dIndx}];
        end
    end

    if mean(spikePerSec) > mean(spikePerSec_bg)
        compareType='right';
    else
        compareType='left';
    end
    %if length(spikePerSec) == length(spikePerSec_bg)
        %[H, P] = ttest(spikePerSec, spikePerSec_bg, 0.05, compareType);
    %else
        [H, P] = ttest(spikePerSec, spikePerSec_bg);
    %end
    
        
    P1 = [P1 P];
         
    m1 = [m1 mean(spikePerSec)];
    m2 = [m2 mean(spikePerSec_bg)]; 
end


bgMeanValue = mean(m2);
bgStdValue = std(m2);

P2= P1;%*lp.dims(1)*lp.dims(2);
% 
P2(P2 <= pTH) = 0.0;
P2(P2 > pTH) = 1;
P2 = 1 - P2;

% inhibition
P2(find(m1-m2 < 0)) = P2(find(m1-m2 < 0))*2;

% test changes
lightSpikesFRnew=lp.lightSpikesFRnew;
nonLightSpikes_allNew=lp.nonLightSpikes_allNew;
[hall,pall]=ttest(lightSpikesFRnew, nonLightSpikes_allNew, 0.05,'left');

% when ignoring exc and inh spots
lightSpikesFRnew(find(P2 > 0)) = [];
nonLightSpikes_allNew(find(P2 > 0)) = [];

[hall2,pall2]=ttest(lightSpikesFRnew, nonLightSpikes_allNew, 0.05,'left');

a=[]; b=[];
for i=find(P2 == 0)
     a=[a lp.lightFR{i}];
     b=[b lp.nonLightFR{ii}];
end
if length(a) == length(b)
    [hall3, pall3]=ttest(a,b,0.05,'left');
else
    [hall3, pall3]=ttest2(a,b,0.05,'left');
end


pValueMap = (reshape(P2, lp.dims(2), lp.dims(1)))';
inhibitNum = length(find(pValueMap==2))/length(pValueMap(:));
excitNum = length(find(pValueMap==1))/length(pValueMap(:));

if plotFlag
    figure;
    imagesc(lp.xRange, lp.yRange,pValueMap); 

    title([ num2str(lp.fileIndx) '_' num2str(lp.mClusterIndx) ' spotSize ' num2str(groupSize) ' pAll=' num2str(pall) ' pAll2=' num2str(pall2) 'pAll3=' num2str(pall3)])
end

