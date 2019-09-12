function [pValueList] = hotspotPvalueDist(hotspotmapList, pTH, shuffelingFalg, plotFlag)
% claculate the inhibition, excitation rates in ll out hotspot maps
% you need to run first:
% readHotspotList or load 'data\Analysis\hotspotmapList'

if ~exist('plotFlag', 'var')
    plotFlag = 1;
end
if ~exist('pTH', 'var')
    pTH = 0.05;
end
if ~exist('shuffelingFalg', 'var')
    shuffelingFalg=0;
end

MAX_HOTMAP_SIZE = 73;
MIN_HOTMAP_SIZE  = 30;

pValueList=[];
pValueListSpotNum=[];
for i=1:length(hotspotmapList) %[1 3 6 10 13 14 16:20 22:27]
    lp=hotspotmapList{i}.lp;
    if shuffelingFalg
        hotSpotMap;
        close
    end
    pValueMap = hotspotMapPvalue(lp, pTH);

    pValueList(end+1,1 ) = length(find(pValueMap>1)); % inhibition
    pValueList(end,2 ) = length(find(pValueMap==1));  % excitation  
    pValueList(end,3 ) = length(pValueMap(:));        % total number of spots
 
end

%% % remove maps that are too big or too small
x = find(pValueList(:,3) > MAX_HOTMAP_SIZE | pValueList(:,3) < MIN_HOTMAP_SIZE );
pValueList(x,:)=[];
% plot the result
disp('mean and std of number of inh and exc spots')
[mean(pValueList(:,1)) std(pValueList(:,1))]
[mean(pValueList(:,2)) std(pValueList(:,2))]
%%

%%
if plotFlag
    
    % plot summary of % of inh and exc
    figure;
    bar([mean(pValueList(:,1)./pValueList(:,3))*100 mean(pValueList(:,2)./pValueList(:,3))*100])
    title(['inhib excit summary dist'])
    ylabel('Percent')
    box off


    figure;
    boxplot([pValueList(:,1)./pValueList(:,3)*100; pValueList(:,2)./pValueList(:,3)*100]', [ones(1,size(pValueList,1)) 2*ones(1,size(pValueList,1))])
    [h,p]=ttest2(pValueList(:,1)./pValueList(:,3)*100, pValueList(:,2)./pValueList(:,3)*100)
    title(['inhib excit summary dist p=' num2str(p)  ' maps sizes:' num2str(min(pValueList(:,3))) ' to ' num2str(max(pValueList(:,3)))])
    ylabel('Percent')
    box off
    return

    %%
    % a scatter plot of the relation between exc and inh spots
    figure;
    plotNoiseX = rand(1,size(pValueList,1))/10;
    plotNoiseX = plotNoiseX - mean(plotNoiseX);
    plotNoiseY = rand(1,size(pValueList,1))/10;
    plotNoiseY = plotNoiseX - mean(plotNoiseX);
    
    scatter(pValueList(:,2)./pValueList(:,3)*100 + plotNoiseX', pValueList(:,1)./pValueList(:,3)*100+plotNoiseY')
    title(['% of exc Vs % of inh #of maps:' num2str(size(pValueList,1))])
    xlabel('% of exc');
    ylabel('% of inh');
    box off
    
    %%
    % calc ratios per exc spots number
    inhib2ExcitRatio=[];
    resul =1;
    for pth=0:resul:50 %max(pValueList(:,2)')
        x=find(pValueList(:,2) == pth)';
        if ~isempty(x)
            inhib2ExcitRatio(end+1,1:2) = [mean(pValueList(x,1)./pValueList(x,3)) mean(pValueList(x,2)./pValueList(x,3))]*100;
        end
    end
    

    figure;
    plotNoiseX = rand(1,size(inhib2ExcitRatio,1))/10;
    plotNoiseX = plotNoiseX - mean(plotNoiseX);
    plotNoiseY = rand(1,size(inhib2ExcitRatio,1))/10;
    plotNoiseY = plotNoiseX - mean(plotNoiseX);
    
    scatter(inhib2ExcitRatio(:,1)+plotNoiseX', inhib2ExcitRatio(:,2)+plotNoiseY')
    title(['exc Vs inh percent of spots #of ratios:' num2str(size(inhib2ExcitRatio,1))])
    ylabel('exc %')
    xlabel('inh %')
    box off
    %%
% 
%     % plot per number of exc spots how the percent of exc and inh spots
%     figure
%     plot(0:resul:max(pValueList(:,2)),inhib2ExcitRatio(:,1)); % number of exc spots inh ratio
%     hold on;
%     plot(0:resul:max(pValueList(:,2)),inhib2ExcitRatio(:,2),'r');
%     xlabel('Number of excitation spots')
%     ylabel('Percent of spots')
%     legend('Inhibition', 'Excitation')
%     title(['inhib excit dist; map sizes: ' num2str(min(pValueList(x,3))) ' to ' num2str(max(pValueList(x,3)))])
%     box off
%     
end
%%