function [lp indx] = findLp(lpall, fileindx, cluster, dirStr)
lp=[];
for indx=1:length(lpall)
    
    lp=lpall(indx).lp;
    if lp.fileIndx ~= fileindx
        continue
    end
    
    if isempty(findstr(lp.dirPath, dirStr))
        continue
    end
    
    if sum(lp.mClusterIndx - cluster) == 0 
        break;
    end
end