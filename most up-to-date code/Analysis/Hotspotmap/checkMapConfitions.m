function res = checkMapConfitions(lp, modelParam)
% res = 0 means everything is ok

minStimuliSize=modelParam.minStimuliSize;
MIN_NUM_OF_SPOTS=modelParam.MIN_NUM_OF_SPOTS;
th=modelParam.th;
MAX_HOTSPOT=modelParam.MAX_HOTSPOT;
MOUSE_TYPE=modelParam.MOUSE_TYPE;
anest = modelParam.anest;
neuronType = modelParam.neuronType;

res=0;
% number of reps
if lp.ActualRepUsed < 10
    res=1;
end


% ignore cases with specific spot size
if lp.stimuliSize(1)*lp.exp.pixelSize/10 < minStimuliSize(1) | lp.stimuliSize(1)*lp.exp.pixelSize/10 > minStimuliSize(2)
    res=4;
    return;
end

%lp = hotSpotMapPvalue(lp,th,0);
pVal=lp.pVal;
if sum(sum(pVal)) == 0 % no response
    res=2; 
    return;
end  

if length(pVal(:)) < MIN_NUM_OF_SPOTS
    res=3;
    return;
end

if length(find(pVal==1))/length(pVal(:)) > MAX_HOTSPOT/100
    res = 5;
    return
end       
if mean(lp.bgmap(:)) <  modelParam.minBgFr
    res=61;
    return
end


% if we dont care about the type:
if strcmp(modelParam.neuronType, '')
    return
end
% if we want MT or MC find which one is it:
neuronType = MitralOrTufted(lp.phaseStatNull, modelParam.mtRange);
if strcmp(modelParam.neuronType, neuronType) == 1
    return;
else
    res=99;
end
