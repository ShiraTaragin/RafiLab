function [res ] = LabPlotExpParamOdor(expParam, neuronId, odorId,  alighnType,  sniffRng, morphFlag)
%% plot one odor PSTH and raster plot
% session is the data structure that hold all the data
% expIds - the experment ids (could be more than one and we merge them)
% odorId
% alighnType: OdorOnset or InhalationOnset
% clrS - color of the psth
% ttestRng - is it has two value than it test signifcant per time e.g. [-3
% 3] imply compare 3 sec before with 3 sec after. If it has one value than
% it compares the number of sniff before and after
% morphFlaf - 1 will morph the spikes and sniff times
winRange = [-3 4];
ODOR_DELAY_TIME = 0.03;


if nargin < 4
    alighnType ='InhalationOnset';
end
if nargin < 5
    sniffRng =[2 2];
end
if nargin < 6
    morphFlag = 1;
end

%%%%%%%%%%%%%%%%%%%%%%%%
%ttestRng =3;
%%%%%%%%%%%%%%%%%%%%%%%%%
breathColor = [150 150 150; 230 230 230]./255;

exTimes=0; 
valveIds=[];


% get the snif times
inTimes = [inTimes, expParam.sniffInfo.inTimes ];
exTimes = [exTimes, expParam.sniffInfo.exTimes ];
sniffTimes = [inTime; exTimes];

% get the spike times
spikeTimes  = [spikeTimes  expParam.neuronSpikeTime{neuronId}.t' ];    


% get the odor start times
odorEventTimes=[];
valveIds = [valveIds expParam.odorParams.randValveList];
valveIdsInd = find(valveIds == odorId);
if isempty(valveIdsInd)
    error(['no info on this odor id: ' num2str(odorId)])
end
odorEventTimes = [odorEventTimes (reshape( expParam.eventTimeStamps,2, length( expParam.eventTimeStamps)/2) )];
odorEventTimes = odorEventTimes(:,valveIdsInd)+ ODOR_DELAY_TIME;   % we add 30ms delay



% morph all spikes and sniffs
%morphSpikes(sniffTimes, spikeTimes, odorTimes)
if morphFlag
    [sniffTimes, spikeTimes, odorEvenTimes] = morphSniffSpikes(sniffTimes, spikeTimes, odorEvenTimes); 
    % compare by sniff
    sniffDur = sniffTimes(1,2)-sniffTimes(1,1);
    sniffRng = sniffRng*[-sniffDur sniffDur];        
end

[res ] = LabPlotOdor(odorEvenTimes, spikeTimes, sniffTimes , alighnType, sniffRng)



