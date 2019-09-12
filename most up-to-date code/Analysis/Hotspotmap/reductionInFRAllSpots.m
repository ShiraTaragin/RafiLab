function [prcntDecline] = reductionInFRAllSpots(lpall, modelParam)

prcntDecline=[];
for i=1:length(lpall)

    % only one mouse type
    if strcmp(lpall(i).mouseType, modelParam.MOUSE_TYPE) == 0
        continue
    end
    
    lp=lpall(i).lp;
    
    res = checkMapConfitions(lp,modelParam);
    if res > 0
         continue;
    end

    % remove two big  hot spots and too small maps
    pVal = lp.pVal;
    indx= find(pVal == 2 | pVal == 0);
    % correct projector flip at the end of 2011
    map=lp.map;
    bgmap=lp.bgmap;
    prcntDecline = [prcntDecline length(find((bgmap(indx)-map(indx)) > 0))/length(indx)];
    
end

