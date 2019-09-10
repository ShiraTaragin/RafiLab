function [] = alltoMclust(files)
% Sends several experiment files - all from the same location - to Mclust
% for sorting
for i = 1:length(files)
    [exp] = readExpDescFile(pwd); fileindx = files(i);
    lp = initLightParam(exp, fileindx, 1); lp = readLpData(lp, [-10 10], [1 1 1],'samePlace');
    toMclust(lp);
end