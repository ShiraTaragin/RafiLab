function [dataSpikeTimes, p, BG, FR] = buildDataTimesStructure(lp, excEventsList)
% build the data.times structure to be used in the mypsth function

% dataSpikeTimes - struct with spike times of each trial, as well as sniff
% group data

% p - p-value of t-test comparing background and light-evoked firing rates
% BG - mean # of spikes in background
% FR - mean # of evoked spikes.

% 10/07/19 - corrected to rates rather than number of spikes.
if ~isfield(lp,'DISPLAY_RANGE') 
    DISPLAY_RANGE = [-0.5 0.7];
else
    DISPLAY_RANGE  = lp.DISPLAY_RANGE;
end


BG_RANGE = lp.statTimeRange(1);
LIGHT_RANGE = lp.statTimeRange(2);
    
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

spikeRates = zeros(length(excEventsList), 2);

for i = excEventsList
    ev = lp.TTLEvents(1,i);
    
    % find spikes in the light range and bg range and calculte fr
    spikesBefore = find(lp.t < ev & lp.t > (ev - BG_RANGE));
    spikesAfter = find(lp.t > (ev + lp.DELAY_SPIKE_CALCULATION) & lp.t < (ev + lp.DELAY_SPIKE_CALCULATION + LIGHT_RANGE));
    
    spikeRates(i,1) = length(spikesBefore)/BG_RANGE;
    spikeRates(i,2) = length(spikesAfter)/(LIGHT_RANGE);
    
    
    
    % take all spikes in the range that you want to dispaly
    spikeTimesIndx = find(lp.t > (ev + DISPLAY_RANGE(1)) & lp.t < (ev + DISPLAY_RANGE(2)));
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
BG = mean(spikeRates(:,1));
FR = mean(spikeRates(:,2));

[~, p] = ttest(spikeRates(:,1),spikeRates(:,2));
