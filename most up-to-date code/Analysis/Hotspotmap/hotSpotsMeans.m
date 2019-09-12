function [meanOn meanOff] = hotSpotsMeans(hotspotmapList)

meanOn=[];
meanOff=[];
stdOn=[];
stdOff=[];

for i=1:length(hotspotmapList)
    lp = hotspotmapList{i}.lp
    meanOn = [meanOn mean(lp.lightSpikesFRnew)];
    meanOff = [meanOff mean(lp.nonLightSpikes_allNew)];
    stdOn = [stdOn std(lp.lightSpikesFRnew)];
    stdOff = [stdOff std(lp.nonLightSpikes_allNew)];
end


figure
hold on
for i=1:length(meanOn)
    if meanOff(i) > meanOn(i)
        clr = '-ob';
    else
        clr='-or'
    end
    subplot(2,1,1)
    hold on;
    plot([0 1], [meanOff(i) meanOn(i)],clr)
    
    if stdOff(i) > stdOn(i)
        clr = '-ob';
    else
        clr='-or'
    end
    subplot(2,1,2)
    hold on;
    plot([0 1], [stdOff(i) stdOn(i)],clr)
    
end