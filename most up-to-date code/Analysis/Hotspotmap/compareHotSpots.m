function [all_lps] = compareHotSpots(fileidx, allclusters)
% compareHotSpots - presents hot spot maps of different experiments in one
% figure, along with waveform comparison.
f = figure;
% Calculate number of subplots based on number of clusters + 1
if length(allclusters) == 1
    clusters = allclusters{1};
    cluscount = length(clusters)*length(fileidx);
else
    clusters = reshape(cell2mat(allclusters),[],1);
    cluscount = length(clusters);
end
numfig = cluscount + 1;
[subrows, subcolumns] = numPanels(numfig);

plotcount = 0;
labels = {};
for fi = 1:length(fileidx)
    [exp] = readExpDescFile(pwd); fileindx = fileidx(fi);
    if length(allclusters) == 1
        clusters = allclusters;
    else
        clusters = allclusters{fi};
    end
    if iscell(clusters)
        clusters = clusters{1};
    end
    
    for ci = clusters
        plotcount = plotcount + 1;
        % Load lp
        lp = initLightParam(exp, fileindx, 1); lp  = readLpData( lp, [-10 10], [1 1 1], ci);
        % plot hot spot
        figure(f)
        subplot(subrows,subcolumns,plotcount)
        if strcmp('STA',lp.scriptType(1:3))
            hotSpotMap
            close(lp.figureHandle)
            figure(f)
            subplot(subrows,subcolumns,plotcount)
            plotSTA(lp,lp.STAfinal,1)
            title([num2str(lp.fileIndx) '_' num2str(lp.mClusterIndx) ': ' num2str(lp.stimuliSize) ' pixels; ' num2str(lp.NumOfSpots) ' spots; ' num2str(lp.totalReps) ' reps'])
        else
            scanHotSpotMap_Shira(lp,1,f);
             title(['FG-B: ' num2str(lp.fileIndx) '_' num2str(lp.mClusterIndx)  ...
            '  pixels: ' num2str(lp.stimuliSize)]);
        end
        lp.figureHandle = f;
        
        % save lp
        all_lps(plotcount).ID = [fileidx(fi) ci];
        all_lps(plotcount).lp = lp;
        
        
        % Plot waveform
        subplot(subrows,subcolumns,subrows*subcolumns)
        hold all
        plot(mean(lp.wv), 'LINEWIDTH',2)
        labels{end+1} = [num2str(lp.fileIndx) '_' num2str(lp.mClusterIndx)];
        legend(labels)
        hold off
    end
end
figure(f)

