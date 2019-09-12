function [inhVsDistancePerNeuronAll, mapSize, allPercent]= inhVsDistance(lpall,modelParam)
%% compre fr as a function of distance a cross all neurons
minStimuliSize=modelParam.minStimuliSize;
MIN_NUM_OF_SPOTS=modelParam.MIN_NUM_OF_SPOTS;
th=modelParam.th;
MAX_HOTSPOT=modelParam.MAX_HOTSPOT;
MOUSE_TYPE=modelParam.MOUSE_TYPE;

mapSize=[]; allPercent=[];

inhVsDistancePerNeuronAll=[];
for i=1:length(lpall)
    
    inhVsDistancePerNeuron=[];
   
    if strcmp(lpall(i).mouseType, MOUSE_TYPE) == 0
        continue;
    end
    
    if lpall(i).twoBulbs == 1 
        disp([' two bulbs: ' num2str(i)])        
    end
    
    lp = lpall(i).lp;
    cen = lpall(i).cen;
    
    res = checkMapConfitions(lp, modelParam);
    if res > 0
         continue;
    end
    
    stimuliSize = lp.stimuliSize*lp.exp.pixelSize/10;
    
    pVal = lp.pVal;
    map = lp.map;
    mapbg = lp.bgmap;
    
    

    [a,b1] = max(max(map));
    [a,b2] = max(max(map'));

    if isempty(cen)
        cen=[b2, b1];   
    else
        cen
    end
    
    %pVal = hotspotmapPvalue(lp,th,1);
    
    centxy = [lp.xRange(cen(1,2)),  lp.yRange(cen(1,1)) ];
    

    % remove responding spots from the analysis
    map(find(pVal == 1)) = mean(mean(mapbg));
    mapSize = [mapSize length(map(:))];
    
    % go over all spots and calculate and return inhVsDistancePerNeuron:
    % 1. the distance from the hotspot,
    % 2. The cahnge in spike rate compared to baseline
    % 3. wethear it is considered an inhibitory spot (e.g 2 for inh 1 for
    % exc 0 for none
    for j=1:1:size(pVal,1)
        for k=1:1:size(pVal,2)
           d = [j k] - cen ;  % distance from hotspot
           d = d .* [stimuliSize(1) stimuliSize(2)];
           inhVsDistancePerNeuron(end+1,:) = [sqrt(sum(d.^2)) map(j,k) mapbg(j,k) pVal(j,k) j k i] ;
%            if inhVsDistancePerNeuron(end,1) == 0
%                inhVsDistancePerNeuron(end,:) = [];
%            end
        end
    end
    allPercent(end+1) = length(find(inhVsDistancePerNeuron(:,4)==2))/size(inhVsDistancePerNeuron,1);
    inhVsDistancePerNeuronAll(end+1).neuronIndx = i
    inhVsDistancePerNeuronAll(end).inhVsDistancePerNeuron = inhVsDistancePerNeuron;
    inhVsDistancePerNeuronAll(end).cen = cen;
    inhVsDistancePerNeuronAll(end).pVal = pVal;
end
    

