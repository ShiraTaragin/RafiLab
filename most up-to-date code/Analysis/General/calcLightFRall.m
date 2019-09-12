function lp = calcLightFRall(lp)
spikeTimes =[];
if lp.correctSniffModulation
    [lp, t, R, meanSnifDur, spikeData] = plotSniffPhase(lp,1,0,ceil(size(lp.sniffTimes,2)/200));    
    % mere all spike data
    for i=1:size(spikeData,2)
        spikeTimes = [spikeTimes spikeData(i).times];
    end
end

shufflingFlag=0; %lp.shuffelingFalg;


%%%%%%%%%%%%%%%%%%%%%%%%%
% Flags
%%%%%%%%%%%%

%%%% Constants  %%%%%%%%
allLigtSpikes=[];
nonLightSpikes=[];
lightOffFR = [];
lightSpikesTimes = [];
nonLightSpikes_allTimes = [];
lightOnFR=[];


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% read the TTL data from the file if we already did that


TTLEvents = lp.TTLEvents;
t = lp.t;

if ~isempty(lp.eventFile) & size(lp.eventsLog,1)  ~= size(TTLEvents,2)
    disp('The light events do not match the events in the event file')
end

% calculate light FR
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
currRepNum = -1;
tb=0;
tZero = 0;
for ii=1:length(TTLEvents(1,:))    
%     currRepNum = currRepNum + 1;
    
    lightOn = TTLEvents(1,ii) + lp.DELAY_SPIKE_CALCULATION  ;  
    lightOff = lightOn + lp.statTimeRange(2)/1000;  
    
%     if lp.LIMIT_SPIKE_TIME_CALCULATION
%         lightOff = lightOn + lp.LIMIT_SPIKE_TIME_CALCULATION;
%     end
%     
%     if lp.EXTEND_SPIKE_TIME_CALCULATION 
%         lightOff = lightOff + lp.EXTEND_SPIKE_TIME_CALCULATION;
%     end
    
    if isempty(lp.bgWin)
        bgWin = lightOff-lightOn;
    else
        bgWin = lp.bgWin;
    end
    lp.bgWin=bgWin;
    

    if shufflingFlag
      lightOff = lightOn ;
      lightOn = lightOff-bgWin;
    end    
      
    lightDur = (lightOff-lightOn);
    lp.lightDur=lightDur;
     
    % light on response
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    x = find(t > lightOn & t < lightOff) ;    
    allLigtSpikes(end+1).Spikes = t(x) ;
    allLigtSpikes(end).Times = [lightOn lightOff];
    expectedSpikCount=0;
    % correct fr according to expeced sniff modulated fr
    lightOnSniffIndx = find(lightOn < lp.sniffTimes(1,:),1) - 1;
    if lp.correctSniffModulation & ~isempty(lightOnSniffIndx) & (lightOnSniffIndx)
        
        
        lightOnSniffTime = lightOn - lp.sniffTimes(1,lightOnSniffIndx);
        
        lightOffSniffIndx = find(lightOff <  lp.sniffTimes(1,:),1);
        
        if lightOff < lp.sniffTimes(1,lightOnSniffIndx+1)  % light off is at the same sniff
            lightOffSniffTime = lightOff - lp.sniffTimes(1,lightOnSniffIndx);
            expectedSpikCount = length(find(spikeTimes > lightOnSniffTime & spikeTimes < lightOffSniffTime));
            expectedSpikCount = expectedSpikCount/size(spikeData,2);

        else   % lightOff falls in the seconnd sniff
            % first compute the expected spikes in the first sniff
            lightOffSniffTime = lp.sniffTimes(1,lightOnSniffIndx+1) - lp.sniffTimes(1,lightOnSniffIndx);    

            expectedSpikCount = length(find(spikeTimes > lightOnSniffTime & spikeTimes < lightOffSniffTime));

            % second, count the number of spike in the second sniff
            lightOnSniffTime=0;
            lightOffSniffTime = lightOff - lp.sniffTimes(1,lightOnSniffIndx+1);
            

            expectedSpikCount = expectedSpikCount + length(find(spikeTimes > lightOnSniffTime & spikeTimes < lightOffSniffTime));
            expectedSpikCount = expectedSpikCount/size(spikeData,2);

        end                
    end
    
    lightOnFR(end+1) = (length(x)-expectedSpikCount)/lightDur;     

    % background fr
    bglightOn = lightOn - bgWin  ;
    bglightOff = lightOn;
    
    % check if inhibition is a result of the overshooting of excitation
    % spots. Calculate the bg from the time AFTER the light is off
    if isfield(lp, 'checkOverShooting') && lp.checkOverShooting
        bglightOn = lightOff  ;
        bglightOff = lightOff + bgWin;
    end





    % correct bg fr according to expeced sniff modulated fr
    expectedSpikCount=0;
    bglightOnSniffIndx = find(bglightOn < lp.sniffTimes(1,:),1) - 1;
    if lp.correctSniffModulation & ~isempty(bglightOnSniffIndx) & (bglightOnSniffIndx)
        
        
        bglightOnSniffTime = bglightOn - lp.sniffTimes(1,bglightOnSniffIndx);
        
        lightOffSniffIndx = find(bglightOff <  lp.sniffTimes(1,:),1);
        
        if bglightOff < lp.sniffTimes(1,bglightOnSniffIndx+1)  % light off is at the same sniff
            bglightOffSniffTime = bglightOff - lp.sniffTimes(1,bglightOnSniffIndx);
            expectedSpikCount = length(find(spikeTimes > bglightOnSniffTime & spikeTimes < bglightOffSniffTime));
            expectedSpikCount = expectedSpikCount/size(spikeData,2);

        else   % bglightOff falls in the seconnd sniff
            % first compute the expected spikes in the first sniff
            bglightOffSniffTime = lp.sniffTimes(1,bglightOnSniffIndx+1) - lp.sniffTimes(1,bglightOnSniffIndx);    

            expectedSpikCount = length(find(spikeTimes > bglightOnSniffTime & spikeTimes < bglightOffSniffTime));

            % second, count the number of spike in the second sniff
            bglightOnSniffTime=0;
            bglightOffSniffTime = bglightOff - lp.sniffTimes(1,bglightOnSniffIndx+1);
            

            expectedSpikCount = expectedSpikCount + length(find(spikeTimes > bglightOnSniffTime & spikeTimes < bglightOffSniffTime));
            expectedSpikCount = expectedSpikCount/size(spikeData,2);

        end                    
    end
      
    x = find(t > bglightOn &  t < bglightOff) ;   
    lightOffFR(end+1) = (length(x)-expectedSpikCount)/(bglightOff-bglightOn);     


end

% lightOnFR(find(lightOnFR<0)) = 0;
% lightOffFR(find(lightOffFR<0)) = 0;

lp.allLigtSpikes = allLigtSpikes;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% fix in case we have too many events....
if size(lp.eventsLog,1) < size(TTLEvents,2)
    %lp.ActualRepUsed = floor(size(lp.eventsLog,1)/(lp.repNum*lp.dims(1)*lp.dims(2)));
    disp(['There are not enough events in the event file; using only ' num2str(lp.ActualRepUsed) ' repeats'])
end

if size(TTLEvents,2) < size(lp.eventsLog,1) 
    lp.ActualRepUsed = floor(size(TTLEvents,2)/(lp.repNum*lp.dims(1)*lp.dims(2)));
    disp(['There are not enough events in the event file; using only ' num2str(lp.ActualRepUsed) ' repeats'])
end

lp.LightSpikesFR_unSorted = lightOnFR;
lp.nonLightSpikesFR_unSorted = lightOffFR;

