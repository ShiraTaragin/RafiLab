function balanceLoc = balance_E_I(lpall, MAX_HOTSPOT, MOUSE_TYPE)
% read all balance info
% calculate for each lp what is the lwoest number of glomeruli that balance
% the exciatatory response

balanceLoc=[];
for i=1:length(lpall)
    lp=lpall(i).lp;

    if strcmp(lpall(i).mouseType, MOUSE_TYPE) == 0
        continue
    end
    
    pVal = hotspotmapPvalue(lp,0.05,0);
    if length(find(pVal==1)) > MAX_HOTSPOT
        continue;
    end
        
    if length(pVal(:)) < 20
        continue;
    end

    [spotNum, balanceLoc(end+1,:)] = compareFr2Bg(lp, 0);
end

