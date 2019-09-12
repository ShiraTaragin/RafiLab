function [ percentOfFrReduction] = processDistances(percentOfReductionAll, range, minStimuliSize, MAX_HOTSPOT)

% plot distance and inhibiton frequency
GRAIN = range(2)-range(1);
percentOfFrReduction=zeros(length(percentOfReductionAll),10);   % vector of 15 zeros should be large enough
allCount = percentOfFrReduction; % how many trials we have in each distance
ratePerLayer = nan*ones(size(percentOfReductionAll,2),10);   % vector of 15 zeros should be large enough
meanReductionInFR = nan*ones(size(percentOfReductionAll,2),10);   % vector of 15 zeros should be large enough

for i=1:length(percentOfReductionAll)
    if isempty(percentOfReductionAll(i).percentOfReduction)
        continue;
    end
    %indx=(percentOfReductionAll(i).rng-percentOfReductionAll(i).rng(1))/GRAIN+1;
    
    % the % of reduction in FR (relative to 100%)
    indx = 1:length(percentOfReductionAll(i).percentOfReduction');
    percentOfFrReduction(i, indx) = percentOfReductionAll(i).percentOfReduction';    
    
    % The percent of inhibitory spot in eahc layer
    ratePerLayer(i, indx) = percentOfReductionAll(i).ratePerLayer(1:length(indx),1)./percentOfReductionAll(i).ratePerLayer(1:length(indx),2);    
    allCount(indx) = allCount(indx) + 1;  
    meanReductionInFR(i,1:length(percentOfReductionAll(i).meanReductionInFR)) = percentOfReductionAll(i).meanReductionInFR;
end

% Compute the strength of inhbition per distance
percentOfFrReduction(find(percentOfFrReduction==0)) = nan;
x1Len = sum(~isnan(percentOfFrReduction));
x1=[nanmean(percentOfFrReduction); nanstd(percentOfFrReduction)./sqrt(x1Len) ]';
x1(isnan(x1(:,1)),:)=[];
    
% plot
%%%%%%%%%%%%%%%%%%%%
figure
subplot(1,3,1)
errorbar(range(1:end-1), x1(:,1), x1(:,2)); title('mean fr/bg per layer')
hold all;
plot([1 120], [1 1],':k')

% percent of inhibitory spots per layer
x2Len = sum(~isnan(ratePerLayer));
x2=[nanmean(ratePerLayer); nanstd(ratePerLayer)./sqrt(x2Len)]';
x2(isnan(x2(:,1)),:)=[];
subplot(1,3,2)
errorbar(range(1:end-1), x2(:,1), x2(:,2)); title('rate of inhibitory spots per layer')

box off;

x3Len = sum(~isnan(meanReductionInFR));
x3= [nanmean(meanReductionInFR); nanmean(meanReductionInFR)./sqrt(x3Len)]';
x3(isnan(x3(:,1)),:)=[];
subplot(1,3,3)
errorbar(range(1:size(x3,1)), x3(:,1), x3(:,2)); title('mean redution in fr from ihibitory spots per layer')
hold all;
plot([1 120], [0 0],':k')

axis([0 120 -25 20])
% compute when they are signifcance
subplot(1,3,1)
for i=1:length(range)
    [h,p]=ttest(percentOfFrReduction(~isnan(percentOfFrReduction(:,i)),i)-1);
    if p < 0.05
        text(range(i), 1.1, '*')
    end
    if p < 0.01
        text(range(i), 1.1, '**')
    end
    if p < 0.001
        text(range(i), 1.1, '***')
    end
end
        
title(['spot size: ' num2str(minStimuliSize) ' max hotspot number '  num2str(MAX_HOTSPOT)])



