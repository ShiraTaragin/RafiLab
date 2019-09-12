% a list of bulb hotspots to be analyzed
disk = pwd;
disk=disk(1)';
aPChotspotmapList=[];

% :\Data\December\Dec 29 OMP aPCX 2 electrodes\'
%1
aPChotspotmapList{1}.dirPath = [disk ':\Data\2010\December 2010\Dec 29 OMP aPCX 2 electrodes\'];
aPChotspotmapList{1}.neuron = 1;
aPChotspotmapList{1}.cluster = 1;
aPChotspotmapList{1}.th = 0;
%2
aPChotspotmapList{end+1}.dirPath = [disk ':\Data\2010\December 2010\Dec 29 OMP aPCX 2 electrodes\'];
aPChotspotmapList{end}.neuron = 1;
aPChotspotmapList{end}.cluster = 2;
aPChotspotmapList{end}.th = 0;
%3
aPChotspotmapList{end+1}.dirPath = [disk ':\Data\2010\December 2010\Dec 29 OMP aPCX 2 electrodes\'];
aPChotspotmapList{end}.neuron = 3;
aPChotspotmapList{end}.cluster = 1;
aPChotspotmapList{end}.th = 0;
%4
aPChotspotmapList{end+1}.dirPath = [disk ':\Data\2010\December 2010\Dec 29 OMP aPCX 2 electrodes\'];
aPChotspotmapList{end}.neuron = 3;
aPChotspotmapList{end}.cluster = 2;
aPChotspotmapList{end}.th = 0;
%5
aPChotspotmapList{end+1}.dirPath = [disk ':\Data\2010\December 2010\Dec 29 OMP aPCX 2 electrodes\'];
aPChotspotmapList{end}.neuron = 7;
aPChotspotmapList{end}.cluster = 0;
aPChotspotmapList{end}.th = 0.1;
%6
aPChotspotmapList{end+1}.dirPath = [disk ':\Data\2010\December 2010\Dec 29 OMP aPCX 2 electrodes\'];
aPChotspotmapList{end}.neuron = 10;
aPChotspotmapList{end}.cluster = 1;
aPChotspotmapList{end}.th = 0.1;

% F:\Data\Jan\Jan 5 OMP AON aPCX
%7
aPChotspotmapList{end+1}.dirPath = [disk ':\Data\2011\Jan\Jan 5 OMP AON aPCX\'];
aPChotspotmapList{end}.neuron = 1;
aPChotspotmapList{end}.cluster = 0;
aPChotspotmapList{end}.th = 0.4;
%8
aPChotspotmapList{end+1}.dirPath = [disk ':\Data\2011\Jan\Jan 5 OMP AON aPCX\'];
aPChotspotmapList{end}.neuron = 1;
aPChotspotmapList{end}.cluster = 1;
aPChotspotmapList{end}.th = 0.4;
%9
aPChotspotmapList{end+1}.dirPath = [disk ':\Data\2011\Jan\Jan 5 OMP AON aPCX\'];
aPChotspotmapList{end}.neuron = 2;
aPChotspotmapList{end}.cluster = 1;
aPChotspotmapList{end}.th = 0.4;
%10
aPChotspotmapList{end+1}.dirPath = [disk ':\Data\2011\Jan\Jan 5 OMP AON aPCX\'];
aPChotspotmapList{end}.neuron = 2;
aPChotspotmapList{end}.cluster = 2;
aPChotspotmapList{end}.th = 0.4;
%11
aPChotspotmapList{end+1}.dirPath = [disk ':\Data\2011\Jan\Jan 5 OMP AON aPCX\'];
aPChotspotmapList{end}.neuron = 6;
aPChotspotmapList{end}.cluster = 0;
aPChotspotmapList{end}.th = 0.1;
%11
aPChotspotmapList{end+1}.dirPath = [disk ':\Data\2011\Jan\Jan 5 OMP AON aPCX\'];
aPChotspotmapList{end}.neuron = 8;
aPChotspotmapList{end}.cluster = 1;
aPChotspotmapList{end}.th = 0.1;

% % F:\Data\Jan\Jan 6 OMP AON aPCX
% %12
% aPChotspotmapList{end+1}.dirPath = [disk ':\Data\Jan\Jan 6 OMP AON aPCX\'];
% aPChotspotmapList{end}.neuron = 1;
% aPChotspotmapList{end}.cluster = 0;
% aPChotspotmapList{end}.th = 0.2;
% %12
% aPChotspotmapList{end+1}.dirPath = [disk ':\Data\Jan\Jan 6 OMP AON aPCX\'];
% aPChotspotmapList{end}.neuron = 6;
% aPChotspotmapList{end}.cluster = 0;
% aPChotspotmapList{end}.th = 0.2;
% %13
% aPChotspotmapList{end+1}.dirPath = [disk ':\Data\Jan\Jan 6 OMP AON aPCX\'];
% aPChotspotmapList{end}.neuron = 11;
% aPChotspotmapList{end}.cluster = 0;
% aPChotspotmapList{end}.th = 0.4;

%F:\Data\March\March 3 aPCX
%12
aPChotspotmapList{end+1}.dirPath = [disk ':\Data\2011\March\March 3 aPCX\'];
aPChotspotmapList{end}.neuron = 1;
aPChotspotmapList{end}.cluster = 0;
aPChotspotmapList{end}.th = 0.3;
%13
aPChotspotmapList{end+1}.dirPath = [disk ':\Data\2011\March\March 3 aPCX\'];
aPChotspotmapList{end}.neuron = 5;
aPChotspotmapList{end}.cluster = 1;
aPChotspotmapList{end}.th = 0.3;
%14
aPChotspotmapList{end+1}.dirPath = [disk ':\Data\2011\March\March 3 aPCX\'];
aPChotspotmapList{end}.neuron = 5;
aPChotspotmapList{end}.cluster = 2;
aPChotspotmapList{end}.th = 0.3;
%15
aPChotspotmapList{end+1}.dirPath = [disk ':\Data\2011\March\March 3 aPCX\'];
aPChotspotmapList{end}.neuron = 7;
aPChotspotmapList{end}.cluster = 0;
aPChotspotmapList{end}.th = 0.4;
%16
aPChotspotmapList{end+1}.dirPath = [disk ':\Data\2011\March\March 3 aPCX\'];
aPChotspotmapList{end}.neuron = 11;
aPChotspotmapList{end}.cluster = 0;
aPChotspotmapList{end}.th = 0.;


%F:\Data\March\March 28 aPCX
%17
aPChotspotmapList{end+1}.dirPath = [disk ':\Data\2011\March\March 28 aPCX\'];
aPChotspotmapList{end}.neuron = 1;
aPChotspotmapList{end}.cluster = 1;
aPChotspotmapList{end}.th = 0.;
%18
aPChotspotmapList{end+1}.dirPath = [disk ':\Data\2011\March\March 28 aPCX\'];
aPChotspotmapList{end}.neuron = 3;
aPChotspotmapList{end}.cluster = 0;
aPChotspotmapList{end}.th = 0.1;
%19
aPChotspotmapList{end+1}.dirPath = [disk ':\Data\2011\March\March 28 aPCX\'];
aPChotspotmapList{end}.neuron = 4;
aPChotspotmapList{end}.cluster = 0;
aPChotspotmapList{end}.th = 0.1;
%19
aPChotspotmapList{end+1}.dirPath = [disk ':\Data\2011\March\March 28 aPCX\'];
aPChotspotmapList{end}.neuron = 6;
aPChotspotmapList{end}.cluster = 0;
aPChotspotmapList{end}.th = 0.1;
%20
aPChotspotmapList{end+1}.dirPath = [disk ':\Data\2011\March\March 28 aPCX\'];
aPChotspotmapList{end}.neuron = 8;
aPChotspotmapList{end}.cluster = 0;
aPChotspotmapList{end}.th = 0.3;
%21
aPChotspotmapList{end+1}.dirPath = [disk ':\Data\2011\March\March 28 aPCX\'];
aPChotspotmapList{end}.neuron = 11;
aPChotspotmapList{end}.cluster = 0;
aPChotspotmapList{end}.th = 0.5;
%22
aPChotspotmapList{end+1}.dirPath = [disk ':\Data\2011\March\March 28 aPCX\'];
aPChotspotmapList{end}.neuron = 15;
aPChotspotmapList{end}.cluster = 0;
aPChotspotmapList{end}.th = 0.;
%23
aPChotspotmapList{end+1}.dirPath = [disk ':\Data\2012\Jan 2012\Jan 1 2012 aPCX\'];
aPChotspotmapList{end}.neuron = 1;
aPChotspotmapList{end}.cluster = 1;
aPChotspotmapList{end}.th = -9;
%24
aPChotspotmapList{end+1}.dirPath = [disk ':\Data\2012\Jan 2012\Jan 1 2012 aPCX\'];
aPChotspotmapList{end}.neuron = 3;
aPChotspotmapList{end}.cluster = 1;
aPChotspotmapList{end}.th = -9;

%25
aPChotspotmapList{end+1}.dirPath = [disk ':\Data\2012\Jan 2012\Jan 1 2012 aPCX\'];
aPChotspotmapList{end}.neuron = 6;
aPChotspotmapList{end}.cluster = 0;
aPChotspotmapList{end}.th = -9;



lighOnOffDiff=[];
for i=1:length(aPChotspotmapList)
    i
    dirPath = aPChotspotmapList{i}.dirPath;
    [exp]= readExpDescFile(dirPath);
    lp = initLightParam(exp, aPChotspotmapList{i}.neuron, 1); lp = readLpData( lp, aPChotspotmapList{i}.th, 1, aPChotspotmapList{i}.cluster);
    hotspotMap;
    close;
    aPChotspotmapList{i}.lp = lp;
    
    lighOnOffDiff(end+1) = mean(lp.lightSpikesFRnew)/mean(lp.nonLightSpikes_allNew);
end

