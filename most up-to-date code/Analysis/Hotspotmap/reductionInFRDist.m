function [frDiff, percDiff, bgFr, inhStat] = reductionInFRDist(lpall, modelParam)
minStimuliSize=modelParam.minStimuliSize;
MIN_NUM_OF_SPOTS=modelParam.MIN_NUM_OF_SPOTS;
th=modelParam.th;
MAX_HOTSPOT=modelParam.MAX_HOTSPOT;
MOUSE_TYPE=modelParam.MOUSE_TYPE;

frDiff=[]; percDiff=[]; bgFr=[];
inhStat=[];
for i=1:length(lpall)

    % only one mouse type
    if strcmp(lpall(i).mouseType, MOUSE_TYPE) == 0
        continue
    end
    
    lp=lpall(i).lp;
    
    res = checkMapConfitions(lp,modelParam);
    if res > 0
         continue;
    end

    % remove two big  hot spots and too small maps
    pVal=lp.pVal;
    map = lp.map;
    bgmap=lp.bgmap;
    
    
    inx = find(pVal == 2);  
    frDiff = [frDiff [map(inx) - mean(lp.nonLightSpikesFR_unSorted)]'];
    
    percDiff = [percDiff [map(inx)./ mean(lp.nonLightSpikesFR_unSorted)]'];
    bgFr = [bgFr mean(bgmap(:))*ones(1,length(inx))];
    inhStat(end+1,:) = [length(pVal(:)) length(inx)];
    
end

