% hotSpotMapDelay
% plot the hotmaps versus the delay in the time we start counting the
% spikes




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure;
START_DELAY = 50;
st=40;
ttt=0;
cc=0;
for ii=0:st:280 % how ms to delay calculations
    cc=cc+1;
    
    lp.DELAY_SPIKE_CALCULATION = ii/1000;
    lp.LIMIT_SPIKE_TIME_CALCULATION = 100/1000;
    
    calcLightFR

    % with the background in the lower part   
    hold on
    subplot(4,2,cc); 
    if lp.photoSpotMapDelayPlotFlag == 1
        imagesc([lp.xRange; 1; lp.xRange], lp.yRange, [reshape(lightSpikesFR, lp.xSize,lp.ySize)';...
            zeros(1,size(lp.xRange,1)); reshape(nonLightSpikes,lp.xSize,lp.ySize)']) ; colorbar;
    else
        imagesc([lp.xRange; 1; lp.xRange], lp.yRange, [reshape(lightSpikesFR, lp.dims(2),lp.dims(1))' ]) ; colorbar;
    end
    if (ttt+START_DELAY)/st == 1
        title([ num2str(lp.fileIndx) ' From: ' num2str(lp.DELAY_SPIKE_CALCULATION) ' to:' num2str(lp.DELAY_SPIKE_CALCULATION+lp.LIMIT_SPIKE_TIME_CALCULATION)]);
    else
        title([ 'From: ' num2str(lp.DELAY_SPIKE_CALCULATION) ' to:' num2str(lp.DELAY_SPIKE_CALCULATION + lp.LIMIT_SPIKE_TIME_CALCULATION)]);
    end
    
    ttt = ttt + st;
end
lp.LIMIT_SPIKE_TIME_CALCULATION = 0;
lp.DELAY_SPIKE_CALCULATION = 0;