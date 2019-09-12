function res = hotspotFr(lpall, MAX_HOTSPOT, MOUSE_TYPE, stimuliSize, pValue)
% return the number of exctotry spots in each neuron

res=[];
for i=1:length(lpall)
    lp=lpall(i).lp;
    
    map=reshape(lp.lightSpikesFRnew, lp.dims(2), lp.dims(1))';
    bgmap=reshape(lp.nonLightSpikes_allNew, lp.dims(2), lp.dims(1))';

    % mouse type
    if strcmp(lower(lpall(i).mouseType), lower(MOUSE_TYPE)) == 0
        continue
    end
    
    %  number of hotspots
    pVal = hotspotmapPvalue(lp,pValue,0);
    if length(find(pVal==1)) > MAX_HOTSPOT | length(pVal(:)) < 20
        continue;
    end
        
    % small spot size
    if lp.stimuliSize(1) < stimuliSize(1) | lp.stimuliSize(1) > stimuliSize(2)
        continue;
    end

    res = [res map(find(pVal == 1))'];
end

