function frMinusBg = compareFr2BgAll(lpall, mouseType, minStimuliSize, MAX_HOTSPOT, activeSpotRate)
% check wht a is the difference between fr and bg when we assume X% are
% 
% active
frMinusBg=[];
for i=1:length(lpall)
   
    if strcmp(lpall(i).mouseType, mouseType) == 0
        continue;
    end
    lp = lpall(i).lp;
    pVal = hotspotmapPvalue(lp,0.05,0);
    if length(find(pVal==1)) > MAX_HOTSPOT 
        continue;
    end
    
    % ignore cases with specific spot size
    if lp.stimuliSize(1) < minStimuliSize(1) | lp.stimuliSize(1) > minStimuliSize(2)
        continue;
    end
    
    [spotNum, balanceLoc] = compareFr2Bg(lp, 0, activeSpotRate);   
    if isempty(spotNum) continue; end
    
    x = find(spotNum(:,1)./spotNum(:,end) < activeSpotRate);
    if ~isempty(x)
        x=x(end);
        frMinusBg(end+1) = spotNum(x,3)-spotNum(x,4);
    end        
end
    

