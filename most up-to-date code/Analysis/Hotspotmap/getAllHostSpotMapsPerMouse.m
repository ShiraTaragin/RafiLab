function [hotspotMapsPerMouse] = getAllHostSpotMapsPerMouse(lpall, modelParam)
% count how many spots are ex and in
%%

minStimuliSize=modelParam.minStimuliSize;
MIN_NUM_OF_SPOTS=modelParam.MIN_NUM_OF_SPOTS;
th=modelParam.th;
MAX_HOTSPOT=modelParam.MAX_HOTSPOT;
MOUSE_TYPE=modelParam.MOUSE_TYPE;

hotspotMapsPerMouse=[];
mouseIndx=0;
prevDirPath=[]; hotspotMaps=[];

for i=1:length(lpall)
    i
    if isempty(findstr(lpall(i).mouseType, MOUSE_TYPE))
        continue
    end
    
    lp=lpall(i).lp;
    
    res = checkMapConfitions(lp, modelParam);
    if res > 0
         continue;
    end
    
    
    pVal = lp.pVal;

    % keep the cluster ids (habdle the case of single and multiple
    % elextrodes
    mClusterIndx = [lp.mClusterIndx -1*ones(1,3-length(lp.mClusterIndx))];
    
    if strcmp(lp.dirPath, prevDirPath) == 1 | isempty(prevDirPath)
        
        prevDirPath = lp.dirPath;
        
        hotspotMaps{end+1}.pVal = pVal;    
        hotspotMaps{end}.neuronNum = lp.fileIndx; 
        hotspotMaps{end}.mClusterIndx = mClusterIndx; 
        hotspotMaps{end}.dirPath = lp.dirPath;
        hotspotMaps{end}.Boundery = lp.Bounderies;
        hotspotMaps{end}.indx = i;
    else
        
        prevDirPath = lp.dirPath;
        
        hotspotMapsPerMouse{end+1} = hotspotMaps;
        hotspotMaps=[];
        
        hotspotMaps{end+1}.pVal = pVal;    
        hotspotMaps{end}.neuronNum = lp.fileIndx; 
        hotspotMaps{end}.mClusterIndx = mClusterIndx; 
        hotspotMaps{end}.dirPath = lp.dirPath;
        hotspotMaps{end}.Boundery = lp.Bounderies;
        hotspotMaps{end}.indx = i;

    end       
end


