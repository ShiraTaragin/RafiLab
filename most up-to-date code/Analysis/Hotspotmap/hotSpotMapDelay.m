% hotSpotMapDelay
% plot the hotmaps versus the delay in the time we start counting the
% spikes




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure;
START_DELAY = 20;
st=20;
ttt=-START_DELAY;
while (ttt+START_DELAY)/st+1 < 7 % how ms to delay calculations
    
    lp.DELAY_SPIKE_CALCULATION = ttt/1000;
    
    calcLightFR

    % with the background in the lower part   
    hold on
    subplot(3,2,(ttt+START_DELAY)/st+1); 
    if lp.photoSpotMapDelayPlotFlag == 1
        imagesc([lp.xRange; 1; lp.xRange], lp.yRange, [reshape(lightSpikesFR, lp.dims(2),lp.dims(1))';...
            zeros(1,size(lp.xRange,1)); reshape(nonLightSpikes,lp.xSize,lp.ySize)']) ; colorbar;
    else
        imagesc([lp.xRange; 1; lp.xRange], lp.yRange, [reshape(lightSpikesFR, lp.dims(2),lp.dims(1))' ]) ; colorbar;
    end
    if (ttt+START_DELAY)/st+1 == 1
        title([ (lp.datFile(end-9:end-4)) ' Delay: ' num2str(lp.DELAY_SPIKE_CALCULATION)]);
    else
        title([ 'Delay: ' num2str(lp.DELAY_SPIKE_CALCULATION)]);        
    end
    
    ttt = ttt + st;
end

lp.DELAY_SPIKE_CALCULATION = 0;