function [lp, statP]= hotSpotMapPvalue(lp, pTH, plotFlag, permutationTest)

if nargin < 4
    permutationTest=0;
end



lp = calcLightFR(lp);

if ~exist('plotFlag', 'var')
    plotFlag = 0;
end
% if lp.pTh < 0.01
%     lp.pTh = 0.05/(lp.dims(1)*lp.dims(2));
% end
% lp.pTh = 0.01;

%testType='ttest';
P2=[]; m1=[]; m2=[];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
[lp, pvals, P2, m1, m2] = compareLightOnVsOff(lp,  permutationTest);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%



% test changes
lightSpikesFRnew=lp.lightSpikesFRnew;
nonLightSpikes_allNew=lp.nonLightSpikes_allNew;
[hall,pall]=ttest(lightSpikesFRnew, nonLightSpikes_allNew, 0.05,'left');
frVals = (reshape(lightSpikesFRnew, lp.dims(2), lp.dims(1)))';


% when ignoring exc  spots
lightSpikesFRnewTemp = lightSpikesFRnew;
nonLightSpikes_allNewTemp = nonLightSpikes_allNew;
lightSpikesFRnewTemp((P2 == 1)) = [];
nonLightSpikes_allNewTemp((P2 == 1)) = [];

[hall2,pNoExc]=ttest(lightSpikesFRnewTemp, nonLightSpikes_allNewTemp, 0.05,'left');


LightSpikesFR_unSorted = lp.LightSpikesFR_unSorted;
nonLightSpikesFR_unSorted = lp.nonLightSpikesFR_unSorted;
[hnoExcAll,pnoExcAll]=ttest(LightSpikesFR_unSorted, nonLightSpikesFR_unSorted, 0.05,'left');

% when removing exc and inh spots taking all trials together and running a paired test
% when ignoring exc  spots
lightSpikesFRnewTemp = lightSpikesFRnew;
nonLightSpikes_allNewTemp = nonLightSpikes_allNew;

lightSpikesFRnewTemp(P2 == 1 | P2 == 2) = [];
nonLightSpikes_allNewTemp(P2 == 1 | P2 == 2) = [];

if isempty(lightSpikesFRnewTemp) | isempty(nonLightSpikes_allNewTemp)
    pNoInhExc=2;
else
    [hNoInhExc,pNoInhExc]=ttest(lightSpikesFRnewTemp, nonLightSpikes_allNewTemp, 0.05,'left');
    [pNoInhExc2]=ranksum(lightSpikesFRnewTemp, nonLightSpikes_allNewTemp);
end

statP.pNoInhExc = pNoInhExc;
statP.pNoExc = pNoExc;
lp.pNoExc = pNoExc;
statP.pnoExcAll = pnoExcAll;

pValueMap = (reshape(P2, lp.dims(2), lp.dims(1)));


lp.pVal = pValueMap;
lp.statP=statP;

inhibitNum = length(find(pValueMap==2))/length(pValueMap(:));
excitNum = length(find(pValueMap==1))/length(pValueMap(:));

if plotFlag > 0
    if plotFlag == 1
        figure('position', [100,100 400 400]);
    end
    imagesc(lp.xRange+lp.stimuliSize(1)/2, lp.yRange+lp.stimuliSize(2)/2,...
        pValueMap);
    set(gca,'XTick',lp.xRange,'YTick',lp.yRange)
    hold on; % plot the pvalues over the heat map.
    loc = find(P2 > 0);
    for kkk = 1:length(loc)
        [iii,jjj] = ind2sub(fliplr(lp.dims),loc(kkk));
        t = text(lp.xRange(jjj)+lp.stimuliSize(1)/2,lp.yRange(iii)+lp.stimuliSize(2)/2, num2str(pvals(loc(kkk))),'Color','w');
        set(t,'FontSize',7)
    end
    if isempty(lp.mClusterIndx)
        lp.mClusterIndx=-1;
    end
    title([ num2str(lp.fileIndx) '_' num2str(lp.mClusterIndx(1)) ' pNoExc' num2str(pNoExc,2)  ' pTH ' num2str(pTH) ' bgWin ' num2str(lp.bgWin) ' stat: ' lp.statTestType])
    %     if length(lp.mClusterIndx) > 1
    %         title([ num2str(lp.mClusterIndx(1)) '_' num2str(lp.mClusterIndx(2)) ' pTh=' num2str(pTH) ' bgWin ' num2str(lp.bgWin) ' pNoInhExc=' num2str(pNoInhExc) lp.statTestType])
    %     end
end

