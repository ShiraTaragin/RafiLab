function lp = scanHotSpotMap_Shira(lp, plotFlag, figureHandle)
if nargin < 2
    plotFlag = 4;
end
if nargin < 3
    figureHandle=[];
end
% lp.pTh = 0.01;
% calculate the light and non light FR

%laserDelayFlag  = 1; % if the light timimng was calculted based on the laser then we should fix the timing by ~10ms as it is not accurate



% read the event file

lp = calcLightFR(lp);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                plot the hotspot matrix
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% PLOT


lp.map=reshape(lp.lightSpikesFR, lp.dims(2), lp.dims(1))';
lp.bgmap = reshape(lp.nonLightSpikes, lp.dims(2), lp.dims(1))';
if ~exist('plotFlag','var')
    plotFlag=4;
end
if plotFlag   
    if isempty(figureHandle)
        figure; 
    end

     lightFr = reshape(lp.lightSpikesFR,lp.dims(2),lp.dims(1))';
     bgFr =  reshape(lp.nonLightSpikes,lp.dims(2),lp.dims(1))';

        zz= lightFr(:);
        xx = find(zz  > max(bgFr(:)));
        zz(xx) = mean(bgFr(:));
    
    
    if plotFlag == 1
        xx=findstr((lp.dirPath),'\');
        imagesc(lp.xRange+(lp.stimuliSize(2)/2)/lp.overlap(1), lp.yRange+(lp.stimuliSize(1)/2)/lp.overlap(1), ...
            (reshape(lp.lightSpikesFR-lp.nonLightSpikes, lp.dims(2), lp.dims(1))')); colorbar;
        title([lp.dirPath(xx(end-1):end) ' ' num2str(lp.fileIndx) '_' num2str(lp.mClusterIndx) num2str([lp.spikeChannelIndx lp.CSCfileIndx])  '  pixels: ' num2str(lp.stimuliSize)  ' t>' num2str(lp.minwv) ]);
    end
    
    if plotFlag == 2
%        imagesc(lp.xRange, lp.yRange, [reshape(lightSpikesFR,lp.xSize,lp.ySize)' ...
 %      - reshape(nonLightSpikes,lp.xSize,lp.ySize)']) ; colorbar;
        imagesc([lp.xRange; 1; lp.xRange], lp.yRange, [reshape(lp.lightSpikesFR, lp.dims(2),lp.dims(1))' ...
        ; zeros(1,size(lp.xRange,1)); reshape(lp.nonLightSpikes,lp.dims(2),lp.dims(1))']) ; colorbar;

            title([num2str(lp.fileIndx) '_' num2str(lp.mClusterIndx) num2str([lp.spikeChannelIndx lp.CSCfileIndx])   '  pixels: ' num2str(lp.stimuliSize)  ' t>' num2str(lp.minwv) ]);
    end

    if plotFlag == 3
        analyzeScanInhibition(lp)
    end

    if plotFlag == 4
        close
        figure('position', [60,60 1500 750]);
        rng = minmax(lp.lightSpikesFR);
%       
         subplot(2,3,1);
 
        % FR - bg (bg of the same trial)
        imagesc(lp.xRange, lp.yRange,...
            (reshape(lp.lightSpikesFR-lp.nonLightSpikes, lp.dims(2), lp.dims(1))) ); 
        
        colorbar;
         
        if isempty(lp.mClusterIndx) || lp.mClusterIndx <= 0
            clusterName = 0;
        elseif length(lp.mClusterIndx) > 1
            clusterName = lp.mClusterIndx(2);
        else
            clusterName = lp.mClusterIndx;
        end
        
        title(['FG-B: ' num2str(lp.fileIndx) '_' num2str(clusterName)  ...
             '  pixels: ' num2str(lp.stimuliSize)]);
        
%         title(['FG-B: ' num2str(lp.fileIndx) '_' num2str(clusterName)  ...
%             num2str([lp.spikeChannelIndx lp.CSCfileIndx])   '  pixels: ' ...
%             num2str(lp.stimuliSize)  ' t>' num2str(lp.minwv) ]);
%         Allows for specificity when using multiple channels

%         imagesc(lp.xRange, lp.yRange ,reshape(lp.nonLightSpikes,lp.dims(2),lp.dims(1))',rng)
%         colorbar;

        % fg +bg
%         bgMeanVal = mean(lp.nonLightSpikes);
%         imagesc([lp.xRange'; 1; lp.xRange'], lp.yRange, [reshape(lp.lightSpikesFR, lp.dims(2),lp.dims(1))' ...
%             ; bgMeanVal*ones(1,size(lp.xRange,2)); reshape(lp.nonLightSpikes,lp.dims(2),lp.dims(1))']) ; 
%         title(['fg and bg together  allSpots=' lp.allSpots])
%         colorbar;


    %%plot the response to light
    colorB = minmax([minmax(lp.lightSpikesFR),minmax(lp.nonLightSpikes)]);
        subplot(2,3,2);
        imagesc(lp.xRange, lp.yRange, reshape(lp.lightSpikesFR, lp.dims(2),lp.dims(1)))
        caxis(colorB)
        title(['FG (light) , ISI: ' num2str(lp.ISI) ' Sec'])
        colorbar
    %%plot the BG activity
        subplot(2,3,3);
        imagesc(lp.xRange, lp.yRange,reshape(lp.nonLightSpikes,lp.dims(2),lp.dims(1)))
        caxis(colorB)
        if strcmp(lp.scriptType,'SEQUENCE CENTER BULB SCANNING')
            title('BG, center-surround scan' )
        else
            title(['BG,  totol reps: ' num2str(lp.totalReps)])
        end
        colorbar
        
        % subtracting off from on
        subplot(2,3,4);
                
        [~, vartestP] = vartest2(lp.lightSpikesFR, lp.nonLightSpikes);
        analyzeScanInhibition(lp)
        title([ 'color= ' num2str(lp.clr(1)) ' Spike delay: ' num2str(lp.DELAY_SPIKE_CALCULATION) ' vartest ' num2str(vartestP)]);
        xlabel('ordinal spot number');
        ylabel('firing rate')


        % fr dist
        subplot(2,3,5);
        [a,b]=hist(lp.lightSpikesFR, 20);
        plot(b,a,'-or')
        hold on;
        [a,b]=hist(lp.nonLightSpikes, 20);
        plot(b,a,'-ob')

        [~, ksP] = kstest2(lp.lightSpikesFR, lp.nonLightSpikes);

        title(['Light and bg fr dist ks= ' num2str(ksP)])
        xlabel('firing rate')
        ylabel('count')
        
        subplot(2,3,6);
%         hist(lightFr(:) - mean(mean(bgFr)),20);
%         xlabel('FR')
        % compare avearge response value of BG and ligh stimuli
        
        [H, P] =ttest2(lightFr(:),bgFr(:));
        [h1, p1]=ttest2(bgFr(:), zz);
%         if strcmp(lp.scriptType,'SEQUENCE CENTER BULB SCANNING') == 1
% %             lp = centerScanPvalue(
%         else
         lp = hotSpotMapPvalue(lp,lp.pTh,2);  
%         end
        colorbar
        
%         subplot(2,3,2); 
%         bgmap = lp.bgmap(:);
%         map = lp.map(:);
%         
%         ndx = find(lp.pVal==0);                
%         plot([bgmap(ndx)'; map(ndx)'],'--g');
%         hold on;
%         plot([mean(bgmap(ndx))'; mean(map(ndx)')],'g','LINEWIDTH',3);
% 
%         ndx = find(lp.pVal==2);
%         plot([bgmap(ndx)'; map(ndx)'],'b');
%         hold on;
%         plot([mean(bgmap(ndx)'); mean(map(ndx)')],'b','LINEWIDTH',2);
% 
%         ndx = find(lp.pVal==1);
%         plot([bgmap(ndx)'; map(ndx)'],'r');
%         plot([mean(bgmap(ndx)'); mean(map(ndx)')],'r','LINEWIDTH',2);
% 
%         plot(0.9,mean(lp.bgVector), 'm*')
%         xlim([0.8 2.2])
%         title([ 'reps: '  num2str(lp.ActualRepUsed)  ' clr ' num2str(lp.clr) ' ISI: ' num2str(lp.ISI) ' Delay: ' num2str(lp.DELAY_SPIKE_CALCULATION)]);

    end    
end


disp(['Total with light versus background total response: '     num2str(sum(lightFr(:) ),3) '('  num2str(std(lightFr(:) ),2)  ') '  num2str(sum(bgFr(:)),3) '('  num2str(std(bgFr(:) ),2) ')' ])
disp(['When ignoring the hot spots: '     num2str(sum(zz),3) '('  num2str(std(zz ),2)  ') '  num2str(sum(bgFr(:)),3) '('  num2str(std(bgFr(:) ),2) ')' ])
        

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


disp('statitics')
disp('-----------------')
disp('mean reduction in fr: mean median and range')
inhIndx = find(lp.pVal == 2);
if ~isempty(inhIndx)
    [mean(lp.bgmap(inhIndx) - lp.map(inhIndx)) median(lp.bgmap(inhIndx) - lp.map(inhIndx)) minmax(lp.bgmap(inhIndx) - lp.map(inhIndx))]
end