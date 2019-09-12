function Rall =  responseMean(lpall, MOUSE_TYPE, MAX_HOTSPOT, stimuliSize, pValue)

%% plot exictatory response
figure
Rall=[];
for i=1:length(lpall)
    lp=lpall(i).lp;

    % only one mouse type
    if strcmp(lpall(i).mouseType, MOUSE_TYPE) == 0
        continue
    end
    
        
    % small spot size
    if lp.stimuliSize(1) < stimuliSize(1) | lp.stimuliSize(1) > stimuliSize(2)
        continue;
    end

    pVal = hotspotmapPvalue(lp, pValue,0);
    if length(find(pVal==1)) == 0
        continue;
    end
    % remove two big  hot spots and too small maps
    if length(find(pVal==1)) > MAX_HOTSPOT | length(pVal(:)) < 20
        continue;
    end
    
    
    [a,b]=find(pVal==1);
    for j=1:length(a)
    
        [tpAll] = plotTrialTime2(lp, [a(j) b(j)]  ,  [-300 300] ,0);
    
        [R, t,E] = mypsth(tpAll.data,lp.binSizePatch ,'r', [-0.2 0.3]);
    
        Rall(end+1,:).tpAll = tpAll;
        Rall(end,:).t=t;
        Rall(end,:).R= R;   
    end
end

%%

