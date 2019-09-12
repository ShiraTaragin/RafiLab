function [spotStat]= spotsSpikeReduction(lpall, mouseType)
% for each spot in all experiment count how many spike he evoked
% we remove exciatatory spots

spotStat=[];
MAX_HOTSPOT=3;
percentOfReductionAll=[];
for i=1:length(lpall)
   
    if strcmp(lpall(i).mouseType, mouseType) == 0
        continue;
    end
    lp= lpall(i).lp;
    pVal = hotspotmapPvalue(lp,0.05,0);
    if length(find(pVal==1)) > MAX_HOTSPOT
        continue;
    end
    
    if length(pVal(:)) < 20
        continue;
    end
    
    % remove excitatory spots
    map=reshape(lp.lightSpikesFRnew, lp.dims(2), lp.dims(1))';
    bgmap=reshape(lp.nonLightSpikes_allNew, lp.dims(2), lp.dims(1))';
    exIndx = find(pVal == 1);        
    map(exIndx) = []; bgmap(exIndx) = [];
    
    mapdiff = map(:)-bgmap(:);
    spotStat(end+1).mapdiff = mapdiff;
    spotStat(end).meanDiff = mean(mapdiff);
    spotStat(end).spotNum = length(mapdiff);
    
end
    
allMeanDiff=[];
for i=1:length(spotStat)
    allMeanDiff(end+1) = spotStat(i).meanDiff;
end
mean(allMeanDiff)
