function percentOfReductionAll= hotspotCirclesAll(lpall, mouseType, range, minStimuliSize, MAX_HOTSPOT, onlyPosteriorSpots)
% compre fr as a function of distance a cross all neurons

percentOfReductionAll=[];
for i=1:length(lpall)
   
    if strcmp(lpall(i).mouseType, mouseType) == 0
        continue;
    end
    lp = lpall(i).lp;
    
    pVal = hotspotmapPvalue(lp,0.05,0);
    if sum(sum(pVal)) == 0 continue; end
    if length(find(pVal==1)) > MAX_HOTSPOT | length(pVal(:)) < 20
        continue;
    end
           
    
    % ignore cases with specific spot size
    if lp.stimuliSize(1) < minStimuliSize(1) | lp.stimuliSize(1) > minStimuliSize(2)
        continue;
    end
    
    [resStrct]=hotspotCircles(lp, range, onlyPosteriorSpots, lpall(i).cen);
    
    if isempty(resStrct)
        continue;
    end
    
    percentOfReductionAll(end+1).percentOfReduction = resStrct.reductionRatePerLayer2;
    percentOfReductionAll(end).rng = resStrct.rng;
    percentOfReductionAll(end).stimuliSize = lp.stimuliSize;
    percentOfReductionAll(end).i = i;
    percentOfReductionAll(end).ratePerLayer = resStrct.ratePerLayer;
    percentOfReductionAll(end).meanReductionInFR = resStrct.meanReductionInFR;
end
    

