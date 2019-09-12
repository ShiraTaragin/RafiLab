% a list of bulb hotspots to be analyzed
disk = pwd;
disk=disk(1)';
aPChotspotmapListTBET=[];

%1
aPChotspotmapListTBET{1}.dirPath = [disk ':\Data\June\June 1 TBET aPCX\'];
aPChotspotmapListTBET{1}.neuron = 21;
aPChotspotmapListTBET{1}.cluster = 0;
aPChotspotmapListTBET{1}.th = 0;
%2
aPChotspotmapListTBET{end+1}.dirPath = [disk ':\Data\June\June 1 TBET aPCX\'];
aPChotspotmapListTBET{end}.neuron = 25;
aPChotspotmapListTBET{end}.cluster = 0;
aPChotspotmapListTBET{end}.th = 0;
%3
aPChotspotmapListTBET{end+1}.dirPath = [disk ':\Data\June\June 1 TBET aPCX\'];
aPChotspotmapListTBET{end}.neuron = 27;
aPChotspotmapListTBET{end}.cluster = 0;
aPChotspotmapListTBET{end}.th = 0;


% F:\Data\June\June 22 TBET aPCX

%4
aPChotspotmapListTBET{end+1}.dirPath = [disk ':\Data\June\June 22 TBET aPCX\'];
aPChotspotmapListTBET{end}.neuron = 13;
aPChotspotmapListTBET{end}.cluster = 0;
aPChotspotmapListTBET{end}.th = 0;

% F:\Data\Jan\Jan 30 TBET aPCX

%5
aPChotspotmapListTBET{end+1}.dirPath = [disk ':\Data\Jan\Jan 30 TBET aPCX\'];
aPChotspotmapListTBET{end}.neuron = 1;
aPChotspotmapListTBET{end}.cluster = 0;
aPChotspotmapListTBET{end}.th = 0;
%6
aPChotspotmapListTBET{end+1}.dirPath = [disk ':\Data\Jan\Jan 30 TBET aPCX\'];
aPChotspotmapListTBET{end}.neuron = 3;
aPChotspotmapListTBET{end}.cluster = 1;
aPChotspotmapListTBET{end}.th = 0;
%7
aPChotspotmapListTBET{end+1}.dirPath = [disk ':\Data\Jan\Jan 30 TBET aPCX\'];
aPChotspotmapListTBET{end}.neuron = 3;
aPChotspotmapListTBET{end}.cluster = 2;
aPChotspotmapListTBET{end}.th = 0;
%8
aPChotspotmapListTBET{end+1}.dirPath = [disk ':\Data\Jan\Jan 30 TBET aPCX\'];
aPChotspotmapListTBET{end}.neuron = 3;
aPChotspotmapListTBET{end}.cluster = 3;
aPChotspotmapListTBET{end}.th = 0;
%8
aPChotspotmapListTBET{end+1}.dirPath = [disk ':\Data\Jan\Jan 30 TBET aPCX\'];
aPChotspotmapListTBET{end}.neuron = 4;
aPChotspotmapListTBET{end}.cluster = 2;
aPChotspotmapListTBET{end}.th = 0;
%9
aPChotspotmapListTBET{end+1}.dirPath = [disk ':\Data\Jan\Jan 30 TBET aPCX\'];
aPChotspotmapListTBET{end}.neuron = 6;
aPChotspotmapListTBET{end}.cluster = 2;
aPChotspotmapListTBET{end}.th = 0;




for i=1:length(aPChotspotmapListTBET)
    i=i
    dirPath = aPChotspotmapListTBET{i}.dirPath;
    p=pwd;
    dirPath(1) = p(1);
    [exp]= readExpDescFile(dirPath);
    lp = initLightParam(exp, aPChotspotmapListTBET{i}.neuron, 1); lp = readLpData( lp, aPChotspotmapListTBET{i}.th, 1, aPChotspotmapListTBET{i}.cluster);
    hotspotMap;
    close;
    aPChotspotmapListTBET{i}.lp = lp;
end

