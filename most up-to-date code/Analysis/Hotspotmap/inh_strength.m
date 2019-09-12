function [inhStrength] = inh_strength(lpall, MOUSE_TYPE, MAX_HOTSPOT, pTh)
% read all balance info
% calculate for each lp what is the lwoest number of glomeruli that balance
% the exciatatory response
inhStrength=[];
if ~exist('pTh', 'var')
    pTh = 0.05;
end
for i=1:length(lpall)
    lp=lpall(i).lp;

    if strcmp(lpall(i).mouseType, MOUSE_TYPE) == 0
        continue
    end
    
        
    pVal = hotspotmapPvalue(lp,pTh,0);
    if length(find(pVal==1)) > MAX_HOTSPOT
        continue;
    end
    
    if length(pVal(:)) < 20
        continue;
    end
      
    
    % rfind the inhibtiory spots
    map=reshape(lp.lightSpikesFRnew, lp.dims(2), lp.dims(1))';
    bgmap=reshape(lp.nonLightSpikes_allNew, lp.dims(2), lp.dims(1))';
    exIndx = find(pVal == 2);        
    if isempty(exIndx) 
        continue
    end
    
    inhStrength(end+1:end+length(exIndx)) = map(exIndx)./bgmap(exIndx);
    
end

