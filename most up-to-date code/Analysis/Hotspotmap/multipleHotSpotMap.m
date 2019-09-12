function [] = multipleHotSpotMap(fileidx, allclusters,plotSelectedFlag)
if nargin < 3
    plotSelectedFlag = 0;
end
for fi = 1:length(fileidx)
    [exp] = readExpDescFile(pwd); fileindx = fileidx(fi);
    if length(allclusters) == 1
        clusters = allclusters;
    else
        clusters = allclusters{fi};
    end
    if iscell(clusters)
        clusters = clusters{1};
    end
    for ci = 1:length(clusters)
        lp = initLightParam(exp, fileindx, 1); lp  = readLpData( lp, [-10 10], [1 1 1],clusters(ci));
        hotSpotMap
        if plotSelectedFlag
            plotSelected(lp)
        end
    end
end