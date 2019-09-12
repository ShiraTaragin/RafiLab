function [R,p, evokedMap1, evokedMap2] = compare2MTs(lp1, lp2, discardHotspotsFlag, th)
% conpute the correlation between two maps
% remove the hotspots so the corelation will be between the inhibitory
% spots

if nargin  < 3
    discardHotspotsFlag = 1;
end
if nargin  < 4
    th = 0.05;
end

plotFlag=0;
map1 = reshape(lp1.lightSpikesFRnew, lp1.dims(2), lp1.dims(1))';
bgmap1 = reshape(lp1.nonLightSpikes_allNew, lp1.dims(2), lp1.dims(1))';  

map2 = reshape(lp2.lightSpikesFRnew, lp2.dims(2), lp2.dims(1))';
bgmap2 = reshape(lp2.nonLightSpikes_allNew, lp2.dims(2), lp2.dims(1))';

map1=map1(:);
bgmap1=bgmap1(:);

map2=map2(:);
bgmap2=bgmap2(:);

if ~isempty(find(discardHotspotsFlag == 1))
    pval1 = hotSpotMapPvalue(lp1,th,plotFlag);
    pval2 = hotSpotMapPvalue(lp2,th,plotFlag);
    map1(find(pval1==1)) = bgmap1(find(pval1==1));
    map2(find(pval2==1)) = bgmap2(find(pval2==1));
    
end
if ~isempty(find(discardHotspotsFlag == 2))
    diff1 = map1-bgmap1;
    diff2 = map2-bgmap2;

    map1(find(diff1>=0)) = bgmap1(find(diff1>=0));
    map2(find(diff2>=0)) = bgmap2(find(diff2>=0));
end
if ~isempty(find(discardHotspotsFlag == 3))
    pval1 = hotspotmapPvalue(lp1,th,plotFlag);
    pval2 = hotspotmapPvalue(lp2,th,plotFlag);
    inhIndx = [find(pval1 == 2) find(pval2 == 2)];
    
    map1(inhIndx) = []; bgmap1(inhIndx) =[];
    map2(inhIndx) = []; bgmap2(inhIndx) = [];
end


evokedMap1 = (map1-bgmap1);
evokedMap2 = (map2-bgmap2);

[R,p] = corrcoef(evokedMap1(:), evokedMap2(:));

