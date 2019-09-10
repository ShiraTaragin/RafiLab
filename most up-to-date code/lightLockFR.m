function  [fromInhalTime fr] = lightLockFR(lp,  eventID)
% plot a sub set of the events 
% eventID is the x,y spot index in the hotspot map e.g [5 1] for the spot
% in the 5th row and first column

fromInhalTime=[];
fr=[];

for j=1:size(eventID,1)
    spotLoc = [lp.yRange(eventID(j,1)) lp.xRange(eventID(j,2)) ];

    % calculate time raneg to plot
    allTrialIndex = getTrialIndex(lp, spotLoc);

    % when the light events started
    eventsStartTimes = lp.TTLEvents(:,allTrialIndex);

    % phase: how far the light events are from the inhilation
    for i=1:size(eventsStartTimes,2)
        inhalTime  = find(eventsStartTimes(1,i) > lp.sniffTimes(1,:));
        inhalTime = lp.sniffTimes(1,inhalTime(end));

        fromInhalTime(end+1) = eventsStartTimes(1,i) - inhalTime;

        % calc FR
        fr(end+1) = length(find(lp.t > eventsStartTimes(1,i) & lp.t < eventsStartTimes(2,i) ));
    end
end    
    
hold on; 
scatter(fromInhalTime, fr,'*r')

