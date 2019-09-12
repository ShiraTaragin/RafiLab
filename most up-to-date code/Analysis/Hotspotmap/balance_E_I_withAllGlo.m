function [p, vals, allSpotsDiffValues] = balance_E_I_withAllGlo(lpall, MOUSE_TYPE, MAX_HOTSPOT, stimuliSize, MAP_PART, removeExSpots , removeInhSpots)
% p(:,1) comapre all spots bg to fr (ttest)
% p(:,2) contains a random shuffle test for p(1) (comparing bg to fr
% shuffeled)
% p(:,3) is the percent of spots that caused a reduction in FR.
% vals:
%  1) mean(fr)-mean(bg), 2) number of spots < 0, 3) num of spots >0 and 4) num of spots ==0
% 5) total num of spots  6) mean(bgmap) 7) mean(map) 8) the index i 9) median(map) - median(bgmap);
% spotsDiff return all spots diff in one long array
% MAP_PART can check above or below the excitatory spots
allSpotsDiffValues=[];

if ~exist('MAP_PART', 'var')
    MAP_PART = 'all'; % all surrounding glo
end
vals=[];
p=[];

for i=1:length(lpall)
    lp=lpall(i).lp;

    % only one mouse type
    if strcmp(lpall(i).mouseType, MOUSE_TYPE) == 0
        continue
    end
            
    % remove two big  hot spots and too small maps
    pVal = hotspotmapPvalue(lp,0.05,0);
    if length(find(pVal==1)) > MAX_HOTSPOT | length(pVal(:)) < 20
        continue;
    end
    
%     if length(find(pVal==1)) == 0
%         continue;
%     end

    % small spot size
    if lp.stimuliSize(1) < stimuliSize(1) | lp.stimuliSize(1) > stimuliSize(2)
        continue;
    end

    % correct projector flip at the end of 2011
    map=reshape(lp.lightSpikesFRnew, lp.dims(2), lp.dims(1))';
    bgmap=reshape(lp.nonLightSpikes_allNew, lp.dims(2), lp.dims(1))';       
    str = [findstr('2010', lp.dirPath) findstr('2011', lp.dirPath)];
    str2 = findstr('Nov 2011', lp.dirPath);
    if ~isempty(str) & isempty(str2) % 2000 or 2011 but not november 2011
        pVal = flipud(pVal);
        map = flipud(map);
        bgmap = flipud(bgmap);
    end
    
    [a,rc] = max(max(map'));  % the row of the excitatory spots (hotspot center)
    
    switch (MAP_PART)
        case {'all'}

            
        case {'posterior'}       
            pVal = pVal((rc):end,:);
            map = map((rc):end,:);
            bgmap = bgmap((rc):end,:);
                                   
        case {'anterior'}
            
            pVal = pVal(3:(rc),:);
            map = map(3:(rc),:);
            bgmap = bgmap(3:(rc),:);

        otherwise
            error('not implimented')
    end

    % remove ex and in spots

    inIndx = []; exIndx=[];

    pVal=pVal(:);
    map=map(:);
    bgmap=bgmap(:);        
    
    if removeExSpots
        exIndx = find(pVal == 1)';
    end
    if removeInhSpots
        inIndx = find(pVal == 2)';
    end
        
    if size(inIndx,1) > 1 inIndx = inIndx'; end
    if size(exIndx,1) > 1 exIndx = exIndx'; end
    
    map([exIndx inIndx]) = [];
    bgmap([exIndx inIndx]) = [];
    
    
    [h,p(end+1,1)] = ttest2(map,bgmap, 0.05,'left');
    % shuffeling analysis
    allmap = [map bgmap]; allmap=allmap(:);
    pr = randperm(length(allmap));
    [h, p(end,2) ] = ttest2(allmap(pr(1:length(map))), allmap(pr(length(map)+1:end)), 0.05,'left');
        
    mapDiff = map-bgmap;
    vals(end+1,1:9) = [(mean(map) - mean(bgmap)) length(find(mapDiff< 0)) length(find(mapDiff > 0)) length(find(mapDiff == 0)) length(mapDiff(:)) mean(bgmap) mean(map)  (median(map) - median(bgmap)) i];
    
    
    

    allSpotsDiffValues = [ allSpotsDiffValues (map-mean(bgmap))'];
end

