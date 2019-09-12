function [spikes, data] = specificPattern(lp)
SPIKE_WIDTH=1;
rasterStartPos = 1;
BG_RANGE = 200;  % how many ms before light we consider as bg
LIGHT_RANGE = 250; % how many ms after light off we take into the calculation of fr
data=[]; spikes=[];

% build the data.time structure
for i=1:size(lp.TTLEvents,2)
    ev = lp.TTLEvents(:,i);
    spikes(i).spikeTbefore = lp.t(find(lp.t < ev(1) & lp.t > (ev(1) - BG_RANGE/1000))) - ev(1);
    spikes(i).spikeTafter = lp.t(find(lp.t > ev(1) & lp.t < (ev(2) + LIGHT_RANGE/1000)))  - ev(1);
    data(i).times = [spikes(i).spikeTbefore spikes(i).spikeTafter];
    
end

%%
figure;
mypsth(data, lp.binSizePatch);

fr=[];
% plot spike raster
hold on;
for i=1:size(data,2)
    plot([data(i).times ; data(i).times ], [rasterStartPos*ones(1,length(data(i).times))+i; rasterStartPos*ones(1,length(data(i).times))+i+1] ,'k','LINEWIDTH',SPIKE_WIDTH )
    fr(i,:) = [sum(spikes(i).spikeTbefore > -0.2)/0.2; sum(spikes(i).spikeTafter < 0.15)/0.15];
end
axis([-0.15 0.2 0 100])
[h,p]=ttest(fr(:,1), fr(:,2))
title([ num2str(lp.fileIndx) '_' num2str(lp.mClusterIndx) ' fr before and after: ' num2str(mean(fr)) ' p=' num2str(p)])
