
function [h,p] = compareTwoNeurosMap(lp1, lp2)


pVal = hotspotmapPvalue(lp1,0.05,0);

map=reshape(lp1.lightSpikesFRnew, lp1.dims(2), lp1.dims(1))';
bgmap=reshape(lp1.nonLightSpikes_allNew, lp1.dims(2), lp1.dims(1))';
exIndx = find(pVal == 1)';    

map=map(:);
bgmap=bgmap(:);

map([ exIndx]) = []; 
bgmap([ exIndx]) = [];

x1 = map-bgmap;

% second hotspot
pVal = hotspotmapPvalue(lp2,0.05,0);

map=reshape(lp2.lightSpikesFRnew, lp2.dims(2), lp2.dims(1))';
bgmap=reshape(lp2.nonLightSpikes_allNew, lp2.dims(2), lp2.dims(1))';
exIndx = find(pVal == 1)';    

map=map(:);
bgmap=bgmap(:);

map([ exIndx]) = []; 
bgmap([ exIndx]) = [];

x2 = map-bgmap;

[h,p]=ttest2(x1,x2)