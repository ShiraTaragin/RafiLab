function [lightOnOffRatio, p] = hotspotMedianDist(hotspotmapList, color)
% calculate media for each hotspot map and compare before and after light
% on
if nargin < 2
    color = 'b';
end


allChange=[];
removeSpots=[];
lightOn=[];
lightOff=[];

for i=1:length(hotspotmapList)

    lp=hotspotmapList{i}.lp;
    lightOn(end+1) = median(lp.lightSpikesFRnew);
    lightOff(end+1) = median(lp.nonLightSpikes_allNew);
end

lightOnOffRatio = lightOn./lightOff;
[h,p]=ttest(lightOn, lightOff)

% plot the bedirected graph
hold on;;
for i=1:length(lightOn)
    plot([1 2] , [1 lightOn(i)./lightOff(i)],['o-' color], 'LINEWIDTH', 2);    
    hold on;
end
box off;



% % scatter plot
% figure
% scatter(lightOn,lightOff);
% hold on;
% plot([0 70], [0 70],'g' )
% [h p]=ttest(lightOff, lightOn)
% xlabel('Light-'); ylabel('Light+')
% 
% lightOn./lightOff