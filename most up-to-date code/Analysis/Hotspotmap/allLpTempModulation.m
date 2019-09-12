function [res, xxx] = allLpTempModulation(lpall, MOUSE_TYPE, MAX_HOTSPOT, stimuliSize, numOfBins, extBoundry, controlFlag)
xxx=[];
res=[];

for i=1:length(lpall)
    lp=lpall(i).lp;
    if lp.ISI < 0.4 | lp.totalReps < 16
        continue
    end

    % only one mouse type
    if strcmp(lpall(i).mouseType, MOUSE_TYPE) == 0
        continue
    end
            
    % remove two big  hot spots and too small maps
    pVal = hotspotmapPvalue(lp,0.05,0);
    if length(find(pVal==1)) > MAX_HOTSPOT | length(pVal(:)) < 20
        continue;
    end
    
    % small spot size
    if lp.stimuliSize(1) < stimuliSize(1) | lp.stimuliSize(1) > stimuliSize(2)
        continue;
    end

    [tpAll, rc]=lpTemporalModulation(lp, numOfBins, extBoundry, controlFlag);
    
    res(end+1,:) = [i rc];
    xxx = [xxx; tpAll(:,1)];
end

