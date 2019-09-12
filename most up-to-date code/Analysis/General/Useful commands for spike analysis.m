Useful commands for spike analysis:
[exp] = readExpDescFile(pwd); fileindx = __
lp = initLightParam(exp, fileindx, 1); lp = readLpData(lp, [-10 10], [1 1 1], 1);
hotSpotMap
toMclust(lp)
Mclust
plotSelectedRubrics(lp, [], 50, [-400 600]);
plotSelectedStaPattern(lp, STAevents, 0, 1);
drawWV([file cluster], [row column])
plotSniffPhase
plot(mean(lp.wv))