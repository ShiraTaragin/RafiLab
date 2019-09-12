lp = calcLightFR(lp);
%lp = calcLightFRall(lp);





figure;
hold on;
xlbl = '';
clr ='brmk';

    
switch lp.scriptType
    case {'SIMULTAN STIMULI'}           
        stimuliRangeValues = 1:3;
        xlbl = ['1 - ' num2str(lp.events(1,:))  ' 3- ' num2str(lp.events(end,:)) ]
    case {'INTENSITY STIMULI'}
        xlbl = 'Intensity levels';
        stimuliRangeValues = (lp.intensityRange);
        if stimuliRangeValues(1) > stimuliRangeValues(end)
            stimuliRangeValues = fliplr(stimuliRangeValues);
        end
    case {'INTENSITY STIMULI N'}
        xlbl = 'Intensity levels';
        stimuliRangeValues = lp.events(:,1)';
        if lp.stimuliNum > 1
            stimuliRangeValues = reshape(stimuliRangeValues,2,length(stimuliRangeValues)/2);
        end
        
        
        lightSpikesFR_mean = reshape(lightSpikesFR_mean, lp.stimuliNum, length(lightSpikesFR_mean)/lp.stimuliNum);
        nonLightSpikes_mean = reshape(nonLightSpikes_mean, lp.stimuliNum, length(nonLightSpikes_mean)/lp.stimuliNum) ;      
        
        lightSpikesFR_std = reshape(lightSpikesFR_std, lp.stimuliNum, length(lightSpikesFR_std)/lp.stimuliNum) ;      
        nonLightSpikes_std = reshape(nonLightSpikes_std, lp.stimuliNum, length(nonLightSpikes_std)/lp.stimuliNum) ;      

        
    case {'DURATION STIMULI'}       
        stimuliRangeValues =lp.durationRange; %1:length(lightSpikesFR_mean);        
        
        xlbl = 'Duration'       ;


    case {'MANY STIMULI'}       
        stimuliRangeValues = 1:lp.stimuliListSize;        
        
        xlbl = 'Different patterns';      

    case {'MANY STIMULI WITH CONTROL'}       
        plotManyStimuliWithContol %(lp, lightSpikesFR_mean, lightSpikesFR_std, nonLightSpikes_mean, nonLightSpikes_std)
        return
end

% % in case we have only one point add a dummy point
% if length(nonLightSpikes_mean) == 1
%     nonLightSpikes_mean = [ -1 nonLightSpikes_mean];
%     nonLightSpikes_std= [0 nonLightSpikes_std];
%     lightSpikesFR_std = [-1 lightSpikesFR_std];
%     lightSpikesFR_mean = [ -1 lightSpikesFR_mean];
%     stimuliRangeValues = [ -1 stimuliRangeValues];
% end

% if size(lp.lightSpikesFR,2) == 1
%     lp.lightSpikesFR = lp.lightSpikesFR';
% end
% if size(nonLightSpikes_mean,2) == 1
%     nonLightSpikes_mean = lp.nonLightSpikes';
% end

subplot(2,1,1);
errm=[];errmbg=[];
for ii = 1:lp.stimuliListSize

    errm(end+1,:) =[mean(lp.lightFR{(ii)}) std(lp.lightFR{(ii)})./sqrt(length((lp.lightFR)))];
    
    errmbg(end+1,:) = [mean(lp.nonLightFR{(ii)})   std(lp.nonLightFR{(ii)})./sqrt(length((lp.nonLightFR)))];
    [~,p] = ttest(lp.lightFR{(ii)},lp.nonLightFR{(ii)});% ttest between bg&fg for each pattern.
    pVec(ii) = p;%pValues vector.
end

hold on;

% sort the signal according to the mean light-evoked response
[a,lp.SortedlightEvokedFrIndx] = sort(errm(:,1));
errm = errm(lp.SortedlightEvokedFrIndx,:);
errmbg = errmbg(lp.SortedlightEvokedFrIndx,:);
pVec = pVec(lp.SortedlightEvokedFrIndx);
% signal
errorbar(errm(:,1),errm(:,2),'r')
errorbar(errmbg(:,1),errmbg(:,2),'b')
title([ num2str(lp.fileIndx)  '_' num2str(lp.mClusterIndx) ' reps: ' num2str(lp.totalReps) ' ISI: ' num2str(lp.ISI) '#stimuli ' num2str(lp.stimuliNum) ' size: ' num2str(lp.stimuliSize)])
xlabel(xlbl)
ylabel('mean FR')
legend('fr', 'bg')
hold on;
for i = 1:length(pVec)
    if pVec(i) < 0.05/length(pVec)
        text(i,errm(i,1)+errm(i,2)+5,'*')
    end
end

    
% disp(['background and light mean fr : ' num2str([mean(nonLightSpikes_mean) mean(lightSpikesFR_mean)])])
% disp(['background and light mean+std fr : ' num2str([mean(nonLightSpikes_mean)+2*std(nonLightSpikes_mean) mean(lightSpikesFR_mean)+2*std(lightSpikesFR_mean)])])


% % plot also the max signal values in most of the time more accuate than
% % avarage
% [alltpAll, lpSaved] = readAllSignals(lp,  1);
% 
% 
% lp.maxFr = [];        lp.maxFrBg = [];
% for ii=1:length(alltpAll)       
%     lp.maxFr = [lp.maxFr max(alltpAll(ii).meanFR)];
%     lp.maxFrBg = [lp.maxFrBg     max(   alltpAll(ii).meanFRbg(max(length( alltpAll(ii).meanFRbg)-length(alltpAll(ii).meanFR),1):end)    )];
% end
% 
% if  findstr(lp.scriptType,'INTENSITY') > 0
%     lp.maxFr = fliplr(reshape(lp.maxFr,lp.stimuliNum ,length(lp.maxFr)/lp.stimuliNum ));
%     lp.maxFrBg = fliplr(reshape(lp.maxFrBg,lp.stimuliNum ,length(lp.maxFrBg)/lp.stimuliNum ));
% end
% 

% if strcmp(lp.scriptType, 'MANY STIMULI') == 0
%     lp.maxFr = reshape(lp.maxFr, lp.stimuliNum, length(lp.maxFr)/lp.stimuliNum);
%     lp.maxFr = fliplr(lp.maxFr);
%     lp.maxFrBg = reshape(lp.maxFrBg, lp.stimuliNum, length(lp.maxFrBg)/lp.stimuliNum);
%     lp.maxFrBg = fliplr(lp.maxFrBg);
% end

% plot the second pane of max values
subplot(2,1,2);

% for ii=1:size(stimuliRangeValues,1)
%         plot(stimuliRangeValues(ii,:), lp.maxFr(ii,:),clr(ii),'LINEWIDTH', 2)
%         hold on;
%         plot(stimuliRangeValues(ii,:), (lp.maxFrBg(ii,:)),'g','LINEWIDTH', 2)
%         PercentOfResponses = length(find([lp.maxFr(ii,:) - lp.maxFrBg(ii,:)] > 0))/length(lp.maxFr(ii,:))
%         title(['Max values, %of response: ' num2str(PercentOfResponses)])
%         ylabel('max FR')
% end
%     
% 
