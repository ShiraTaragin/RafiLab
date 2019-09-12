function [  ] = comparewave(fileidx, allclusters,figFlag)
if nargin < 3; figFlag = 1; end
if figFlag
figure; 
end
hold all;
labels = {};

for fi = 1:length(fileidx)
    [exp] = readExpDescFile(pwd); fileindx = fileidx(fi);
    
    if length(allclusters) == 1
    clusters = allclusters{1};
    else
        clusters = allclusters{fi};
    end
    
    for ci = 1:length(clusters)
        lp = initLightParam(exp, fileindx, 1); lp  = readLpData( lp, [-10 10], [1 1 1],clusters(ci));
        plot(mean(lp.wv), 'LINEWIDTH',2)
        labels{end+1} = [num2str(lp.fileIndx) '_' num2str(lp.mClusterIndx)];
    end
end
legend(labels)
hold off;
end

