function inhibtionDevelopOverTime(lp)

cn=0;
figure
for delay=[0:0.04:0.2]
    cn=cn+1;
    subplot(2,3,cn)
    lp.DELAY_SPIKE_CALCULATION=delay;
    lp.allSpots = 'allSpots'; 
    hotSpotMapPvalue(lp,0.05,2);
end