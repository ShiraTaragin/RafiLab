function [all_lps] = compareHotSpotsfromLPs(all_lps)
% compareHotSpots - presents hot spot maps of different experiments in one
% figure, along with waveform comparison.
f = figure;
% Calculate number of subplots based on number of clusters + 1
numfig = length(all_lps) + 1;
[subrows, subcolumns] = numPanels(numfig);

labels = {};
for i = 1:length(all_lps)

    % Load lp
    lp = all_lps(i).lp;
    % plot hot spot
    figure(f)
    subplot(subrows,subcolumns,i)
    if strcmp('STA',lp.scriptType(1:3))
        plotSTA(lp,lp.STAfinal,1)
        title([num2str(lp.fileIndx) '_' num2str(lp.mClusterIndx) ': ' num2str(lp.stimuliSize) ' pixels; ' num2str(lp.NumOfSpots) ' spots; ' num2str(lp.totalReps) ' reps'])
    else
        scanHotSpotMap_Shira(lp,1,f);
        title(['FG-B: ' num2str(lp.fileIndx) '_' num2str(clusterName)  ...
            '  pixels: ' num2str(lp.stimuliSize)]);
    end
    lp.figureHandle = f;
    
    % save lp
    all_lps(i).lp = lp;
     
    % Plot waveform
    subplot(subrows,subcolumns,subrows*subcolumns)
    hold all
    plot(mean(lp.wv), 'LINEWIDTH',2)
    labels{end+1} = [num2str(lp.fileIndx) '_' num2str(lp.mClusterIndx)];
    legend(labels)
    hold off
end
figure(f)

