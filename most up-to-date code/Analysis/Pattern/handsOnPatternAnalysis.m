function [lp, data] = permAnalysis_Shira(lp)
% classify each pattern as a specific type.
% for n spots, we get 2^n -1 types.


% 11/06/2019 update - psth is superimposed on pattern

%%%%%%%%%%%%% specific pattern with permutations %%%%%%%%%%%%%
sz = lp.stimuliSize;
area = sz(1)*sz(2);
%%

%% Classify trials by lit spots
data = []; corners = [];foundSpots = zeros(1,size(lp.eventsLog,2));
countTypes = 0;
for i = 1:size(lp.eventsLog,1) % Go through trial by trial
    ptrn = lp.eventsLog(i,:);
    litIdx = find(ptrn > 0); %Indices of lit pixels
    [oldFind,type] = ismember(ptrn,foundSpots,'rows'); % have we classified this pattern?
    if sum(oldFind) == 0 % new pattern
        foundSpots(end+1,:) = ptrn;
        countTypes = countTypes+1;
        type = countTypes;
        data(type).ptrn = ptrn;
        data(type).trials = i;
        data(type).idx = litIdx;
    else % existing pattern
        type = type - 1; %first is zeros
        data(type).trials = [data(type).trials i];
    end
    
    if ~isfield(data, 'spotsOn') || isempty(data(type).spotsOn)...
            || length(data(type).spotsOn) < length(corners)
        % Lit spots as yet unidentified
        % (Updates if identified before all positions were found)
        numOn = length(litIdx)/area;
        spotsOn = ismember(corners,litIdx);
        if numOn == 1 && sum(spotsOn) == 0 % new singleSpot
            corners = [corners litIdx(1)]; % add to list of spots
            spotsOn = ismember(corners,litIdx);
        end
        if sum(spotsOn) == numOn % Have identified all lit spots
            data(type).spotsOn = spotsOn;
            data(type).numOn = numOn;
        end
    end
end

data = sortStruct(data,'numOn');
%% Statistics
BG_RANGE = 200;  % how many ms before light we consider as bg
LIGHT_RANGE = 200; % how many ms after light off we take into the calculation of fr
ptrSpikeDataAll=[];

resFr = zeros(length(data(1).trials),length(data));
resBg = zeros(length(data(1).trials),length(data(1).trials));

response = zeros(1,length(data));

for kk = 1:length(data)% run over all 2^n - 1 patterns.
    cc = 0;
    ptrSpikeData=[];
    
    for i = data(kk).trials %run over the trials belonging to each pattern.
        cc = cc +1;
        ev = lp.TTLEvents(:,i);
        spikeTbefore = lp.t(find(lp.t < ev(1) & lp.t > (ev(1) - BG_RANGE/1000))) - ev(1);
        % %             spikeTafter = lp.t(find(lp.t > ev(1) & lp.t < (ev(1) + LIGHT_RANGE/1000)))  - ev(1);
        
        spikeTafter2 = lp.t(find(lp.t > ev(1) & lp.t < (ev(2) + LIGHT_RANGE/1000)))  - ev(1);
        
        ptrSpikeData(cc).times = [spikeTbefore spikeTafter2];
        
        spikeTbeforeFR = length(spikeTbefore)/(LIGHT_RANGE/1000);
        spikeTafterFR = length(spikeTafter2)/(LIGHT_RANGE/1000);
        
        resFr(cc,kk) = spikeTafterFR;
        resBg(cc,kk) = spikeTbeforeFR;
        
    end
    data(kk).BG = mean(resBg(:,kk));
    data(kk).FR = mean(resFr(:,kk));
    data(kk).response = data(kk).FR - data(kk).BG;
    response(kk) = data(kk).FR;
    data(kk).ptrSpikeData = ptrSpikeData;
    [~, p] = ttest(resBg(:,kk),resFr(:,kk));
    data(kk).p = p;
end

%%
%%"STA"%%
sta = zeros(length(lp.yRange),length(lp.xRange));
for i = 1:length(data)
    mat = data(i).matrix;
    sta = sta + (mat * data(i).FR);
end
sta = sta/sum(response(:));



%%
%%%%%%%%%%% plot %%%%%%%%%%%%%%
[ data, subrows, subcolumns, ] = plotMultiplePSTH(lp, data,sta>0);

subplot(subrows, subcolumns, subrows*subcolumns)
plotSTA( lp, sta, 1 )
title('"STA"')










% end




