function plotLpLightVsNoLight(lp)

lp = hotSpotMapPvalue(lp, 0.05, 0);
pval=lp.pVal;

inx=find(pval==0);

figure; 
scatter(lp.map(inx), lp.bgmap(inx));
hold all;
plot([0 max(lp.map(inx))], [0 max(lp.map(inx))])



xlabel('Light on')
ylabel('Light off')
[p]=signrank(lp.map(inx), lp.bgmap(inx))
title(['P value = ' num2str(p)])