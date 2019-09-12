function [exInCount] = distOfPercentOfInhSpots(lpall, MOUSE_TYPE, MAX_SPOT, minStimuliSize, th, MIN_NUM_OF_SPOTS)
% count how many spots are ex and in
%%
allSpots='';
statTestType='paired';

exInCount=[];
mouseIndx=0;
prevDirPath=[];
for i=1:length(lpall)
    if strcmp(lpall(i).mouseType, MOUSE_TYPE) == 0
        continue
    end
    
    lp=lpall(i).lp;
    
    res = checkMapConfitions(lp, MOUSE_TYPE,  minStimuliSize, MAX_SPOT, th, MIN_NUM_OF_SPOTS);
    if res > 0
         continue;
    end
    
    if strcmp(lpall(i).dirPath, prevDirPath) == 0
        mouseIndx = mouseIndx + 1;
        prevDirPath = lpall(i).dirPath;
    end
    exInCount(end+1,:) =[length(find(pVal==1)) length(find(pVal==2)) length(find(pVal==0)) i mouseIndx lp.stimuliSize(1)];
end


