function x = estimateInhEx_FDR(lp, trialNum)
%%
x=[];
permutationTest=1;
lp.pTh=0.05;
for i=1:trialNum
    [pvals P1 ] = compareLightOnVsOff(lp, permutationTest);
    [a]=hotSpotMapPvalue(lp,0.05);
    close
    x=[x;length(find(P1==1)) length(find(P1==2))];
end
x=mean(x);