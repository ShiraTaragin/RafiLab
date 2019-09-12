function inhVsDistancePerNeuronAll = inhVsDistance(lpall, mouseType,  minStimuliSize, MAX_HOTSPOT)
%% compre fr as a function of distance a cross all neurons

inhVsDistancePerNeuronAll=[];
for i=1:length(lpall)
    %if ismember(i, [23 25 27 44 46]) continue; end
    
    inhVsDistancePerNeuron=[];
   
    if strcmp(lpall(i).mouseType, mouseType) == 0
        continue;
    end
    lp = lpall(i).lp;
    
    pVal = hotspotmapPvalue(lp,0.05,0);
    if length(find(pVal==1)) > MAX_HOTSPOT | length(pVal(:)) < 20
        continue;
    end
           
    
    % ignore cases with specific spot size
    if lp.stimuliSize(1) < minStimuliSize(1) | lp.stimuliSize(1) > minStimuliSize(2)
        continue;
    end
    
    map = reshape(lp.lightSpikesFRnew, lp.dims(2), lp.dims(1))';
    mapbg = reshape(lp.nonLightSpikes_allNew, lp.dims(2), lp.dims(1))';
    pVal = hotSpotMapPvalue(lp,0.05,0);
    
    
    % find the hotspot
    pValTemp = pVal;
    pValTemp(pValTemp==2) = 0;
    
    
    %if sum(sum(pValTemp)) == 0 continue; end       
    
%     if sum(sum(pValTemp)) > 0 
%         [~, b1] = max(sum(pValTemp));
%         [~, b2] = max(sum(pValTemp'));
%     else
        [a,b1] = max(max(map));
        [a,b2] = max(max(map'));
    %end
    cen=[b2,b1];
    centxy = [lp.xRange(cen(1,2)),  lp.yRange(cen(1,1)) ];

    % remove responding spots from the analysis
    map(find(pVal == 1)) = mean(mean(mapbg));
    
    % go over all spots and calculate and return inhVsDistancePerNeuron:
    % 1. the distance from the hotspot,
    % 2. The cahnge in spike rate compared to baseline
    % 3. wethear it is considered an inhibitory spot (e.g 2 for inh 1 for
    % exc 0 for none
    for j=1:1:size(pVal,1)
        for k=1:1:size(pVal,2)
           d = [j k] - cen ;
           d = d .* [lp.stimuliSize(1) lp.stimuliSize(2)];
           inhVsDistancePerNeuron(end+1,:) = [sqrt(sum(d.^2)) map(j,k) mapbg(j,k) pVal(j,k) j k i] ;
%            if inhVsDistancePerNeuron(end,1) == 0
%                inhVsDistancePerNeuron(end,:) = [];
%            end
        end
    end
    inhVsDistancePerNeuronAll(end+1).inhVsDistancePerNeuron = inhVsDistancePerNeuron;
end
    

