function lpall = readAllContraBulbExp(lpall)
% OMPT
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% clear inhibiton from contra. cells form a band from anterior to posterior
% no clear excitation
lpall(end+1).dirPath='g:\Data\2014\June\June_23_2014';
lpall(end).fileIndx=19;
lpall(end).cluster=1;
lpall(end).mouseType = 'OMP';

% two bulbs together
% strong overall inhibitioon. Excitation is clear from the contra but not
% exactly symetric
lpall(end+1).dirPath='G:\Data\2015\September\September 17 2015 OMP\';
lpall(end).fileIndx=3;
lpall(end).cluster=[1 ];
lpall(end).twoBulbs = 1; % we flag it is two bulbs together
lpall(end).mouseType = 'OMP';

lpall(end+1).dirPath='G:\Data\2015\September\September 17 2015 OMP\';
lpall(end).fileIndx=4;
lpall(end).cluster=[1 ];
lpall(end).twoBulbs = 1; % we flag it is two bulbs together
lpall(end).mouseType = 'OMP';

lpall(end+1).dirPath='G:\Data\2015\September\September 17 2015 OMP\';
lpall(end).fileIndx=4;
lpall(end).cluster=[2 ];
lpall(end).twoBulbs = 1; % we flag it is two bulbs together
lpall(end).mouseType = 'OMP';

lpall(end+1).dirPath='G:\Data\2015\September\September 17 2015 OMP\';
lpall(end).fileIndx=5;
lpall(end).cluster=[1 ];
lpall(end).twoBulbs = 1; % we flag it is two bulbs together
lpall(end).mouseType = 'OMP';
lpall(end+1).dirPath='G:\Data\2015\September\September 17 2015 OMP\';
lpall(end).fileIndx=5;
lpall(end).cluster=[2];
lpall(end).mouseType = 'OMP';
lpall(end).twoBulbs = 1; % we flag it is two bulbs together

% 8_2 has a clear excitation. use lp.DELAY_SPIKE_CALCULATION=0.095;
lpall(end+1).dirPath='G:\Data\2015\September\September 17 2015 OMP\';
lpall(end).fileIndx=8;
lpall(end).cluster=[1 ];
lpall(end).mouseType = 'OMP';
lpall(end).twoBulbs = 1; % we flag it is two bulbs together
lpall(end+1).dirPath='G:\Data\2015\September\September 17 2015 OMP\';
lpall(end).fileIndx=8;
lpall(end).cluster=[2];
lpall(end).mouseType = 'OMP';
lpall(end).twoBulbs = 1; % we flag it is two bulbs together
lpall(end+1).dirPath='G:\Data\2015\September\September 17 2015 OMP\';
lpall(end).fileIndx=8;
lpall(end).cluster=[3];
lpall(end).mouseType = 'OMP';
lpall(end).twoBulbs = 1; % we flag it is two bulbs together

% TBET
lpall(end+1).dirPath='e:\Data\2015\November\11_19_nov_2015_COA';
lpall(end).fileIndx=2;
lpall(end).cluster=1;
lpall(end).mouseType = 'TBET';
lpall(end).twoBulbs = 1; % we flag it is two bulbs together
lpall(end+1).dirPath='G:\Data\2015\November\11_19_nov_2015_COA';
lpall(end).fileIndx=4;
lpall(end).cluster=1;
lpall(end).mouseType = 'TBET';
lpall(end).twoBulbs = 1; % we flag it is two bulbs together


% agood example of cross bulb inhibition
lpall(end+1).dirPath='G:\Data\2015\September\September 20 2015 TBET-Chr2\';
lpall(end).fileIndx=1;
lpall(end).cluster=[1 ];
lpall(end).mouseType = 'TBET';
lpall(end).twoBulbs = 1; % we flag it is two bulbs together
lpall(end+1).dirPath='G:\Data\2015\September\September 20 2015 TBET-Chr2\';
lpall(end).fileIndx=2;
lpall(end).cluster=[1 ];
lpall(end).mouseType = 'TBET';
lpall(end).twoBulbs = 1; % we flag it is two bulbs together


