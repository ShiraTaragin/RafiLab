function [dataSpikeTimes, p, BG, FR] = buildDataTimesStructure(lp, excEventsList, timeRange)
% build the data.times structure to be used in the mypsth function

% dataSpikeTimes - struct with spike times of each trial, as well as sniff
% group data

% p - p-value of t-test comparing background and light-evoked firing rates
% BG - mean # of spikes in background
% FR - mean # of evoked spikes.

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
if size(excEventsList,1) > 1
    excEventsList=excEventsList';
end

numSpikes = zeros(length(excEventsList), 2);

for i = excEventsList
    ev = lp.TTLEvents(1,i);
    
    spikesBefore = find(lp.t < ev & lp.t > (ev - BG_RANGE));
    spikesAfter = find(lp.t > ev(1) & lp.t < (ev + LIGHT_RANGE + lp.stimuliDuration));
    
    numSpikes(i,1) = length(spikesBefore);
    numSpikes(i,2) = length(spikesAfter);
    
    spikeTimesIndx = [spikesBefore spikesAfter];
    
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
BG = mean(numSpikes(:,1));
FR = mean(numSpikes(:,2));

[~, p] = ttest(numSpikes(:,1),numSpikes(:,2));
