function lpall = readAllIsoExp(lpall)


% 14.7.16 Tbet iso flurence
%-----------------------------------------
% a 6x6 pixel which is 120x120 um these are 3 sister mt cells with
% overlaping inhibtion
lpall(end+1).dirPath='E:\Data\2016\July\14.7.16_Tbet_Iso\';
lpall(end).fileIndx=7;
lpall(end).cluster=[1];
lpall(end).mouseType = 'TBET';
lpall(end).EXTEND_SPIKE_TIME_CALCULATION=0;
lpall(end).twoBulbs = 0; % we flag it is two bulbs togethe
lpall(end).sniffDirection=0;
lpall(end).cen=[];
lpall(end).anest = 'iso';




% 5*5 which is 100x100 um
lpall(end+1).dirPath='E:\Data\2016\July\14.7.16_Tbet_Iso\';
lpall(end).fileIndx=8;
lpall(end).cluster=[1];
lpall(end).mouseType = 'TBET';
lpall(end).anest = 'iso';
% 5*5 which is 100x100 um
lpall(end+1).dirPath='E:\Data\2016\July\14.7.16_Tbet_Iso\';
lpall(end).fileIndx=9;
lpall(end).cluster=[1];
lpall(end).mouseType = 'TBET';
lpall(end).anest = 'iso';

% same htospot but not a sister as there is no correlation
% 5*5 which is 100x100 um
% clustering is not great as ISI% is high
lpall(end+1).dirPath='E:\Data\2016\July\14.7.16_Tbet_Iso\';
lpall(end).fileIndx=13;
lpall(end).cluster=[1];
lpall(end).mouseType = 'TBET';
lpall(end).anest = 'iso';
lpall(end+1).dirPath='E:\Data\2016\July\14.7.16_Tbet_Iso\';
lpall(end).fileIndx=13;
lpall(end).cluster=[2];
lpall(end).mouseType = 'TBET';
lpall(end).anest = 'iso';

lpall(end+1).dirPath='E:\Data\2016\July\14.7.16_Tbet_Iso\';
lpall(end).fileIndx=15;
lpall(end).cluster=[1];
lpall(end).mouseType = 'TBET';
lpall(end).anest = 'iso';

% non sister, with different inhibtion
lpall(end+1).dirPath='E:\Data\2016\July\14.7.16_Tbet_Iso\';
lpall(end).fileIndx=16;
lpall(end).cluster=[1];
lpall(end).mouseType = 'TBET';
lpall(end).anest = 'iso';
lpall(end+1).dirPath='E:\Data\2016\July\14.7.16_Tbet_Iso\';
lpall(end).fileIndx=16;
lpall(end).cluster=[2];
lpall(end).mouseType = 'TBET';
lpall(end).anest = 'iso';


% non sister, with different inhibtion
% 17 and 18 are is the same as 19 with more light. all neurons have
% inhibtion (and it is better as we redce the light spot) ! phase is lausy
lpall(end+1).dirPath='E:\Data\2016\July\14.7.16_Tbet_Iso\';
lpall(end).fileIndx=19;
lpall(end).cluster=[1];
lpall(end).mouseType = 'TBET';
lpall(end).anest = 'iso';
lpall(end+1).dirPath='E:\Data\2016\July\14.7.16_Tbet_Iso\';
lpall(end).fileIndx=19;
lpall(end).cluster=[2];
lpall(end).mouseType = 'TBET';
lpall(end).anest = 'iso';
lpall(end+1).dirPath='E:\Data\2016\July\14.7.16_Tbet_Iso\';
lpall(end).fileIndx=19;
lpall(end).cluster=[3];
lpall(end).mouseType = 'TBET';
lpall(end).anest = 'iso';

% one example of inhibiton in awake!!!
lpall(end+1).dirPath='E:\Data\2016\July\14.7.16_Tbet_Iso\';
lpall(end).fileIndx=26;
lpall(end).cluster=[1];
lpall(end).mouseType = 'TBET';
lpall(end).anest = 'awake';


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 20.7.16 Tbet
%-----------------------------------------
% sister MT cells
lpall(end+1).dirPath='E:\Data\2016\July\20.7.16_Tbet_Iso\';
lpall(end).fileIndx=3;
lpall(end).cluster=[1];
lpall(end).mouseType = 'TBET';
lpall(end).anest = 'iso';
lpall(end+1).dirPath='E:\Data\2016\July\20.7.16_Tbet_Iso\';
lpall(end).fileIndx=3;
lpall(end).cluster=[2];
lpall(end).mouseType = 'TBET';
lpall(end).anest = 'iso';

% not a freat cluster but a wake
lpall(end+1).dirPath='E:\Data\2016\July\20.7.16_Tbet_Iso\';
lpall(end).fileIndx=7;
lpall(end).cluster=[1];
lpall(end).mouseType = 'TBET';
lpall(end).anest = 'awake';

%
lpall(end+1).dirPath='E:\Data\2016\July\20.7.16_Tbet_Iso\';
lpall(end).fileIndx=34;
lpall(end).cluster=[1];
lpall(end).mouseType = 'TBET';
lpall(end).anest = 'awake';


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 3.8.16 Tbet
%-----------------------------------------

% inhibiton from all over the bulb
% isi is too small and reps=15 so the inhibiton could be an artificat of
% the post inhibtion after excitation
% lpall(end+1).dirPath='E:\Data\2016\August\3.8.16_Tbet\';
% lpall(end).fileIndx=1;
% lpall(end).cluster=[1];
% lpall(end).mouseType = 'TBET';
% lpall(end).anest = 'iso';
% lpall(end).depth = 220;

% not well clustered
lpall(end+1).dirPath='E:\Data\2016\August\3.8.16_Tbet\';
lpall(end).fileIndx=3;
lpall(end).cluster=[1];
lpall(end).mouseType = 'TBET';
lpall(end).anest = 'iso';
lpall(end).depth = 350;

% non-sister. One have inh and the other dont
lpall(end+1).dirPath='E:\Data\2016\August\3.8.16_Tbet\';
lpall(end).fileIndx=4;
lpall(end).cluster=[1];
lpall(end).mouseType = 'TBET';
lpall(end).anest = 'iso';
lpall(end).depth = 350;
lpall(end+1).dirPath='E:\Data\2016\August\3.8.16_Tbet\';
lpall(end).fileIndx=4;
lpall(end).cluster=[2];
lpall(end).mouseType = 'TBET';
lpall(end).anest = 'iso';
lpall(end).depth = 350;

lpall(end+1).dirPath='E:\Data\2016\August\3.8.16_Tbet\';
lpall(end).fileIndx=5;
lpall(end).cluster=[1];
lpall(end).mouseType = 'TBET';
lpall(end).anest = 'iso';
lpall(end).depth = 350;


% 7x7; 3 and 1 could be sisters. for some unclear reason the exc spots are
% smearged
lpall(end+1).dirPath='E:\Data\2016\August\3.8.16_Tbet\';
lpall(end).fileIndx=6;
lpall(end).cluster=[1];
lpall(end).mouseType = 'TBET';
lpall(end).anest = 'iso';
lpall(end).depth = 390;
lpall(end+1).dirPath='E:\Data\2016\August\3.8.16_Tbet\';
lpall(end).fileIndx=6;
lpall(end).cluster=2;
lpall(end).mouseType = 'TBET';
lpall(end).anest = 'iso';
lpall(end).depth = 390;
lpall(end+1).dirPath='E:\Data\2016\August\3.8.16_Tbet\';
lpall(end).fileIndx=6;
lpall(end).cluster=3;
lpall(end).mouseType = 'TBET';
lpall(end).anest = 'iso';
lpall(end).depth = 390;

% same neuron as 6 but the clusters are lost. this one is 5x5
lpall(end+1).dirPath='E:\Data\2016\August\3.8.16_Tbet\';
lpall(end).fileIndx=7;
lpall(end).cluster=[1];
lpall(end).mouseType = 'TBET';
lpall(end).anest = 'iso';
lpall(end).depth = 390;
