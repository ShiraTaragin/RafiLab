function lp = removeEventsAfterHotspo(lp)
%% remove events after hotspot is hit

pVal = lp.pVal;
exIndx = find(pVal == 1)';

for i=exIndx
 
    afterEventIDs = lp.eventIDs{i}'+1;
    
    % find the spots that were hut by light just after this event
    for j=1:length(pVal(:))
        if j == i continue; end
        
        % find the events after the hotspot events 
        
        [a,b,c]=intersect(lp.eventIDs{j}',afterEventIDs);
        if ~isempty(a)
            eventIDs = lp.eventIDs{j};
            eventIDs(b) = [];
            lp.eventIDs{j} = eventIDs;
            
        end        
    end
end

% %% recalculate FR

%Calculate the average per group
for ii=1:length(pVal(:)) 
    lp.lightFR{ii} = lp.LightSpikesFR_unSorted(lp.eventIDs{ii});
    lp.nonLightFR{ii} = lp.nonLightSpikesFR_unSorted(lp.eventIDs{ii});
end
