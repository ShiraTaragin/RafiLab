% a list of bulb hotspots to be analyzed
disk = pwd;
disk=disk(1)';
pPChotspotmapList=[];

% :\Data\December\Dec 29 OMP aPCX 2 electrodes\'
%1
pPChotspotmapList{1}.dirPath = [disk ':\Data\2011\Jan\Jan 13 OMP pPCX\'];
pPChotspotmapList{1}.neuron = 3;
pPChotspotmapList{1}.cluster = 0;
pPChotspotmapList{1}.th = -0.5;
%2
pPChotspotmapList{end+1}.dirPath = [disk ':\Data\2011\Jan\Jan 13 OMP pPCX\'];
pPChotspotmapList{end}.neuron = 4;
pPChotspotmapList{end}.cluster = 0;
pPChotspotmapList{end}.th = -0.2;
%3
pPChotspotmapList{end+1}.dirPath = [disk ':\Data\2011\Jan\Jan 13 OMP pPCX\'];
pPChotspotmapList{end}.neuron = 6;
pPChotspotmapList{end}.cluster = 0;
pPChotspotmapList{end}.th = 0;
%4
pPChotspotmapList{end+1}.dirPath = [disk ':\Data\2011\Jan\Jan 13 OMP pPCX\'];
pPChotspotmapList{end}.neuron = 10;
pPChotspotmapList{end}.cluster = 0;
pPChotspotmapList{end}.th = 0;
%5
pPChotspotmapList{end+1}.dirPath = [disk ':\Data\2011\Jan\Jan 13 OMP pPCX\'];
pPChotspotmapList{end}.neuron = 12;
pPChotspotmapList{end}.cluster = 0;
pPChotspotmapList{end}.th = 0.1;
%6
pPChotspotmapList{end+1}.dirPath = [disk ':\Data\2011\Jan\Jan 13 OMP pPCX\'];
pPChotspotmapList{end}.neuron = 10;
pPChotspotmapList{end}.cluster = 0;
pPChotspotmapList{end}.th = -0.3;
%7
pPChotspotmapList{end+1}.dirPath = [disk ':\Data\2011\Jan\Jan 13 OMP pPCX\'];
pPChotspotmapList{end}.neuron = 14;
pPChotspotmapList{end}.cluster = 0;
pPChotspotmapList{end}.th = -0.3;

%:\Data\2011\March\March 7 pPCX\
%8
pPChotspotmapList{end+1}.dirPath = [disk ':\Data\2011\March\March 7 pPCX\'];
pPChotspotmapList{end}.neuron = 11;
pPChotspotmapList{end}.cluster = 1;
pPChotspotmapList{end}.th = -0.3;
%9
pPChotspotmapList{end+1}.dirPath = [disk ':\Data\2011\March\March 7 pPCX\'];
pPChotspotmapList{end}.neuron = 11;
pPChotspotmapList{end}.cluster = 2;
pPChotspotmapList{end}.th = -0.3;
%10
pPChotspotmapList{end+1}.dirPath = [disk ':\Data\2011\March\March 7 pPCX\'];
pPChotspotmapList{end}.neuron = 15;
pPChotspotmapList{end}.cluster = 0;
pPChotspotmapList{end}.th = 0.3;

% F:\Data\2011\March\March 21 pPCX
%11
pPChotspotmapList{end+1}.dirPath = [disk ':\Data\2011\March\March 21 pPCX\'];
pPChotspotmapList{end}.neuron = 1;
pPChotspotmapList{end}.cluster = 1;
pPChotspotmapList{end}.th = 0.3;
%12
pPChotspotmapList{end+1}.dirPath = [disk ':\Data\2011\March\March 21 pPCX\'];
pPChotspotmapList{end}.neuron = 4;
pPChotspotmapList{end}.cluster = 1;
pPChotspotmapList{end}.th = 0.3;
%13
pPChotspotmapList{end+1}.dirPath = [disk ':\Data\2011\March\March 21 pPCX\'];
pPChotspotmapList{end}.neuron = 4;
pPChotspotmapList{end}.cluster = 2;
pPChotspotmapList{end}.th = 0.3;
%14 great spikes
pPChotspotmapList{end+1}.dirPath = [disk ':\Data\2011\March\March 21 pPCX\'];
pPChotspotmapList{end}.neuron = 10;
pPChotspotmapList{end}.cluster = 1;
pPChotspotmapList{end}.th = 0.3;
%15 great spikes
pPChotspotmapList{end+1}.dirPath = [disk ':\Data\2011\March\March 21 pPCX\'];
pPChotspotmapList{end}.neuron = 10;
pPChotspotmapList{end}.cluster = 2;
pPChotspotmapList{end}.th = 0.3;
%16 great spikes
pPChotspotmapList{end+1}.dirPath = [disk ':\Data\2011\March\March 21 pPCX\'];
pPChotspotmapList{end}.neuron = 15;
pPChotspotmapList{end}.cluster = 1;
pPChotspotmapList{end}.th = 0.3;
%17 great spikes
pPChotspotmapList{end+1}.dirPath = [disk ':\Data\2011\March\March 21 pPCX\'];
pPChotspotmapList{end}.neuron = 15;
pPChotspotmapList{end}.cluster = 2;
pPChotspotmapList{end}.th = 0.3;

%18
pPChotspotmapList{end+1}.dirPath = [disk ':\Data\2011\Nov 2011\Nov 23 2011 OMP pPCX\'];
pPChotspotmapList{end}.neuron = 1;
pPChotspotmapList{end}.cluster = 2;
pPChotspotmapList{end}.th = -9;
%19
pPChotspotmapList{end+1}.dirPath = [disk ':\Data\2011\Nov 2011\Nov 23 2011 OMP pPCX\'];
pPChotspotmapList{end}.neuron = 3;
pPChotspotmapList{end}.cluster = 1;
pPChotspotmapList{end}.th = 0-9;

%20
pPChotspotmapList{end+1}.dirPath = [disk ':\Data\2011\Nov 2011\Nov 24 2011 OMP pPCX'];
pPChotspotmapList{end}.neuron = 1;
pPChotspotmapList{end}.cluster = 1;
pPChotspotmapList{end}.th = 0-9;

%21
pPChotspotmapList{end+1}.dirPath = [disk ':\Data\2011\Nov 2011\Nov 24 2011 OMP pPCX'];
pPChotspotmapList{end}.neuron = 5;
pPChotspotmapList{end}.cluster = 1;
pPChotspotmapList{end}.th = 0-9;

%22
pPChotspotmapList{end+1}.dirPath = [disk ':\Data\2011\Nov 2011\Nov 24 2011 OMP pPCX'];
pPChotspotmapList{end}.neuron = 12;
pPChotspotmapList{end}.cluster = 1;
pPChotspotmapList{end}.th = 0-9;

%23
pPChotspotmapList{end+1}.dirPath = [disk ':\Data\2012\Jan 2012\Jan 6 2012 pPCX'];
pPChotspotmapList{end}.neuron = 1;
pPChotspotmapList{end}.cluster = 1;
pPChotspotmapList{end}.th = 0-9;

%G:\Data\2012\Jan 2012\Jan 6 2012 pPCX

lighOnOffDiff=[];
for i=1:length(pPChotspotmapList)
    i
    dirPath = pPChotspotmapList{i}.dirPath;
    [exp]= readExpDescFile(dirPath);
    lp = initLightParam(exp, pPChotspotmapList{i}.neuron, 1); lp = readLpData( lp, pPChotspotmapList{i}.th, 1, pPChotspotmapList{i}.cluster);
    hotspotMap;
    close;
    pPChotspotmapList{i}.lp = lp;
    
    lighOnOffDiff(end+1) = mean(lp.lightSpikesFRnew)/mean(lp.nonLightSpikes_allNew);
end

