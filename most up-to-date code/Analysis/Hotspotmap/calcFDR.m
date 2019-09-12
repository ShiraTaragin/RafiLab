function [fdr]= calcFDR(lpall, mouseType,  minStimuliSize, MAX_HOTSPOT)
%% compre fr as a function of distance a cross all neurons
% fdr(1) is the number of excitatory spots, fdr(2) and fdr(3) are the size
% of the map
fdr=[];

for i=1:length(lpall)
       
    if strcmp(lpall(i).mouseType, mouseType) == 0
        continue;
    end
    lp = lpall(i).lp;
    
    
    res = checkMapConfitions(lp,  minStimuliSize, MAX_HOTSPOT, th, MIN_NUM_OF_SPOTS);
    if res > 0
         continue;
    end
    
    pVal = hotSpotMapPvalue(lp,0.05,0);
    
    fdr(end+1,:) = [length(find(pVal == 1)) size(pVal,1) size(pVal,2)];

                
end
    

