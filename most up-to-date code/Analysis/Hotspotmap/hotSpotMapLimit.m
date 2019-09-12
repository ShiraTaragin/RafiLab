% hotSpotMapDelay
% plot the hotmaps versus the delay in the time we start counting the
% spikes




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure;
START_DELAY = 50;
st=START_DELAY ;
ttt=START_DELAY;
while (ttt+START_DELAY)/st+1 < 9 % how ms to delay calculations
    
    lp.LIMIT_SPIKE_TIME_CALCULATION = ttt/1000;
    
    calcLightFR

    % with the background in the lower part   
    hold on
    subplot(3,2,ttt/st); 
    if lp.photoSpotMapDelayPlotFlag == 1
        imagesc([lp.xRange; 1; lp.xRange], lp.yRange, [reshape(lightSpikesFR, lp.dims(2),lp.dims(1))';...
            zeros(1,size(lp.xRange,1)); reshape(nonLightSpikes,lp.xSize,lp.ySize)']) ; colorbar;
    else
        imagesc([lp.xRange; 1; lp.xRange], lp.yRange, [reshape(lightSpikesFR, lp.dims(2),lp.dims(1))' ]) ; colorbar;
    end
    if ttt/st == 1
        title([ (lp.datFile(end-9:end-4)) ' Limit: ' num2str(lp.LIMIT_SPIKE_TIME_CALCULATION)]);
    else
        title([ 'Limit: ' num2str(lp.LIMIT_SPIKE_TIME_CALCULATION)]);        
    end
     
    ttt = ttt + st;
end

lp.LIMIT_SPIKE_TIME_CALCULATION = 0;