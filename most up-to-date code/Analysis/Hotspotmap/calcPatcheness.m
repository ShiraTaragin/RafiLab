function [patchnessValues]= calcPatcheness(lpall, mouseType,  minStimuliSize, MAX_HOTSPOT, randomOn)
%% compre fr as a function of distance a cross all neurons
patchnessValues=[];

for i=1:length(lpall)
       
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
    
    numOfInhSpots = length(pVal == 2);
    pVal(find(pVal==1)) = 0;
    pVal(find(pVal==2)) = 1;


    patchness = 0;
    if randomOn 
        res = assessRanomPatchness(pVal);
        patchness = [mean(res) std(res)];        
    else
        patchness = assessPatchness(pVal);
    end
    patchnessValues = [patchnessValues patchness];
                
end
    

