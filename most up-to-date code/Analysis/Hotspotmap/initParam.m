function param = initParam(evokedFrDist)

param=[];
param.trialNum = 20;
param.binSize = 5;
param.pTh = 0.025;
param.sniffNum = 5;
param.plotFlag = 0;
param.GLO_NUM = 100;
param.inhDistance = 100; % max distance between glomeruli that we can have inhibition
param.numOfInhSpots = 0:60;  % distribution range of inhibitory spots
param.MtNum = 3;

% spike statitics
param.sponSpikePeakLoc = 5;
param.sponSpikePeakStd = 20;
param.odorSpikeLoc = 70;
param.odorSpikeStd = 40;

% integrate an fire params
param.VmTh = -50;
param.VmReset = -70;
param.HyperPolarization = -5;
param.PSP = param.VmTh - param.VmReset +1;

param.TimeSteps = 100;
param.numOfSponSpikes=[5 15];  % first entry is the prefer phase and the second entry is a all over the respiration
param.numOfOdorSpikes = 30;
param.evokedFrDistDivFactor = max(evokedFrDist); % spikes per 100 ms
param.rc = 40; % time constant in ms
param.decayVal = 0.1;
param.decayVal = 1-exp(-3/param.rc); % each time step correspond to 3 ms

