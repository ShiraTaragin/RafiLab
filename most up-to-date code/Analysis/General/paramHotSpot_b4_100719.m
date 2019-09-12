
lp = calcLightFRall(lp);



lightSpikesFR_mean = [];
lightSpikesFR_std=[];
nonLightSpikes_mean = [];
nonLightSpikes_std= [];
% reShape the non lights events
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%I = fliplr(I');  % we sort in increased order

% resort the events according to thier spot position
[a,I,ocur] = mySortRow(lp.eventsLog(1:min(length(lp.TTLEvents), length(lp.eventsLog)),1:2));
lp.lightSpikesFR_all = lp.lightSpikesFR;


%Calculate the average per group
for ii=1:length(ocur)-1 
    lp.eventIDs{ii} = I(ocur(ii):ocur(ii+1)-1);
    lp.lightFR{ii} = lp.lightSpikesFRNotSorted(lp.eventIDs{ii});
    lp.nonLightFR{ii} = lp.nonLightSpikes_all(lp.eventIDs{ii});
end

lp.lightSpikesFRnew = [];
lp.nonLightSpikes_allNew = [];

for ii=1:length(ocur)-1 
    switch (lp.FR_CALC_METHOD)
        case {'max'}
            lp.lightSpikesFRnew(end+1) = max(lp.lightFR{ii});
            lp.nonLightSpikes_allNew(end+1) = max(lp.nonLightFR{ii});
        case {'percent'}
            lp.lightSpikesFRnew(end+1) = percent(lp.lightFR{ii});
            lp.nonLightSpikes_allNew(end+1) = percent(lp.nonLightFR{ii});
        case {'median'}
            lp.lightSpikesFRnew(end+1) = median(lp.lightFR{ii});
            lp.nonLightSpikes_allNew(end+1) = median(lp.nonLightFR{ii});
        otherwise
            lp.lightSpikesFRnew(end+1) = mean(lp.lightFR{ii});
            lp.nonLightSpikes_allNew(end+1) = mean(lp.nonLightFR{ii});
    end
end   
lp.lightSpikesFR = lp.lightSpikesFRnew;
lp.nonLightSpikes = lp.nonLightSpikes_allNew;

% reShape the non lights events (it is the BG of only the first spot event
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


figure;
hold on;
xlbl = '';
clr ='brmk';

lp.lightSpikesFR_mean = lightSpikesFR_mean;
    
switch lp.scriptType
    case {,'SIMULTAN STIMULI'}           
        xValue = 1:3;
        xlbl = ['1 - ' num2str(lp.events(1,:))  ' 3- ' num2str(lp.events(end,:)) ]
    case {,'INTENSITY STIMULI'}
        xlbl = 'Intensity levels';
        xValue = (lp.intensityRange);
        if xValue(1) > xValue(end)
            xValue = fliplr(xValue);
        end
    case {,'INTENSITY STIMULI N'}
        xlbl = 'Intensity levels';
        xValue = lp.events(:,1)';
        if lp.stimuliNum > 1
            xValue = reshape(xValue,2,length(xValue)/2);
        end
        
        
        lightSpikesFR_mean = reshape(lightSpikesFR_mean, lp.stimuliNum, length(lightSpikesFR_mean)/lp.stimuliNum);
        nonLightSpikes_mean = reshape(nonLightSpikes_mean, lp.stimuliNum, length(nonLightSpikes_mean)/lp.stimuliNum) ;      
        
        lightSpikesFR_std = reshape(lightSpikesFR_std, lp.stimuliNum, length(lightSpikesFR_std)/lp.stimuliNum) ;      
        nonLightSpikes_std = reshape(nonLightSpikes_std, lp.stimuliNum, length(nonLightSpikes_std)/lp.stimuliNum) ;      

        
    case {,'DURATION STIMULI'}       
        xValue =lp.durationRange; %1:length(lightSpikesFR_mean);        
        
        xlbl = 'Duration'       ;


    case {,'MANY STIMULI'}       
        xValue =1:length(lightSpikesFR_mean);        
        
        xlbl = 'Different patterns'       

    case {,'MANY STIMULI WITH CONTROL'}       
        plotManyStimuliWithContol %(lp, lightSpikesFR_mean, lightSpikesFR_std, nonLightSpikes_mean, nonLightSpikes_std)
        return
end

% in case we have only one point add a dummy point
if length(nonLightSpikes_mean) == 1
    nonLightSpikes_mean = [ -1 nonLightSpikes_mean];
    nonLightSpikes_std= [0 nonLightSpikes_std];
    lightSpikesFR_std = [-1 lightSpikesFR_std];
    lightSpikesFR_mean = [ -1 lightSpikesFR_mean];
    xValue = [ -1 xValue];
end

if size(lightSpikesFR_mean,2) == 1
    lightSpikesFR_mean = lightSpikesFR_mean';
end
if size(nonLightSpikes_mean,2) == 1
    nonLightSpikes_mean = nonLightSpikes_mean';
end

subplot(2,1,1);
for ii=1:size(xValue,1)

    hold on;

    % signal
    errorbar_patch(xValue(ii,:),lightSpikesFR_mean(ii,:),lightSpikesFR_std(ii,:),clr(ii))
    % background
    errorbar_patch(xValue(ii,:), nonLightSpikes_mean(ii,:) ,nonLightSpikes_std(ii,:),'g')
    

    title([ num2str(lp.fileIndx)  '_' num2str(lp.mClusterIndx) ' - th:' num2str(lp.minwv(1)) ' reps: ' num2str(lp.totalReps) ' ISI: ' num2str(lp.ISI) '#stimuli ' num2str(lp.stimuliNum) ' locs: ' num2str(lp.Bounderies) ' size: ' num2str(lp.stimuliSize)])
    xlabel(xlbl)
    ylabel('mean FR')
    [ mean(nonLightSpikes_mean) std(nonLightSpikes_mean)]

end
disp(['background and light mean fr : ' num2str([mean(nonLightSpikes_mean) mean(lightSpikesFR_mean)])])
disp(['background and light mean+std fr : ' num2str([mean(nonLightSpikes_mean)+2*std(nonLightSpikes_mean) mean(lightSpikesFR_mean)+2*std(lightSpikesFR_mean)])])

lp.nonLightSpikes_mean = (nonLightSpikes_mean);
lp.lightSpikesFR_mean = (lightSpikesFR_mean);


% plot also the max signal values in most of the time more accuate than
% avarage
[alltpAll, lpSaved] = readAllSignals(lp,  1);


lp.maxFr = [];        lp.maxFrBg = [];
for ii=1:length(alltpAll)       
    lp.maxFr = [lp.maxFr max(alltpAll(ii).meanFR)];
    lp.maxFrBg = [lp.maxFrBg     max(   alltpAll(ii).meanFRbg(max(length( alltpAll(ii).meanFRbg)-length(alltpAll(ii).meanFR),1):end)    )];
end

if  findstr(lp.scriptType,'INTENSITY') > 0
    lp.maxFr = fliplr(reshape(lp.maxFr,lp.stimuliNum ,length(lp.maxFr)/lp.stimuliNum ));
    lp.maxFrBg = fliplr(reshape(lp.maxFrBg,lp.stimuliNum ,length(lp.maxFrBg)/lp.stimuliNum ));
end


% if strcmp(lp.scriptType, 'MANY STIMULI') == 0
%     lp.maxFr = reshape(lp.maxFr, lp.stimuliNum, length(lp.maxFr)/lp.stimuliNum);
%     lp.maxFr = fliplr(lp.maxFr);
%     lp.maxFrBg = reshape(lp.maxFrBg, lp.stimuliNum, length(lp.maxFrBg)/lp.stimuliNum);
%     lp.maxFrBg = fliplr(lp.maxFrBg);
% end

% plot the second pane of max values
subplot(2,1,2);

for ii=1:size(xValue,1)
        plot(xValue(ii,:), lp.maxFr(ii,:),clr(ii),'LINEWIDTH', 2)
        hold on;
        plot(xValue(ii,:), (lp.maxFrBg(ii,:)),'g','LINEWIDTH', 2)
        PercentOfResponses = length(find([lp.maxFr(ii,:) - lp.maxFrBg(ii,:)] > 0))/length(lp.maxFr(ii,:))
        title(['Max values, %of response: ' num2str(PercentOfResponses)])
        ylabel('max FR')
end
    

