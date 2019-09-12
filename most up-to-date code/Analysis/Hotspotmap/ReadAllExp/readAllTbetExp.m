function lpall = readAllTbetExp(lpall)
% TBET
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% 2011
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Feb 1 Tbet Bulb
%-----------------------------
%  response is all over or no response



% 2011, May 25
%----------------------------------------
% this is a good example of inhibiton, remove the last two columns if you
% want this to particpate in the computations as the hotspot is too big (7
% spots)
% in this mouse all examples have inhibition
% two big resposnses
lpall(end+1).dirPath='g:\Data\2011\May\May 25 TBET bulb';
lpall(end).EXTEND_SPIKE_TIME_CALCULATION=0;
lpall(end).twoBulbs = 0; % we flag it is two bulbs togethe
lpall(end).fileIndx=1;
lpall(end).cluster=1;
lpall(end).mouseType = 'TBET';
lpall(end).sniffDirection=0;
lpall(end).cen=[];
lpall(end).anest='ketamine';
lpall(end).depth=[];
% good example of inhbition and a great neuron
lpall(end+1).dirPath='g:\Data\2011\May\May 25 TBET bulb';
lpall(end).fileIndx=3;
lpall(end).twoBulbs = 0; % we flag it is two bulbs togethelpall(end).cluster=1;
lpall(end).mouseType = 'TBET';
lpall(end).cluster=1;

lpall(end+1).dirPath='F:\Data\2011\May\May 25 TBET bulb';
lpall(end).fileIndx=17;
lpall(end).cluster=1;
lpall(end).mouseType = 'TBET';
% two big hotspot
% lpall(end+1).dirPath='F:\Data\2011\May\May 25 TBET bulb';
% lpall(end).fileIndx=24;
% lpall(end).cluster=1;
% lpall(end).mouseType = 'TBET';


%
lpall(end+1).dirPath='g:\Data\2011\May\May 26 TBET bulb';
lpall(end).fileIndx=3;
lpall(end).cluster=1;
lpall(end).mouseType = 'TBET';



% 2011 june 22
%-------------------
lpall(end+1).dirPath='g:\Data\2011\June\June 22 TBET bulb aPCX';
lpall(end).fileIndx=3;
lpall(end).cluster=1;
lpall(end).mouseType = 'TBET';


%%%%%%%%%%%%%%%%%%%%%%%
%% 2012
%%%%%%%%%%%%%%%%%%%
% no sister
lpall(end+1).dirPath='g:\Data\2012\Jan 2012\Jan 10 2012 TBET bulb';
lpall(end).fileIndx=1;
lpall(end).cluster=1;
lpall(end).mouseType = 'TBET';
lpall(end+1).dirPath='g:\Data\2012\Jan 2012\Jan 10 2012 TBET bulb';
lpall(end).fileIndx=1;
lpall(end).cluster=2;
lpall(end).mouseType = 'TBET';



% May 10 2012 TBET bulb
%--------------------------

% noisy recording

%
% Probably sister MT cells inhibition maps are different
% 17 1 has big hotspot
lpall(end+1).dirPath='F:\Data\2012\May 2012\May 10 2012 TBET bulb';
lpall(end).fileIndx=17;
lpall(end).cluster=2;
lpall(end).mouseType = 'TBET';

% 
lpall(end+1).dirPath='F:\Data\2012\May 2012\May 10 2012 TBET bulb';
lpall(end).fileIndx=19;
lpall(end).cluster=1;
lpall(end).mouseType = 'TBET';
% too big hotspot but there is clear inhibition!
lpall(end+1).dirPath='F:\Data\2012\May 2012\May 10 2012 TBET bulb';
lpall(end).fileIndx=20;
lpall(end).cluster=1;
lpall(end).mouseType = 'TBET';

% maybe sister, one has inhibitin and the other
% does not. 22_2 has phase lock at 0.5 but no inhibition.. the phase lock is not so clear in 22_2
lpall(end+1).dirPath='F:\Data\2012\May 2012\May 10 2012 TBET bulb';
lpall(end).fileIndx=22;
lpall(end).cluster=1;
lpall(end).mouseType = 'TBET';
lpall(end+1).dirPath='F:\Data\2012\May 2012\May 10 2012 TBET bulb';
lpall(end).fileIndx=22;
lpall(end).cluster=2;
lpall(end).mouseType = 'TBET';

% %24_1 and 24_2 two very nice clusters but the map is too small (12 spots)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 2013
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% 3 could be sister as the maps are correlated but the neurons can not be well clustered
% 6 bad cluster
%
% 8 is cruppy signal (and 6 is also not so good)
% 9, 12, 14 is bad signal
%
% 17 - no response

%
lpall(end+1).dirPath='g:\Data\2013\Jan 2013\Jan 2 2013 TBET bulb';
lpall(end).fileIndx=18;
lpall(end).cluster=1;
lpall(end).mouseType = 'TBET';


% two clusters. non-sister r=0.19
lpall(end+1).dirPath='F:\Data\2013\Jan 2013\Jan 2 2013 TBET bulb';
lpall(end).fileIndx=22;
lpall(end).cluster=1;
lpall(end).mouseType = 'TBET';
lpall(end+1).dirPath='F:\Data\2013\Jan 2013\Jan 2 2013 TBET bulb';
lpall(end).fileIndx=22;
lpall(end).cluster=2;
lpall(end).mouseType = 'TBET';

% 24 bad signals



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%                2014
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




% 8 not such a good cluster...
lpall(end+1).dirPath='G:\Data\2014\September\September 23_2014_TBET';
lpall(end).fileIndx=17;
lpall(end).cluster=1;
lpall(end).mouseType = 'TBET';
% same neuron smaller spots.
lpall(end+1).dirPath='G:\Data\2014\September\September 23_2014_TBET';
lpall(end).fileIndx=18;
lpall(end).cluster=1;
lpall(end).mouseType = 'TBET';

% 19-30 lousy signals

lpall(end+1).dirPath='G:\Data\2014\September\September 23_2014_TBET';
lpall(end).fileIndx=31;
lpall(end).cluster=1;
lpall(end).mouseType = 'TBET';
% 32_2 activate a large spot size

% nice neuron cluster. it could be that it is activate form many places
lpall(end+1).dirPath='G:\Data\2014\September\September 23_2014_TBET';
lpall(end).fileIndx=35;
lpall(end).cluster=1;
lpall(end).mouseType = 'TBET';


% November 12 TbetGTRosa
%---------------------------
lpall(end+1).dirPath='g:\Data\2014\November\November 12 TbetGTRosa';
lpall(end).fileIndx=2;
lpall(end).cluster=1;
lpall(end).mouseType = 'TBET';

% 3 is not so good cluster

lpall(end+1).dirPath='E:\Data\2014\November\November 12 TbetGTRosa';
lpall(end).fileIndx=11;
lpall(end).cluster=1;
lpall(end).mouseType = 'TBET';
% 12 is same neuron as 11 with smaller spots
lpall(end+1).dirPath='E:\Data\2014\November\November 12 TbetGTRosa';
lpall(end).fileIndx=12;
lpall(end).cluster=1;
lpall(end).mouseType = 'TBET';



% November 13 TbetGTRosa
%-------------------------------
% the best example of sister mt cells
lpall(end+1).dirPath='G:\Data\2014\November\November 13 TbetGTRosa';
lpall(end).fileIndx=9;
lpall(end).cluster=1;
lpall(end).mouseType = 'TBET';
lpall(end+1).dirPath='G:\Data\2014\November\November 13 TbetGTRosa';
lpall(end).fileIndx=9;
lpall(end).cluster=2;
lpall(end).mouseType = 'TBET';

% November 30 TbetGTRosa
%-------------------------------

lpall(end+1).dirPath='G:\Data\2014\November\November 30 TbetGTRosa';
lpall(end).fileIndx=1;
lpall(end).cluster=1;
lpall(end).mouseType = 'TBET';

% December 15 TbetGTRosa
%--------------------------------------
% sister MT cells. but maybe it is the same neuron and just bad clustering?
lpall(end+1).dirPath='G:\Data\2014\December\December 15 TbetGTRosa';
lpall(end).fileIndx=6;
lpall(end).cluster=1;
lpall(end).mouseType = 'TBET';
lpall(end+1).dirPath='G:\Data\2014\December\December 15 TbetGTRosa';
lpall(end).fileIndx=6;
lpall(end).cluster=2;
lpall(end).mouseType = 'TBET';

% probably the same as neuron 6. again sister MT cells or the same neuron
lpall(end+1).dirPath='G:\Data\2014\December\December 15 TbetGTRosa';
lpall(end).fileIndx=12;
lpall(end).cluster=1;
lpall(end).mouseType = 'TBET';
lpall(end+1).dirPath='G:\Data\2014\December\December 15 TbetGTRosa';
lpall(end).fileIndx=12;
lpall(end).cluster=2;
lpall(end).mouseType = 'TBET';

% new location. not a great cluster for 13_2 and 13 it is the same as 16
% sister MT cells, no overlap in inhibition

% 16_2 is the same neuron as 13 with more tials 
% is not well clustered and this is the same as neuron 13
lpall(end+1).dirPath='G:\Data\2014\December\December 15 TbetGTRosa';
lpall(end).fileIndx=16;
lpall(end).cluster=1;
lpall(end).mouseType = 'TBET';
lpall(end+1).dirPath='G:\Data\2014\December\December 15 TbetGTRosa';
lpall(end).fileIndx=16;
lpall(end).cluster=2;
lpall(end).mouseType = 'TBET';


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%            2015
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% February 19 TbetGTRosa
%--------------------------------
% sister but the two clusters are lousy
lpall(end+1).dirPath='G:\Data\2015\February\February 19 TbetGTRosa\';
lpall(end).fileIndx=6;
lpall(end).cluster=[1 ];
lpall(end).mouseType = 'TBET';
lpall(end+1).dirPath='G:\Data\2015\February\February 19 TbetGTRosa\';
lpall(end).fileIndx=6;
lpall(end).cluster=[2 ];
lpall(end).mouseType = 'TBET';


% a 20x20
lpall(end+1).dirPath='E:\Data\2015\March\March 08 TbetGTRosa\';
lpall(end).fileIndx=35;
lpall(end).cluster=[1];
lpall(end).mouseType = 'TBET';
lpall(end+1).dirPath='E:\Data\2015\March\March 08 TbetGTRosa\';
lpall(end).fileIndx=35;
lpall(end).cluster=[2];
lpall(end).mouseType = 'TBET';


% September 20 2015 TBET-Chr2
% sniff info is back!
%--------------------------------
lpall(end+1).dirPath='G:\Data\2015\September\September 20 2015 TBET-Chr2\';
lpall(end).fileIndx=1;
lpall(end).cluster=[1 ];
lpall(end).mouseType = 'TBET';
lpall(end).twoBulbs = 1; % we flag it as two bulbs together
lpall(end+1).dirPath='G:\Data\2015\September\September 20 2015 TBET-Chr2\';
lpall(end).fileIndx=2;
lpall(end).cluster=[1 ];
lpall(end).mouseType = 'TBET';
lpall(end).twoBulbs = 1; % we flag it is two bulbs together

% 20x20
lpall(end+1).dirPath='E:\Data\2015\October\20102015 tbet chr2 aon and ob\';
lpall(end).fileIndx=23;
lpall(end).cluster=[1 ];
lpall(end).mouseType = 'TBET';


% October 06 2015 TBET-Chr2
%-----------------------------------------
% 1_1 no response and 30x30

% 13102015_tbet_chr2_aon
%------------------------
% 9 - forgot to set the random flag...


% November\11_19_nov_2015_COA
%-----------------------------------------
% 1 has no cluster
% no a good cluster but a nice hotspot
lpall(end+1).dirPath='G:\Data\2015\November\11_19_nov_2015_COA\';
lpall(end).fileIndx=3;
lpall(end).cluster=[1 ];
lpall(end).mouseType = 'TBET';

% November\24_11_2015_COA\
%-----------------------------------------

%20x20, not a great cluster but clear inhibtion from the surround
lpall(end+1).dirPath='G:\Data\2015\November\24_11_2015_COA\';
lpall(end).fileIndx=1;
lpall(end).cluster=[1 ];
lpall(end).mouseType = 'TBET';


% no a good cluster but a nice hotspot
lpall(end+1).dirPath='G:\Data\2015\November\24_11_2015_COA\';
lpall(end).fileIndx=2;
lpall(end).cluster=[1 ];
lpall(end).mouseType = 'TBET';
lpall(end+1).dirPath='G:\Data\2015\November\24_11_2015_COA\';
lpall(end).fileIndx=3;
lpall(end).cluster=[1 ];
lpall(end).mouseType = 'TBET';

% December 1 ENT and COA
%-----------------------
lpall(end+1).dirPath='g:\Data\2015\December\December 1 ENT and COA\';
lpall(end).fileIndx=1;
lpall(end).cluster=[1 ];
lpall(end).mouseType = 'TBET';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%            2016   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 12 and 22 seems to be sister but is more likely an artificat
lpall(end+1).dirPath='G:\Data\2016\Feb\2.2.16 tBet\2016-02-02_14-18-05\';
lpall(end).fileIndx=1;
lpall(end).cluster=[1 2];
lpall(end).mouseType = 'TBET';
lpall(end+1).dirPath='g:\Data\2016\Feb\2.2.16 tBet\2016-02-02_14-18-05\';
lpall(end).fileIndx=1;
lpall(end).cluster=[2 1];
lpall(end).mouseType = 'TBET';
lpall(end+1).dirPath='E:\Data\2016\Feb\2.2.16 tBet\2016-02-02_14-18-05\';
lpall(end).fileIndx=1;
lpall(end).cluster=[2 2];
lpall(end).mouseType = 'TBET';

% 11 the same neuron as 21
lpall(end+1).dirPath='g:\Data\2016\Feb\2.2.16 tBet\2016-02-02_14-45-15\';
lpall(end).fileIndx=1;
lpall(end).cluster=[1 1 1];
lpall(end).mouseType = 'TBET';


% 8.2.16 tBet
%-------------------------------------
% 8.2.16 tBet\2016-02-08_13-58-38
% tt1 is well clustered, tt2 is bad
% i_2 and 1_3 are sister! there is  no overlap. The next run is the same so
% we use the next run as it has more reps
% 8.2.16 tBet\2016-02-08_14-27-45 same as next run


% same as above but with lower light and two tetrodes are active
% 11 and 12 are correlated but do not share excitatory spots
% 21 and 11 are correalted but do not share exictatory spots
% 12 and 21 are correlated and share exictatory spots
lpall(end+1).dirPath='g:\Data\2016\Feb\8.2.16 tBet\2016-02-08_14-49-45\';
lpall(end).fileIndx=1;
lpall(end).cluster=[1 1 1];
lpall(end).mouseType = 'TBET';
lpall(end+1).dirPath='g:\Data\2016\Feb\8.2.16 tBet\2016-02-08_14-49-45\';
lpall(end).fileIndx=1;
lpall(end).cluster=[1 2 1];
lpall(end).mouseType = 'TBET';
% 1_3 is very low response
% 2_2 is the same as 12
lpall(end+1).dirPath='g:\Data\2016\Feb\8.2.16 tBet\2016-02-08_14-49-45\';
lpall(end).fileIndx=1;
lpall(end).cluster=[2 1 1];
lpall(end).mouseType = 'TBET';

% 12 and 13 are sister MT cells with  non-overlaping inhibitory maps
% these neurons are probably the same as previous run
% tt2 comtains 3 neurons that are the same as in tt1
lpall(end+1).dirPath='g:\Data\2016\Feb\8.2.16 tBet\2016-02-08_15-24-17';
lpall(end).fileIndx=1;
lpall(end).cluster=[1 1 1];
lpall(end).mouseType = 'TBET';
lpall(end+1).dirPath='g:\Data\2016\Feb\8.2.16 tBet\2016-02-08_15-24-17';
lpall(end).fileIndx=1;
lpall(end).cluster=[1 2 1];
lpall(end).mouseType = 'TBET';
lpall(end+1).dirPath='g:\Data\2016\Feb\8.2.16 tBet\2016-02-08_15-24-17';
lpall(end).fileIndx=1;
lpall(end).cluster=[1 3 1];
lpall(end).mouseType = 'TBET';


% 1 and 2 are sister
lpall(end+1).dirPath='G:\Data\2016\Feb\8.2.16 tBet\2016-02-08_16-32-00';
lpall(end).fileIndx=1;
lpall(end).cluster=[1 1 1];
lpall(end).mouseType = 'TBET';
lpall(end+1).dirPath='G:\Data\2016\Feb\8.2.16 tBet\2016-02-08_16-32-00';
lpall(end).fileIndx=1;
lpall(end).cluster=[1 2 1];
lpall(end).mouseType = 'TBET';

% tt2 has 2 neurons that are in tt1
lpall(end+1).dirPath='g:\Data\2016\Feb\8.2.16 tBet\2016-02-08_17-31-33';
lpall(end).fileIndx=1;
lpall(end).cluster=[1 1 1];
lpall(end).mouseType = 'TBET';
lpall(end+1).dirPath='g:\Data\2016\Feb\8.2.16 tBet\2016-02-08_17-31-33';
lpall(end).fileIndx=1;
lpall(end).cluster=[1 2 1];
lpall(end).mouseType = 'TBET';
% 1_3 is very weak

% 2016-02-08_19-16-18 is the same as above neurons
% 2016-02-08_19-43-03 is the same as above neurons
% G:\Data\2016\Feb\8.2.16 tBet\2016-02-08_19-43-03  no response


% the CSC31 is missing and the one in the cheetha computer has different
% size..
% lpall(end+1).dirPath='g:\Data\2016\Feb\8.2.16 tBet\2016-02-08_20-27-52';
% lpall(end).fileIndx=1;
% lpall(end).cluster=[1 2 1];
% lpall(end).mouseType = 'TBET';

% only  tt2 is good
% these are sister mt cells although there is no good response
% the inhibitory maps are also similar
% there is no response



% 10.2.16 tBet
%------------------------------------------------------------

% G:\Data\2016\Feb\10.2.16 tBet\2016-02-10_12-09-14
% only one good neuron in tt1, none  in tt2
lpall(end+1).dirPath='G:\Data\2016\Feb\10.2.16 tBet\2016-02-10_12-09-14';
lpall(end).fileIndx=1;
lpall(end).cluster=[1 1 1 ];
lpall(end).mouseType = 'TBET';



% only one neuron
 %(the second neuron is the same)
lpall(end+1).dirPath='G:\Data\2016\Feb\10.2.16 tBet\2016-02-10_12-19-10';
lpall(end).fileIndx=1;
lpall(end).cluster=[1 1 1 ];
lpall(end).mouseType = 'TBET';


% 11 is probably the same as the above 11 (but not sure as there are ~8000
% spikes here versus 6000 in the previous run)
% non sister cells
lpall(end+1).dirPath='G:\Data\2016\Feb\10.2.16 tBet\2016-02-10_13-02-29';
lpall(end).fileIndx=1;
lpall(end).cluster=[1 1 1 ];
lpall(end).mouseType = 'TBET';
lpall(end+1).dirPath='G:\Data\2016\Feb\10.2.16 tBet\2016-02-10_13-02-29';
lpall(end).fileIndx=1;
lpall(end).cluster=[2 1 1];
lpall(end).mouseType = 'TBET';


% 2016-02-10_13-36-45
%---------------------
% only tt2 is good with two responding neurons
lpall(end+1).dirPath='G:\Data\2016\Feb\10.2.16 tBet\2016-02-10_13-36-45';
lpall(end).fileIndx=1;
lpall(end).cluster=[2 1 1];
lpall(end).mouseType = 'TBET';

lpall(end+1).dirPath='G:\Data\2016\Feb\10.2.16 tBet\2016-02-10_13-36-45';
lpall(end).fileIndx=1;
lpall(end).cluster=[2 3 1];
lpall(end).mouseType = 'TBET';

% 2016-02-10_14-03-28
%-------------------------------
% 2_1 is the same as 1_1
% 2_3 has very small number  of  spikes and no response
% 2_2 and 2_4 are weak sisters
% 1_2 is sister to all others... which imply is lousy
lpall(end+1).dirPath='g:\Data\2016\Feb\10.2.16 tBet\2016-02-10_14-03-28';
lpall(end).fileIndx=1;
lpall(end).cluster=[1 1 1];
lpall(end).mouseType = 'TBET';
lpall(end+1).dirPath='g:\Data\2016\Feb\10.2.16 tBet\2016-02-10_14-03-28';
lpall(end).fileIndx=1;
lpall(end).cluster=[1 2 1];
lpall(end).mouseType = 'TBET';
lpall(end+1).dirPath='g:\Data\2016\Feb\10.2.16 tBet\2016-02-10_14-03-28';
lpall(end).fileIndx=1;
lpall(end).cluster=[2 4 1];
lpall(end).mouseType = 'TBET';

% 2016-02-10_14-29-34 both tt1 and tt2 are lousy
% 2016-02-10_15-17-04 and 2016-02-10_15-27-33 nice clusters but no response 

% 22 is the same 11. the intersection is low nut it is because the spike
% times are sub ms different
% you can do the below to see this:
% t=[lp22.t lp11.t];
% t=round(t*1000)/1000;
% length(find(diff(t) < 2/1000))
lpall(end+1).dirPath='G:\Data\2016\Feb\10.2.16 tBet\2016-02-10_16-04-05';
lpall(end).fileIndx=1;
lpall(end).cluster=[1 1  1];
lpall(end).mouseType = 'TBET';


% \2016-02-10_17-11-02, \2016-02-10_18-38-17 2016-02-10_19-22-28 , 2016-02-10_19-43-24  no response


% 15.2.16 tBet
% -----------------------------------------------------------------------------
%  no response  

% March
%-------------------------------------------------------------------

% march 3 2016
% non-sister
lpall(end+1).dirPath='G:\Data\2016\March\3_3_16_tBet\';
lpall(end).fileIndx=3;
lpall(end).cluster=[1];
lpall(end).mouseType = 'TBET';
lpall(end+1).dirPath='G:\Data\2016\March\3_3_16_tBet\';
lpall(end).fileIndx=3;
lpall(end).cluster=[2];
lpall(end).mouseType = 'TBET';

% 4_1 and 4_2 non-sister MT cells
% 4 and 5 are the same neurons but 10x10 and 8x8 spot sizes
% 4 has only 9 reps
% 5_2 has two spots of excitation one from the medial and one from the
% lateral parts!!! this neuron has a pahse of 0.2
% lpall(end+1).dirPath='G:\Data\2016\March\3_3_16_tBet\';
% lpall(end).fileIndx=5;
% lpall(end).cluster=[1];
% lpall(end).mouseType = 'TBET';
% lpall(end+1).dirPath='G:\Data\2016\March\3_3_16_tBet\';
% lpall(end).fileIndx=5;
% lpall(end).cluster=[2];
% lpall(end).mouseType = 'TBET';

% same as 5 with stronger filters
lpall(end+1).dirPath='G:\Data\2016\March\3_3_16_tBet\';
lpall(end).fileIndx=6;
lpall(end).cluster=[1];
lpall(end).mouseType = 'TBET';

lpall(end+1).dirPath='G:\Data\2016\March\3_3_16_tBet\';
lpall(end).fileIndx=6;
lpall(end).cluster=[2];
lpall(end).mouseType = 'TBET';

% 13 is the same as 12 but lower light
% probably non sisters

lpall(end+1).dirPath='G:\Data\2016\March\3_3_16_tBet\';
lpall(end).fileIndx=13;
lpall(end).cluster=[1];
lpall(end).mouseType = 'TBET';
lpall(end+1).dirPath='G:\Data\2016\March\3_3_16_tBet\';
lpall(end).fileIndx=13;
lpall(end).cluster=[2];
lpall(end).mouseType = 'TBET';

lpall(end+1).dirPath='G:\Data\2016\March\3_3_16_tBet\';
lpall(end).fileIndx=16;
lpall(end).cluster=[1];
lpall(end).mouseType = 'TBET';


lpall(end+1).dirPath='G:\Data\2016\March\3_3_16_tBet\';
lpall(end).fileIndx=18;
lpall(end).cluster=[1];
lpall(end).mouseType = 'TBET';


lpall(end+1).dirPath='G:\Data\2016\March\3_3_16_tBet\';
lpall(end).fileIndx=19;
lpall(end).cluster=[1];
lpall(end).mouseType = 'TBET';


% 3 neurons on the same electrodes
lpall(end+1).dirPath='G:\Data\2016\March\3_3_16_tBet\';
lpall(end).fileIndx=20;
lpall(end).cluster=[1];
lpall(end).mouseType = 'TBET';

lpall(end+1).dirPath='G:\Data\2016\March\3_3_16_tBet\';
lpall(end).fileIndx=20;
lpall(end).cluster=[2];
lpall(end).mouseType = 'TBET';
lpall(end+1).dirPath='G:\Data\2016\March\3_3_16_tBet\';
lpall(end).fileIndx=20;
lpall(end).cluster=[3];
lpall(end).mouseType = 'TBET';


% 22 is the same as 21 non sister
lpall(end+1).dirPath='G:\Data\2016\March\3_3_16_tBet\';
lpall(end).fileIndx=22;
lpall(end).cluster=[1];
lpall(end).mouseType = 'TBET';
lpall(end+1).dirPath='G:\Data\2016\March\3_3_16_tBet\';
lpall(end).fileIndx=22;
lpall(end).cluster=[2];
lpall(end).mouseType = 'TBET';



lpall(end+1).dirPath='G:\Data\2016\March\3_3_16_tBet\';
lpall(end).fileIndx=25;
lpall(end).cluster=[1];
lpall(end).mouseType = 'TBET';

lpall(end+1).dirPath='G:\Data\2016\March\3_3_16_tBet\';
lpall(end).fileIndx=27;
lpall(end).cluster=[1];
lpall(end).mouseType = 'TBET';
lpall(end+1).dirPath='G:\Data\2016\March\3_3_16_tBet\';
lpall(end).fileIndx=27;
lpall(end).cluster=[2];
lpall(end).mouseType = 'TBET';


lpall(end+1).dirPath='G:\Data\2016\March\3_3_16_tBet\';
lpall(end).fileIndx=29;
lpall(end).cluster=[1];
lpall(end).mouseType = 'TBET';

% 30 is the same as 29

lpall(end+1).dirPath='G:\Data\2016\March\3_3_16_tBet\';
lpall(end).fileIndx=31;
lpall(end).cluster=[1];
lpall(end).mouseType = 'TBET';
% 32 - np respons

% April
%---------------------------------------------

% April\6_4_16 Tbet
%---------------------------------------------
% 1-5 big hotspot
% 6 non-sister but  only 6 reps

lpall(end+1).dirPath='G:\Data\2016\April\6_4_16 Tbet\';
lpall(end).fileIndx=7;
lpall(end).cluster=[1];
lpall(end).mouseType = 'TBET';
% all other has no responses

% April\17.4.16 tbet
%----------------------------
% the spot size is in the new projector setup which is one pixel=26 um
% non sister (this neuron is the same as 7 with less light)
lpall(end+1).dirPath='G:\Data\2016\April\17.4.16 tbet\';
lpall(end).fileIndx=8;
lpall(end).cluster=[1];
lpall(end).mouseType = 'TBET';
lpall(end+1).dirPath='G:\Data\2016\April\17.4.16 tbet\';
lpall(end).fileIndx=8;
lpall(end).cluster=[2];
lpall(end).mouseType = 'TBET';

% non sister BUT the correlation is negative ????!!!!
% 13 is the same as 15 
lpall(end+1).dirPath='G:\Data\2016\April\17.4.16 tbet\';
lpall(end).fileIndx=15;
lpall(end).cluster=[1];
lpall(end).mouseType = 'TBET';
lpall(end+1).dirPath='G:\Data\2016\April\17.4.16 tbet\';
lpall(end).fileIndx=15;
lpall(end).cluster=[2];
lpall(end).mouseType = 'TBET';


% TBET
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 9.5.16 Tbet
%-----------------------------------------
%May (the spot size is in the new projector setup which is one pixel=20 um)
% 15 is the same as 16 with more light
lpall(end+1).dirPath='G:\Data\2016\May\9.5.16 Tbet\';
lpall(end).fileIndx=16;
lpall(end).cluster=[1];
lpall(end).mouseType = 'TBET';
% 17 is the same neuron with light =80 ms 

lpall(end+1).dirPath='G:\Data\2016\May\9.5.16 Tbet\';
lpall(end).fileIndx=18;
lpall(end).cluster=[1];
lpall(end).mouseType = 'TBET';
% 19, the cluster is not as good in 18

% could be sister r=.24
lpall(end+1).dirPath='G:\Data\2016\May\9.5.16 Tbet\';
lpall(end).fileIndx=20;
lpall(end).cluster=[1];
lpall(end).mouseType = 'TBET';
lpall(end+1).dirPath='G:\Data\2016\May\9.5.16 Tbet\';
lpall(end).fileIndx=20;
lpall(end).cluster=[2];
lpall(end).mouseType = 'TBET';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 11.8.16 Tbet
%-----------------------------------------
lpall(end+1).dirPath='E:\Data\2016\August\11.8.16_Tbet_AONpE\';
lpall(end).fileIndx=3;
lpall(end).cluster=[1];
lpall(end).mouseType = 'TBET';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 24.8.16 Tbet
%-----------------------------------------
lpall(end+1).dirPath='E:\Data\2016\August\24.8.16_Tbet\';
lpall(end).fileIndx=4;
lpall(end).cluster=[1];
lpall(end).mouseType = 'TBET';
lpall(end+1).dirPath='E:\Data\2016\August\24.8.16_Tbet\';
lpall(end).fileIndx=4;
lpall(end).cluster=[2];
lpall(end).mouseType = 'TBET';
lpall(end+1).dirPath='E:\Data\2016\August\24.8.16_Tbet\';
lpall(end).fileIndx=4;
lpall(end).cluster=[3];
lpall(end).mouseType = 'TBET';

lpall(end+1).dirPath='E:\Data\2016\August\24.8.16_Tbet\';
lpall(end).fileIndx=6;
lpall(end).cluster=[1];
lpall(end).mouseType = 'TBET';
lpall(end+1).dirPath='E:\Data\2016\August\24.8.16_Tbet\';
lpall(end).fileIndx=6;
lpall(end).cluster=[2];
lpall(end).mouseType = 'TBET';
lpall(end+1).dirPath='E:\Data\2016\August\24.8.16_Tbet\';
lpall(end).fileIndx=6;
lpall(end).cluster=[3];
lpall(end).mouseType = 'TBET';

lpall(end+1).dirPath='E:\Data\2016\August\24.8.16_Tbet\';
lpall(end).fileIndx=8;
lpall(end).cluster=[1];
lpall(end).mouseType = 'TBET';
lpall(end+1).dirPath='E:\Data\2016\August\24.8.16_Tbet\';
lpall(end).fileIndx=8;
lpall(end).cluster=[2];
lpall(end).mouseType = 'TBET';
lpall(end+1).dirPath='E:\Data\2016\August\24.8.16_Tbet\';
lpall(end).fileIndx=8;
lpall(end).cluster=[3];
lpall(end).mouseType = 'TBET';
lpall(end).fileIndx=8;
lpall(end).cluster=[4];
lpall(end).mouseType = 'TBET';

lpall(end+1).dirPath='E:\Data\2016\August\24.8.16_Tbet\';
lpall(end).fileIndx=12;
lpall(end).cluster=[1];
lpall(end).mouseType = 'TBET';
lpall(end+1).dirPath='E:\Data\2016\August\24.8.16_Tbet\';
lpall(end).fileIndx=12;
lpall(end).cluster=[2];
lpall(end).mouseType = 'TBET';

lpall(end+1).dirPath='E:\Data\2016\August\24.8.16_Tbet\';
lpall(end).fileIndx=14;
lpall(end).cluster=[1];
lpall(end).mouseType = 'TBET';
lpall(end+1).dirPath='E:\Data\2016\August\24.8.16_Tbet\';
lpall(end).fileIndx=14;
lpall(end).cluster=[2];
lpall(end).mouseType = 'TBET';
lpall(end+1).dirPath='E:\Data\2016\August\24.8.16_Tbet\';
lpall(end).fileIndx=14;
lpall(end).cluster=[3];
lpall(end).mouseType = 'TBET';

lpall(end+1).dirPath='E:\Data\2016\August\24.8.16_Tbet\';
lpall(end).fileIndx=16;
lpall(end).cluster=[1];
lpall(end).mouseType = 'TBET';
lpall(end+1).dirPath='E:\Data\2016\August\24.8.16_Tbet\';
lpall(end).fileIndx=16;
lpall(end).cluster=[2];
lpall(end).mouseType = 'TBET';
lpall(end+1).dirPath='E:\Data\2016\August\24.8.16_Tbet\';
lpall(end).fileIndx=16;
lpall(end).cluster=[3];
lpall(end).mouseType = 'TBET';

