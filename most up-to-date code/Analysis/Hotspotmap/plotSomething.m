% read all balance info
%%
MOUSE_TYPE='TBET'
for i=1:length(lpall)
    if strcmp(lpall(i).mouseType, MOUSE_TYPE) == 0
        continue
    end
    
    lp=lpall(i).lp;
    hotspotmapPvalue(lp,0.05,1)
end
