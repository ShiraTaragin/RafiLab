% a list of bulb hotspots to be analyzed
disk = 'f';
hotspotmapList=[];

%1
hotspotmapList{1}.dirPath = [disk ':\Data\2011\Jan\Jan 27 OMP bulb\'];
hotspotmapList{1}.neuron = 1;
hotspotmapList{1}.cluster = 1;
hotspotmapList{1}.th = 0;
hotspotmapList{1}.spotTh = 30;
hotspotmapList{1}.cen = [1 4 ];
%2
hotspotmapList{end+1}.dirPath = [disk ':\Data\2011\Jan\Jan 27 OMP bulb\'];
hotspotmapList{end}.neuron = 1;
hotspotmapList{end}.cluster = 2;
hotspotmapList{end}.th = 0;
hotspotmapList{end}.spotTh = 14;
hotspotmapList{end}.cen = [3 4];
%3
hotspotmapList{end+1}.dirPath = [disk ':\Data\2011\Jan\Jan 27 OMP bulb\'];
hotspotmapList{end}.neuron = 2;
hotspotmapList{end}.cluster = 1;
hotspotmapList{end}.th = 0;
hotspotmapList{end}.spotTh = 30;
hotspotmapList{end}.cen = [5 4];
%4
hotspotmapList{end+1}.dirPath = [disk ':\Data\2011\Jan\Jan 27 OMP bulb\'];
hotspotmapList{end}.neuron = 2;
hotspotmapList{end}.cluster = 2;
hotspotmapList{end}.th = 0;
hotspotmapList{end}.spotTh = 15;
hotspotmapList{end}.cen = [7 5];
%5
hotspotmapList{end+1}.dirPath = [disk ':\Data\2011\Jan\Jan 27 OMP bulb\'];
hotspotmapList{end}.neuron = 4;
hotspotmapList{end}.cluster = 0;
hotspotmapList{end}.th = 0.8;
hotspotmapList{end}.spotTh = 15;
hotspotmapList{end}.cen = [5 4];
%6
hotspotmapList{end+1}.dirPath = [disk ':\Data\2011\Jan\Jan 27 OMP bulb\'];
hotspotmapList{end}.neuron = 5;
hotspotmapList{end}.cluster = 1;
hotspotmapList{end}.th = 0.65;
hotspotmapList{end}.spotTh = 35;
hotspotmapList{end}.cen = [4 4];
%7
hotspotmapList{end+1}.dirPath = [disk ':\Data\2011\Jan\Jan 27 OMP bulb\'];
hotspotmapList{end}.neuron = 5;
hotspotmapList{end}.cluster = 2;
hotspotmapList{end}.th = 0.65;
hotspotmapList{end}.spotTh = 55;
hotspotmapList{end}.cen = [6 4];

% % 8 this neuron as very small if it all inhibition
% hotspotmapList{end+1}.dirPath = [disk ':\Data\Jan\Jan 27 OMP bulb\'];
% hotspotmapList{end}.neuron = 6;
% hotspotmapList{end}.cluster = 1;
% hotspotmapList{end}.th = 0.65;
% hotspotmapList{end}.spotTh = 0;
% hotspotmapList{end}.cen = [];
% %9
% hotspotmapList{end+1}.dirPath = [disk ':\Data\Jan\Jan 27 OMP bulb\'];
% hotspotmapList{end}.neuron = 6;
% hotspotmapList{end}.cluster = 1;
% hotspotmapList{end}.th = 0.65;
% hotspotmapList{end}.spotTh = 0;
% hotspotmapList{end}.cen = [];

%8
% this is the example that we should take to the paper
hotspotmapList{end+1}.dirPath = [disk ':\Data\2011\Jan\Jan 27 OMP bulb\'];
hotspotmapList{end}.neuron = 8;
hotspotmapList{end}.cluster = 2;
hotspotmapList{end}.th = 0.65;
hotspotmapList{end}.spotTh = 30;
hotspotmapList{end}.cen = [4 4];

%9
hotspotmapList{end+1}.dirPath = [disk ':\Data\2011\Jan\Jan 27 OMP bulb\'];
hotspotmapList{end}.neuron = 10;
hotspotmapList{end}.cluster = 1;
hotspotmapList{end}.th = 0.65;
hotspotmapList{end}.spotTh = 11.5;
hotspotmapList{end}.cen = [4 4 ];

%10
hotspotmapList{end+1}.dirPath = [disk ':\Data\2011\Jan\Jan 27 OMP bulb\'];
hotspotmapList{end}.neuron = 12;
hotspotmapList{end}.cluster = 1;
hotspotmapList{end}.th = 0.65;
hotspotmapList{end}.spotTh = 26;
hotspotmapList{end}.cen = [5 7 ];



%11
hotspotmapList{end+1}.dirPath = [disk ':\Data\2010\December 2010\Dec 22 OMP Bulb\'];
hotspotmapList{end}.neuron = 1;
hotspotmapList{end}.cluster = 0;
hotspotmapList{end}.th = 0.2;
hotspotmapList{end}.spotTh = 80;
hotspotmapList{end}.cen = [7 4];

%12
hotspotmapList{end+1}.dirPath = [disk ':\Data\2010\December 2010\Dec 22 OMP Bulb\'];
hotspotmapList{end}.neuron = 2;
hotspotmapList{end}.cluster = 0;
hotspotmapList{end}.th = 0.2;
hotspotmapList{end}.spotTh = 80;
hotspotmapList{end}.cen = [8 3];

%13
hotspotmapList{end+1}.dirPath = [disk ':\Data\2010\December 2010\Dec 22 OMP Bulb\'];
hotspotmapList{end}.neuron = 6;
hotspotmapList{end}.cluster = 1;
hotspotmapList{end}.th = 0.6;
hotspotmapList{end}.spotTh = 35;
hotspotmapList{end}.cen = [7 4 ];

%14
hotspotmapList{end+1}.dirPath = [disk ':\Data\2010\December 2010\Dec 22 OMP Bulb\'];
hotspotmapList{end}.neuron = 13;
hotspotmapList{end}.cluster = 0;
hotspotmapList{end}.th = 0.3;
hotspotmapList{end}.spotTh = 40;
hotspotmapList{end}.cen = [6 9];

%15
hotspotmapList{end+1}.dirPath = [disk ':\Data\2011\Jan\Jan 6 OMP AON Bulb\'];
hotspotmapList{end}.neuron = 20;
hotspotmapList{end}.cluster = 0;
hotspotmapList{end}.th = 0.3;
hotspotmapList{end}.spotTh = 40;
hotspotmapList{end}.cen = [3 1 ];

%16
hotspotmapList{end+1}.dirPath = [disk ':\Data\2011\Jan\Jan 6 OMP AON Bulb\'];
hotspotmapList{end}.neuron = 22;
hotspotmapList{end}.cluster = 1;
hotspotmapList{end}.th = 0.3;
hotspotmapList{end}.spotTh = 25;
hotspotmapList{end}.cen = [4 2 ];

%17
hotspotmapList{end+1}.dirPath = [disk ':\Data\2011\Jan\Jan 6 OMP AON Bulb\'];
hotspotmapList{end}.neuron = 25;
hotspotmapList{end}.cluster = 1;
hotspotmapList{end}.th = 0.3;
hotspotmapList{end}.spotTh = 20;
hotspotmapList{end}.cen = [5 2];


%%%%%%%%%%%
%20
% hotspotmapList{end+1}.dirPath = [disk ':\Data\Jan\Jan 13 OMP Bulb'];
% hotspotmapList{end}.neuron = 17;
% hotspotmapList{end}.cluster = 1;
% hotspotmapList{end}.th = 0.3;

% %21
% hotspotmapList{end+1}.dirPath = [disk ':\Data\Jan\Jan 13 OMP Bulb'];
% hotspotmapList{end}.neuron = 19;
% hotspotmapList{end}.cluster = 1;
% hotspotmapList{end}.th = 0.3;

%18
hotspotmapList{end+1}.dirPath = [disk ':\Data\2011\Jan\Jan 13 OMP Bulb'];
hotspotmapList{end}.neuron = 20;
hotspotmapList{end}.cluster = 1;
hotspotmapList{end}.th = 0.3;
hotspotmapList{end}.spotTh = 20;
hotspotmapList{end}.cen = [3 8];

%19
% hotspotmapList{end+1}.dirPath = [disk ':\Data\2011\Jan\Jan 13 OMP Bulb'];
% hotspotmapList{end}.neuron = 27;
% hotspotmapList{end}.cluster = 0;
% hotspotmapList{end}.th = 0.3;
% hotspotmapList{end}.spotTh = 25;
% hotspotmapList{end}.cen = [5 6];


%%%%%%%%%%%%%%%%%%%5
%20
hotspotmapList{end+1}.dirPath = [disk ':\Data\2011\Jan\Jan 28 OMP bulb'];
hotspotmapList{end}.neuron = 2;
hotspotmapList{end}.cluster = 0;
hotspotmapList{end}.th = 0.6;
hotspotmapList{end}.spotTh = 13;
hotspotmapList{end}.cen = [5 6];

%21
hotspotmapList{end+1}.dirPath = [disk ':\Data\2011\Jan\Jan 28 OMP bulb'];
hotspotmapList{end}.neuron = 4;
hotspotmapList{end}.cluster = 0;
hotspotmapList{end}.th = 0.6;
hotspotmapList{end}.spotTh = 55;
hotspotmapList{end}.cen = [5 3];


%%%%%%%%%%%%%%%%%%%5
%24
% hotspotmapList{end+1}.dirPath = [disk ':\Data\November\November 4 OMP Bulb\'];
% hotspotmapList{end}.neuron = 1;
% hotspotmapList{end}.cluster = 0;
% hotspotmapList{end}.th = 0.86;

%22 good example neuron spike
hotspotmapList{end+1}.dirPath = [disk ':\Data\2011\March\March 3 Bulb\'];
hotspotmapList{end}.neuron = 13;
hotspotmapList{end}.cluster = 1;
hotspotmapList{end}.th = 0.6;
hotspotmapList{end}.spotTh = 20;
hotspotmapList{end}.cen = [3 3];

%23
hotspotmapList{end+1}.dirPath = [disk ':\Data\2011\March\March 8 bulb\'];
hotspotmapList{end}.neuron = 16;
hotspotmapList{end}.cluster = 2;
hotspotmapList{end}.th = 0.6;
hotspotmapList{end}.spotTh = 3;
hotspotmapList{end}.cen = [6 3];

%24
hotspotmapList{end+1}.dirPath = [disk ':\Data\2011\March\March 8 bulb\'];
hotspotmapList{end}.neuron = 16;
hotspotmapList{end}.cluster = 3;
hotspotmapList{end}.th = 0.6;
hotspotmapList{end}.spotTh = 4;
hotspotmapList{end}.cen = [6 4];

%25
hotspotmapList{end+1}.dirPath = [disk ':\Data\2011\March\March 10 bulb\'];
hotspotmapList{end}.neuron = 1;
hotspotmapList{end}.cluster = 0;
hotspotmapList{end}.th = 0.5;
hotspotmapList{end}.spotTh = 30;
hotspotmapList{end}.cen = [4 6];


% %29
% hotspotmapList{end+1}.dirPath = [disk ':\Data\2011\March\March 3 Bulb\'];
% hotspotmapList{end}.neuron = 13;
% hotspotmapList{end}.cluster = 2;
% hotspotmapList{end}.th = 0;
% hotspotmapList{end}.spotTh = 11;
% hotspotmapList{end}.cen = [3 1 ];
% 
% %27
% hotspotmapList{end+1}.dirPath = [disk ':\Data\2011\March\March 14 Bulb\'];
% hotspotmapList{end}.neuron = 9;
% hotspotmapList{end}.cluster = 0;
% hotspotmapList{end}.th = 0.4;
% hotspotmapList{end}.spotTh = 41;
% hotspotmapList{end}.cen = [4 1 ];

%28
hotspotmapList{end+1}.dirPath = [disk ':\Data\2011\March\March 14 Bulb\'];
hotspotmapList{end}.neuron = 15;
hotspotmapList{end}.cluster = 0;
hotspotmapList{end}.th = 0.4;
hotspotmapList{end}.spotTh = 47;
hotspotmapList{end}.cen = [8 5];


%29
hotspotmapList{end+1}.dirPath = [disk ':\Data\2011\April\April 26 OMP bulb\'];
hotspotmapList{end}.neuron = 2;
hotspotmapList{end}.cluster = 1;
hotspotmapList{end}.th = 0.4;
hotspotmapList{end}.spotTh = 13;
hotspotmapList{end}.cen = [7 2];

%30
hotspotmapList{end+1}.dirPath = [disk ':\Data\2011\April\April 26 OMP bulb\'];
hotspotmapList{end}.neuron = 2;
hotspotmapList{end}.cluster = 1;
hotspotmapList{end}.th = 0.4;
hotspotmapList{end}.spotTh = 13;
hotspotmapList{end}.cen = [7 2];


%31
hotspotmapList{end+1}.dirPath = [disk ':\Data\2012\Jan 2012\Jan 3 2012 bulb\'];
hotspotmapList{end}.neuron = 7;
hotspotmapList{end}.cluster = 1;
hotspotmapList{end}.th = 0.4;
hotspotmapList{end}.spotTh = 16;
hotspotmapList{end}.cen = [ 3 1 ];


%32
hotspotmapList{end+1}.dirPath = [disk ':\Data\2012\Jan 2012\Jan 5 2012 bulb\'];
hotspotmapList{end}.neuron = 3;
hotspotmapList{end}.cluster = 1;
hotspotmapList{end}.th = 0.4;
hotspotmapList{end}.spotTh = 40;
hotspotmapList{end}.cen = [ 4 5 ];

%33
hotspotmapList{end+1}.dirPath = [disk ':\Data\2012\Jan 2012\Jan 5 2012 bulb\'];
hotspotmapList{end}.neuron = 9;
hotspotmapList{end}.cluster = 1;
hotspotmapList{end}.th = 0.4;
hotspotmapList{end}.spotTh = 16;
hotspotmapList{end}.cen = [ 5 6 ];

%34
hotspotmapList{end+1}.dirPath = [disk ':\Data\2012\Jan 2012\Jan 5 2012 bulb\'];
hotspotmapList{end}.neuron = 9;
hotspotmapList{end}.cluster = 2;
hotspotmapList{end}.th = 0.4;
hotspotmapList{end}.spotTh = 40;
hotspotmapList{end}.cen = [ 4 2 ];

%35
hotspotmapList{end+1}.dirPath = [disk ':\Data\2012\Jan 2012\Jan 6 2012 bulb\'];
hotspotmapList{end}.neuron = 1;
hotspotmapList{end}.cluster = 3;
hotspotmapList{end}.th = 0.4;
hotspotmapList{end}.spotTh = 12;
hotspotmapList{end}.cen = [ 3 2 ];

%36
hotspotmapList{end+1}.dirPath = [disk ':\Data\2012\Jan 2012\Jan 8 2012 bulb\'];
hotspotmapList{end}.neuron = 1;
hotspotmapList{end}.cluster = 0;
hotspotmapList{end}.th = -4;
hotspotmapList{end}.spotTh = 12;
hotspotmapList{end}.cen = [ 3 1 ];


%%%%%%%%%%%%%%%%
% nice spike shape
hotspotmapList{end+1}.dirPath = [disk ':\Data\2012\Feb 2012\Feb 3 2012 OMP bulb\'];
hotspotmapList{end}.neuron = 4;
hotspotmapList{end}.cluster = 2;
hotspotmapList{end}.th = -4;
hotspotmapList{end}.spotTh = 10;
hotspotmapList{end}.cen = [ 3 3 ];




%
hotspotmapList{end+1}.dirPath = [disk ':\Data\2012\March 2012\March 1 2012 OMP bulb\'];
hotspotmapList{end}.neuron = 1;
hotspotmapList{end}.cluster = 2;
hotspotmapList{end}.th = -4;
hotspotmapList{end}.spotTh = 50;
hotspotmapList{end}.cen = [ 1 4];

hotspotmapList{end+1}.dirPath = [disk ':\Data\2012\March 2012\March 1 2012 OMP bulb\'];
hotspotmapList{end}.neuron = 1;
hotspotmapList{end}.cluster = 1;
hotspotmapList{end}.th = -4;
hotspotmapList{end}.spotTh = 27;
hotspotmapList{end}.cen = [ 2 3 ];

hotspotmapList{end+1}.dirPath = [disk ':\Data\2012\March 2012\March 1 2012 OMP bulb\'];
hotspotmapList{end}.neuron = 5;
hotspotmapList{end}.cluster = 1;
hotspotmapList{end}.th = -4;
hotspotmapList{end}.spotTh = 20;
hotspotmapList{end}.cen = [ 4 4 ];

%%%%%%
% new data done at the end of Dec 2012
hotspotmapList{end+1}.dirPath = [disk ':\Data\2012\Dec 2012\Dec 26 2012 OMP bulb\'];
hotspotmapList{end}.neuron = 1;
hotspotmapList{end}.cluster = 1;
hotspotmapList{end}.th = -4;
hotspotmapList{end}.spotTh = 15;
hotspotmapList{end}.cen = [ 6 4 ];

hotspotmapList{end+1}.dirPath = [disk ':\Data\2012\Dec 2012\Dec 26 2012 OMP bulb\'];
hotspotmapList{end}.neuron = 4;
hotspotmapList{end}.cluster = 1;
hotspotmapList{end}.th = -4;
hotspotmapList{end}.spotTh = 7;
hotspotmapList{end}.cen = [ 1 2 ];

hotspotmapList{end+1}.dirPath = [disk ':\Data\2012\Dec 2012\Dec 26 2012 OMP bulb\'];
hotspotmapList{end}.neuron = 4;
hotspotmapList{end}.cluster = 2;
hotspotmapList{end}.th = -4;
hotspotmapList{end}.spotTh = 22;
hotspotmapList{end}.cen = [ 1 2 ];

hotspotmapList{end+1}.dirPath = [disk ':\Data\2012\Dec 2012\Dec 26 2012 OMP bulb\'];
hotspotmapList{end}.neuron = 8;
hotspotmapList{end}.cluster = 1;
hotspotmapList{end}.th = -4;
hotspotmapList{end}.spotTh = 35;
hotspotmapList{end}.cen = [ 2 1 ];

hotspotmapList{end+1}.dirPath = [disk ':\Data\2012\Dec 2012\Dec 26 2012 OMP bulb\'];
hotspotmapList{end}.neuron = 8;
hotspotmapList{end}.cluster = 2;
hotspotmapList{end}.th = -4;
hotspotmapList{end}.spotTh = 60;
hotspotmapList{end}.cen = [ 4 1 ];

hotspotmapList{end+1}.dirPath = [disk ':\Data\2012\Dec 2012\Dec 26 2012 OMP bulb\'];
hotspotmapList{end}.neuron = 12;
hotspotmapList{end}.cluster = 1;
hotspotmapList{end}.th = -4;
hotspotmapList{end}.spotTh = 22;
hotspotmapList{end}.cen = [ 4 6 ];

hotspotmapList{end+1}.dirPath = [disk ':\Data\2012\Dec 2012\Dec 26 2012 OMP bulb\'];
hotspotmapList{end}.neuron = 8;
hotspotmapList{end}.cluster = 2;
hotspotmapList{end}.th = -4;
hotspotmapList{end}.spotTh = 60;
hotspotmapList{end}.cen = [ 4 1 ];

% :\Data\2012\Dec 2012\Dec 27 2012 OMP bulb\'
hotspotmapList{end+1}.dirPath = [disk ':\Data\2012\Dec 2012\Dec 27 2012 OMP bulb\'];
hotspotmapList{end}.neuron = 3;
hotspotmapList{end}.cluster = 1;
hotspotmapList{end}.th = -4;
hotspotmapList{end}.spotTh = 40;
hotspotmapList{end}.cen = [ 2 3 ];

hotspotmapList{end+1}.dirPath = [disk ':\Data\2012\Dec 2012\Dec 27 2012 OMP bulb\'];
hotspotmapList{end}.neuron = 9;
hotspotmapList{end}.cluster = 1;
hotspotmapList{end}.th = -4;
hotspotmapList{end}.spotTh = 27;
hotspotmapList{end}.cen = [ 5 6 ];

hotspotmapList{end+1}.dirPath = [disk ':\Data\2012\Dec 2012\Dec 27 2012 OMP bulb\'];
hotspotmapList{end}.neuron = 9;
hotspotmapList{end}.cluster = 1;
hotspotmapList{end}.th = -4;
hotspotmapList{end}.spotTh = 20;
hotspotmapList{end}.cen = [ 2 3 ];

hotspotmapList{end+1}.dirPath = [disk ':\Data\2012\Dec 2012\Dec 27 2012 OMP bulb\'];
hotspotmapList{end}.neuron = 21;
hotspotmapList{end}.cluster = 1;
hotspotmapList{end}.th = -4;
hotspotmapList{end}.spotTh = 30;
hotspotmapList{end}.cen = [ 2 5 ];

hotspotmapList{end+1}.dirPath = [disk ':\Data\2012\Dec 2012\Dec 27 2012 OMP bulb\'];
hotspotmapList{end}.neuron = 23;
hotspotmapList{end}.cluster = 1;
hotspotmapList{end}.th = -4;
hotspotmapList{end}.spotTh = 10;
hotspotmapList{end}.cen = [ 3 6 ];

hotspotmapList{end+1}.dirPath = [disk ':\Data\2012\Dec 2012\Dec 27 2012 OMP bulb\'];
hotspotmapList{end}.neuron = 23;
hotspotmapList{end}.cluster = 2;
hotspotmapList{end}.th = -4;
hotspotmapList{end}.spotTh = 17;
hotspotmapList{end}.cen = [ 4 5 ];

hotspotmapList{end+1}.dirPath = [disk ':\Data\2012\Dec 2012\Dec 27 2012 OMP bulb\'];
hotspotmapList{end}.neuron = 31;
hotspotmapList{end}.cluster = 1;
hotspotmapList{end}.th = -4;
hotspotmapList{end}.spotTh = 57;
hotspotmapList{end}.cen = [2 6 ];

% :\Data\2012\Dec 2012\Dec 28 2012 OMP bulb\'
hotspotmapList{end+1}.dirPath = [disk ':\Data\2012\Dec 2012\Dec 28 2012 OMP bulb\'];
hotspotmapList{end}.neuron = 2;
hotspotmapList{end}.cluster =1;
hotspotmapList{end}.th = -4;
hotspotmapList{end}.spotTh = 20;
hotspotmapList{end}.cen = [3 5];

% :\Data\2012\Dec 2012\Dec 28 2012 OMP bulb\'
hotspotmapList{end+1}.dirPath = [disk ':\Data\2012\Dec 2012\Dec 28 2012 OMP bulb\'];
hotspotmapList{end}.neuron = 3;
hotspotmapList{end}.cluster =1;
hotspotmapList{end}.th = -4;
hotspotmapList{end}.spotTh = 20;
hotspotmapList{end}.cen = [3 5];

hotspotmapList{end+1}.dirPath = [disk ':\Data\2012\Dec 2012\Dec 28 2012 OMP bulb\'];
hotspotmapList{end}.neuron = 4;
hotspotmapList{end}.cluster =1;
hotspotmapList{end}.th = -4;
hotspotmapList{end}.spotTh = 17;
hotspotmapList{end}.cen = [1 7];

hotspotmapList{end+1}.dirPath = [disk ':\Data\2012\Dec 2012\Dec 28 2012 OMP bulb\'];
hotspotmapList{end}.neuron = 5;
hotspotmapList{end}.cluster =1;
hotspotmapList{end}.th = -4;
hotspotmapList{end}.spotTh = 17;
hotspotmapList{end}.cen = [3 6];

hotspotmapList{end+1}.dirPath = [disk ':\Data\2012\Dec 2012\Dec 28 2012 OMP bulb\'];
hotspotmapList{end}.neuron = 7;
hotspotmapList{end}.cluster =1;
hotspotmapList{end}.th = -4;
hotspotmapList{end}.spotTh = 17;
hotspotmapList{end}.cen = [1 5];

hotspotmapList{end+1}.dirPath = [disk ':\Data\2012\Dec 2012\Dec 28 2012 OMP bulb\'];
hotspotmapList{end}.neuron = 7;
hotspotmapList{end}.cluster =2;
hotspotmapList{end}.th = -4;
hotspotmapList{end}.spotTh = 30;
hotspotmapList{end}.cen = [2 5];

hotspotmapList{end+1}.dirPath = [disk ':\Data\2012\Dec 2012\Dec 28 2012 OMP bulb\'];
hotspotmapList{end}.neuron = 9;
hotspotmapList{end}.cluster =1;
hotspotmapList{end}.th = -4;
hotspotmapList{end}.spotTh = 25;
hotspotmapList{end}.cen = [5 3];

hotspotmapList{end+1}.dirPath = [disk ':\Data\2012\Dec 2012\Dec 28 2012 OMP bulb\'];
hotspotmapList{end}.neuron = 11;
hotspotmapList{end}.cluster =1;
hotspotmapList{end}.th = -4;
hotspotmapList{end}.spotTh = 8;
hotspotmapList{end}.cen = [5 1];

hotspotmapList{end+1}.dirPath = [disk ':\Data\2012\Dec 2012\Dec 28 2012 OMP bulb\'];
hotspotmapList{end}.neuron = 13;
hotspotmapList{end}.cluster =1;
hotspotmapList{end}.th = -4;
hotspotmapList{end}.spotTh = 17;
hotspotmapList{end}.cen = [1 1];

hotspotmapList{end+1}.dirPath = [disk ':\Data\2012\Dec 2012\Dec 28 2012 OMP bulb\'];
hotspotmapList{end}.neuron = 17;
hotspotmapList{end}.cluster =1;
hotspotmapList{end}.th = -4;
hotspotmapList{end}.spotTh = 30;
hotspotmapList{end}.cen = [1 6];


% \Data\2012\Dec 2012\Dec 30 2012 OMP bulb\
hotspotmapList{end+1}.dirPath = [disk ':\Data\2012\Dec 2012\Dec 30 2012 OMP bulb\'];
hotspotmapList{end}.neuron = 1;
hotspotmapList{end}.cluster =1;
hotspotmapList{end}.th = -4;
hotspotmapList{end}.spotTh = 20;
hotspotmapList{end}.cen = [4 5];

hotspotmapList{end+1}.dirPath = [disk ':\Data\2012\Dec 2012\Dec 30 2012 OMP bulb\'];
hotspotmapList{end}.neuron = 4;
hotspotmapList{end}.cluster =1;
hotspotmapList{end}.th = -4;
hotspotmapList{end}.spotTh = 20;
hotspotmapList{end}.cen = [5 2];

hotspotmapList{end+1}.dirPath = [disk ':\Data\2012\Dec 2012\Dec 30 2012 OMP bulb\'];
hotspotmapList{end}.neuron = 13;
hotspotmapList{end}.cluster =1;
hotspotmapList{end}.th = -4;
hotspotmapList{end}.spotTh = 55;
hotspotmapList{end}.cen = [5 2];

hotspotmapList{end+1}.dirPath = [disk ':\Data\2012\Dec 2012\Dec 30 2012 OMP bulb\'];
hotspotmapList{end}.neuron = 16;
hotspotmapList{end}.cluster =1;
hotspotmapList{end}.th = -4;
hotspotmapList{end}.spotTh = 22;
hotspotmapList{end}.cen = [3 4];

hotspotmapList{end+1}.dirPath = [disk ':\Data\2012\Dec 2012\Dec 30 2012 OMP bulb\'];
hotspotmapList{end}.neuron = 20;
hotspotmapList{end}.cluster =1;
hotspotmapList{end}.th = -4;
hotspotmapList{end}.spotTh = 50;
hotspotmapList{end}.cen = [4 8];

hotspotmapList{end+1}.dirPath = [disk ':\Data\2012\Dec 2012\Dec 30 2012 OMP bulb\'];
hotspotmapList{end}.neuron = 20;
hotspotmapList{end}.cluster =1;
hotspotmapList{end}.th = -4;
hotspotmapList{end}.spotTh = 50;
hotspotmapList{end}.cen = [4 8];

%\Data\2013\Jan 2013\Jan 1 2013 OMP bulb
hotspotmapList{end+1}.dirPath = [disk ':\Data\2013\Jan 2013\Jan 1 2013 OMP bulb\'];
hotspotmapList{end}.neuron = 3;
hotspotmapList{end}.cluster =1;
hotspotmapList{end}.th = -4;
hotspotmapList{end}.spotTh = 25;
hotspotmapList{end}.cen = [3 7];

hotspotmapList{end+1}.dirPath = [disk ':\Data\2013\Jan 2013\Jan 1 2013 OMP bulb\'];
hotspotmapList{end}.neuron = 5;
hotspotmapList{end}.cluster =1;
hotspotmapList{end}.th = -4;
hotspotmapList{end}.spotTh = 30;
hotspotmapList{end}.cen = [2 7];

hotspotmapList{end+1}.dirPath = [disk ':\Data\2013\Jan 2013\Jan 1 2013 OMP bulb\'];
hotspotmapList{end}.neuron = 8;
hotspotmapList{end}.cluster =1;
hotspotmapList{end}.th = -4;
hotspotmapList{end}.spotTh = 25;
hotspotmapList{end}.cen = [3 2];

hotspotmapList{end+1}.dirPath = [disk ':\Data\2013\Jan 2013\Jan 1 2013 OMP bulb\'];
hotspotmapList{end}.neuron = 8;
hotspotmapList{end}.cluster =2;
hotspotmapList{end}.th = -4;
hotspotmapList{end}.spotTh = 25;
hotspotmapList{end}.cen = [3 2];

hotspotmapList{end+1}.dirPath = [disk ':\Data\2013\Jan 2013\Jan 1 2013 OMP bulb\'];
hotspotmapList{end}.neuron = 11;
hotspotmapList{end}.cluster =1;
hotspotmapList{end}.th = -4;
hotspotmapList{end}.spotTh = 20;
hotspotmapList{end}.cen = [4 3];

hotspotmapList{end+1}.dirPath = [disk ':\Data\2013\Jan 2013\Jan 1 2013 OMP bulb\'];
hotspotmapList{end}.neuron = 13;
hotspotmapList{end}.cluster =1;
hotspotmapList{end}.th = -4;
hotspotmapList{end}.spotTh = 25;
hotspotmapList{end}.cen = [5 3];

hotspotmapList{end+1}.dirPath = [disk ':\Data\2013\Jan 2013\Jan 1 2013 OMP bulb\'];
hotspotmapList{end}.neuron = 18;
hotspotmapList{end}.cluster =1;
hotspotmapList{end}.th = -4;
hotspotmapList{end}.spotTh = 20;
hotspotmapList{end}.cen = [1 7];

hotspotmapList{end+1}.dirPath = [disk ':\Data\2013\Jan 2013\Jan 1 2013 OMP bulb\'];
hotspotmapList{end}.neuron = 20;
hotspotmapList{end}.cluster =2;
hotspotmapList{end}.th = -4;
hotspotmapList{end}.spotTh = 20;
hotspotmapList{end}.cen = [2 4];

hotspotmapList{end+1}.dirPath = [disk ':\Data\2013\Jan 2013\Jan 1 2013 OMP bulb\'];
hotspotmapList{end}.neuron = 20;
hotspotmapList{end}.cluster =1;
hotspotmapList{end}.th = -4;
hotspotmapList{end}.spotTh = 20;
hotspotmapList{end}.cen = [2 4];

hotspotmapList{end+1}.dirPath = [disk ':\Data\2013\Jan 2013\Jan 1 2013 OMP bulb\'];
hotspotmapList{end}.neuron = 21;
hotspotmapList{end}.cluster =1;
hotspotmapList{end}.th = -4;
hotspotmapList{end}.spotTh = 14;
hotspotmapList{end}.cen = [5 1];

for i=1:length(hotspotmapList)
    i=i
    dirPath = hotspotmapList{i}.dirPath
    [exp]= readExpDescFile(dirPath);
    lp = initLightParam(exp, hotspotmapList{i}.neuron, 1); lp = readLpData( lp, hotspotmapList{i}.th, 1, hotspotmapList{i}.cluster);
    hotspotMap;
    close;
    hotspotmapList{i}.lp = lp;
end

