function lp = calcLightFR(lp)

lp = calcLightFRall(lp);


% resort the events according to thier spot position
[a,I,ocur] = mySortRow(lp.eventsLog(1:min(length(lp.TTLEvents), length(lp.eventsLog)),1:2));


%Calculate the average per group
for ii=1:length(ocur)-1 
    lp.eventIDs{ii} = I(ocur(ii):ocur(ii+1)-1);
    lp.lightFR{ii} = lp.LightSpikesFR_unSorted(lp.eventIDs{ii});
    lp.nonLightFR{ii} = lp.nonLightSpikesFR_unSorted(lp.eventIDs{ii});
end

%lp = removeEventsAfterHotspo(lp);


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

if size(lp.eventsLog,1) < size(lp.TTLEvents,2)    
    warning('Cant handle this case the log file is corrupted')
end


[lp.rFr2BgCorr,lp.pFr2BgCorr]= corrcoef(lp.lightSpikesFRnew,  lp.nonLightSpikes_allNew);

