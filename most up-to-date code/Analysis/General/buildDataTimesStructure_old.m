function dataSpikeTimes = buildDataTimesStructure(lp, excEvensList, timeRange)
% build the data.times structure to be used in the mypsth function
if nargin < 3
    BG_RANGE = 0.300;
    LIGHT_RANGE = 0.550;
else  
    BG_RANGE = timeRange(1);
    LIGHT_RANGE = timeRange(2);
end
if BG_RANGE < 0
    BG_RANGE = -BG_RANGE;
end
if BG_RANGE > 10
    BG_RANGE = BG_RANGE/1000;
end
if LIGHT_RANGE > 10
    LIGHT_RANGE = LIGHT_RANGE/1000;
end

dataSpikeTimes=[];
if size(excEvensList,1) > 1
    excEvensList=excEvensList';
end

for i = excEvensList
     ev = lp.TTLEvents(1,i);
    
    spikeTimesIndx = (find((lp.t < ev+LIGHT_RANGE) & lp.t > (ev - BG_RANGE))) ;
    dataSpikeTimes(end+1).times = lp.t(spikeTimesIndx) - ev;
    
    dataSpikeTimes(end).ev = ev;
    % mark which spike was during inhale and which during exhale
    groups = lp.spikeSniffGroups(spikeTimesIndx);
    dataSpikeTimes(end).groups = groups;
    
    % Calculate time since last inhale
    inhaleIndx = find(lp.inhaleTimes > ev,1)-1;
    if inhaleIndx > 0
        inhale = lp.inhaleTimes(inhaleIndx); 
    else
        inhale = 0;
    end
        
    dataSpikeTimes(end).phase = ev - inhale;
end
