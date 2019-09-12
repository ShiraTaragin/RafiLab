% a list of bulb hotspots to be analyzed
disk = pwd;
disk=disk(1)';
pPChotspotmapListTBET=[];

% :\Data\May\May 26 TBET pPCX\
%1
pPChotspotmapListTBET{1}.dirPath = [disk ':\Data\May\May 26 TBET pPCX\'];
pPChotspotmapListTBET{1}.neuron = 4;
pPChotspotmapListTBET{1}.cluster = 0;
pPChotspotmapListTBET{1}.th = 0;
%2
pPChotspotmapListTBET{end+1}.dirPath = [disk ':\Data\May\May 26 TBET pPCX\'];
pPChotspotmapListTBET{end}.neuron = 6;
pPChotspotmapListTBET{end}.cluster = 0;
pPChotspotmapListTBET{end}.th = 0;

% F:\Data\May\May 31 TBET pPCX Bulb
%3
pPChotspotmapListTBET{end+1}.dirPath = [disk ':\Data\May\May 31 TBET pPCX Bulb\'];
pPChotspotmapListTBET{end}.neuron = 1;
pPChotspotmapListTBET{end}.cluster = 1;
pPChotspotmapListTBET{end}.th = 0;
%4
pPChotspotmapListTBET{end+1}.dirPath = [disk ':\Data\May\May 31 TBET pPCX Bulb\'];
pPChotspotmapListTBET{end}.neuron = 3;
pPChotspotmapListTBET{end}.cluster = 0;
pPChotspotmapListTBET{end}.th = 0;
%5
pPChotspotmapListTBET{end+1}.dirPath = [disk ':\Data\May\May 31 TBET pPCX Bulb\'];
pPChotspotmapListTBET{end}.neuron = 8;
pPChotspotmapListTBET{end}.cluster = 1;
pPChotspotmapListTBET{end}.th = 0;
%6
pPChotspotmapListTBET{end+1}.dirPath = [disk ':\Data\May\May 31 TBET pPCX Bulb\'];
pPChotspotmapListTBET{end}.neuron = 8;
pPChotspotmapListTBET{end}.cluster = 2;
pPChotspotmapListTBET{end}.th = 0;

% F:\Data\August\August 26 TBET pPCX
%7
pPChotspotmapListTBET{end+1}.dirPath = [disk ':\Data\August\August 26 TBET pPCX\'];
pPChotspotmapListTBET{end}.neuron = 1;
pPChotspotmapListTBET{end}.cluster = 0;
pPChotspotmapListTBET{end}.th = 0;
%8
pPChotspotmapListTBET{end+1}.dirPath = [disk ':\Data\August\August 26 TBET pPCX\'];
pPChotspotmapListTBET{end}.neuron = 5;
pPChotspotmapListTBET{end}.cluster = 0;
pPChotspotmapListTBET{end}.th = 0;
%9
pPChotspotmapListTBET{end+1}.dirPath = [disk ':\Data\August\August 26 TBET pPCX\'];
pPChotspotmapListTBET{end}.neuron = 8;
pPChotspotmapListTBET{end}.cluster = 1;
pPChotspotmapListTBET{end}.th = 0;
%10
pPChotspotmapListTBET{end+1}.dirPath = [disk ':\Data\August\August 26 TBET pPCX\'];
pPChotspotmapListTBET{end}.neuron = 8;
pPChotspotmapListTBET{end}.cluster = 2;
pPChotspotmapListTBET{end}.th = 0;
%11
pPChotspotmapListTBET{end+1}.dirPath = [disk ':\Data\August\August 26 TBET pPCX\'];
pPChotspotmapListTBET{end}.neuron = 10;
pPChotspotmapListTBET{end}.cluster = 0;
pPChotspotmapListTBET{end}.th = 0;






for i=1:length(pPChotspotmapListTBET)
    i=i
    dirPath = pPChotspotmapListTBET{i}.dirPath;
    p=pwd;
    dirPath(1) = p(1);
    [exp]= readExpDescFile(dirPath);
    lp = initLightParam(exp, pPChotspotmapListTBET{i}.neuron, 1); lp = readLpData( lp, pPChotspotmapListTBET{i}.th, 1, pPChotspotmapListTBET{i}.cluster);
    hotspotMap;
    close;
    pPChotspotmapListTBET{i}.lp = lp;
end

