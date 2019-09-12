% figure script 1

%%%%%%%%%%%%%%%%%%%5
%%%%% setup
%%%%%%%%%%%%%%%%%%%
%%
AIdirPath='C:\backup\Code\Hotspotmap\Figures';
disk='g';
shuffelingFalg=0;
%%
%load lpall
% or:
% read all lps
lpall=[];
lpall = readAllOmpExp(lpall);
lpall = readAllTbetExp(lpall);
lpallUrethane=[];
lpallUrethane = readAllUrethaneExp(lpallUrethane);

for i=1:size(lpall,2)
    lpall(i).dirPath(1) = disk;
end
for i=1:size(lpallUrethane,2)
    lpallUrethane(i).dirPath(1) = disk;
end

%%
% read all lp's hotspots
for i=1:length(lpall)    
    [exp] = readExpDescFile(lpall(i).dirPath);
    lp = initLightParam(exp, lpall(i).fileIndx, 1); 
    lp = readLpData( lp, [-10 10], [1 1], lpall(i).cluster);
    hotspotMap;
    close
    lpall(i).lp=lp;    
end
% correct some hotspots centers
lp=findLp(lpall, 21,1, 'November 2010\November 4 OMP Bulb');
lp.cen = [5,2];

%%
% read all lp's hotspots
for i=1:length(lpallUrethane)    
    [exp] = readExpDescFile(lpallUrethane(i).dirPath);
    lp = initLightParam(exp, lpallUrethane(i).fileIndx, 1);
    lp = readLpData( lp, [-10 10], [1 1], lpallUrethane(i).cluster);
    hotspotMap;
    close
    lpallUrethane(i).lp=lp;    
end


%%%%%%%%%%%%%%%%%%%%%
%% Figure 1: the model
%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%
%% Figure 2
%%%%%%%%%%%%%%

%%
% example 1

lp=findLp(lpall, 9,1, 'Dec 27 2012 OMP bulb');
%lp=lpall(9).lp;
hotspotmap
hotspotmapPvalue(lp,0.05,1)
hotspotmapPvalue(lp,0.15,1)
bgToLightDirectedGraph(lp, 0.1)
figure;        
evokedFrDist = lp.lightSpikesFRnew - mean(lp.nonLightSpikes_allNew);
hist(evokedFrDist,20);
%%
% example 2
lp=findLp(lpall, 13,1, 'Dec 30 2012 OMP bulb');
%lp=lpall(13).lp;
hotspotmap
hotspotmapPvalue(lp,0.05,1)
hotspotmapPvalue(lp,0.175,1)
bgToLightDirectedGraph(lp, 0.215)
figure; 
evokedFrDist = lp.lightSpikesFRnew - mean(lp.nonLightSpikes_allNew);
hist(evokedFrDist,20);
%%
% count how many spot are exc and inh
% ignore maps with not excitatory or more than 4 excitatory spots
FDR=0;
exInCountTbet = countInExSpots(lpall, 'TBET', 3,FDR);
exInCountOmp = countInExSpots(lpall, 'OMP',3, FDR);
exInCountUrethane = countInExSpots(lpallUrethane, 'OMP',3, FDR);

%%
% number of spots
figure
barwitherr([std(exInCountOmp(:,1:2))./sqrt(size(exInCountOmp,2)) std(exInCountUrethane(:,1:2))./sqrt(size(exInCountTbet,2))], [mean(exInCountOmp(:,1:2)) mean(exInCountTbet(:,1:2))])
box off
title('number of ex and inh spots')
xlabel('OMP (ex & in) -- Tbet (ex & in)')
%%
% percent wise omp
exInCountOmpPer(:,1) =  (exInCountOmp(:,1)'./sum(exInCountOmp(:,1:3)'))';
exInCountOmpPer(:,2) =  (exInCountOmp(:,2)'./sum(exInCountOmp(:,1:3)'))';
exInCountOmpPer(:,3) =  (exInCountOmp(:,3)'./sum(exInCountOmp(:,1:3)'))';
% percent wise tbet
exInCountTbetPer=[];
exInCountTbetPer(:,1) =  (exInCountTbet(:,1)'./sum(exInCountTbet(:,1:3)'))';
exInCountTbetPer(:,2) =  (exInCountTbet(:,2)'./sum(exInCountTbet(:,1:3)'))';
exInCountTbetPer(:,3) =  (exInCountTbet(:,3)'./sum(exInCountTbet(:,1:3)'))';

figure
barwitherr([std(exInCountOmpPer(:,1:2))./sqrt(size(exInCountOmpPer,2)) std(exInCountTbetPer(:,1:2))./sqrt(size(exInCountTbetPer,2))],...
    [mean(exInCountOmpPer(:,1:2)) mean(exInCountTbetPer(:,1:2))])
box off;
title('% of ex & in for omp and tbet')
%% distribution of % of spots that evoked negative fr (are probably inhibitory)

figure
[a,b]=hist(exInCountOmp(:,end)-0.5,5);
box off;
plot(b,a,'b')

hold on
[a,b]=hist(exInCountTbet(:,end)-0.5,5);
plot(b,a,'r')


[a,b]=hist(exInCountUrethane(:,end)-0.5,5);
plot(b,a,'g')
title('distribution of % of evoked fr < 0')
%%
AIdirName = 'Figure 2\';
saveAIfigure(AIdirPath, AIdirName, 'ex in spot count TBET percent', [], [0:0.05:100])
%%
AIdirName = 'Figure 2\';
saveAIfigure(AIdirPath, AIdirName, 'reduction percent', [0:0.2:0.6], [0:3:100])
%%
% ROC of number of spots
MAX_SPOT=3;
MOUSE_TYPE='OMP';

res=[];
for FDR = 0:5
    FDR
    exInCountOmp = countInExSpots(lpall(), MOUSE_TYPE, MAX_SPOT, FDR);
    res(end+1,:) = [mean(exInCountOmp) std(exInCountOmp) size(exInCountOmp,1)]
end

figure; 
plot((res(:,1)-res(1,1))./sum(res(1,1:3)')*100, res(:,2)./sum(res(1,1:3)'),'-ok', 'MARKERSIZE', 20)
hold on;
plot((res(:,1)-res(1,1))./sum(res(1,1:3)')*100, (res(:,2)/res(1,1))./sum(res(1,1:3)'),'-ob', 'MARKERSIZE', 20)
plot([5 5], [0 40], ':k')
box off 
axis([-1 20 0 0.5])
legend('raw', 'Normalized')
%%
AIdirName = 'Figure 2\';
saveAIfigure(AIdirPath, AIdirName, 'roc', [0:5:100], [0:0.1:100])

%%
% in how many exp the background is higher than light stimulation?
% omp
[pOmp, valsOmp] = balance_E_I_withAllGlo(lpall, 'OMP');
negMeanOmp = length(find(valsOmp< 0))/length(valsOmp)
opmRatio=length(find(pOmp(:,1) < 0.05))/size(pOmp,1)
% tbet
[pTbet, valsTBET] = balance_E_I_withAllGlo(lpall, 'TBET');
negMeanTbet = length(find(valsTBET< 0))/length(valsTBET)
tbetRatio =length(find(pTbet(:,1) < 0.05))/size(pTbet,1)
% urethane
[pUrethane, valsUrethane] = balance_E_I_withAllGlo(lpallUrethane, 'OMP');
negMeanUrethane = length(find(valsUrethane< 0))/length(valsUrethane)
urethaneRatio =length(find(pUrethane(:,1) < 0.05))/size(pUrethane,1)

%%
% compare fr reduction from lower upper spots 
[p, valsUpper] = balance_E_I_withAllGlo(lpall, 'OMP', 'upper');
[p, valsLower] = balance_E_I_withAllGlo(lpall, 'OMP', 'lower');
[h,p] = ttest2(valsLower, valsUpper)  %signrank(x)
[h,p] = signrank(valsLower, valsUpper)  %signrank(x)


%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Figure 3: distance
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%
% two example of the relation between distance and inhibition
%%
% example 1
rnge=10:15:150;
minStimuliSize=15;
lp=findLp(lpall, 9,1, 'Dec 27 2012 OMP bulb');
[percentOfReduction]=hotspotCircles(lp, rnge, minStimuliSize,1);

    %%
AIdirName = 'Figure 2\';
saveAIfigure(AIdirPath, AIdirName, 'inhibition per distance exm 1', [100:100:1200], [0:5:100])

%%
% example 2
range=10:15:150;
minStimuliSize=15;
lp=findLp(lpall, 13,1, 'Dec 30 2012 OMP bulb');
[percentOfReduction , removeSpots, sAll, qAll, tAll, dAll]=hotspotCircles(lp, range,minStimuliSize,1);


%%
% response vs distance of all m/t cells
range=10:15:150;   % use range=0:5:150; for 14x14 spots and 10:15:150 for 15x15
MAX_HOTSPOT=3;
mouseType='OMP';
minStimuliSize=15;
percentOfReductionAll=[];
percentOfReductionAll= hotspotCirclesAll(lpall, mouseType, range, minStimuliSize, MAX_HOTSPOT);

%%
% plot
GRAIN=range(2)-range(1);
allVal=zeros(1:length(percentOfReductionAll),20);   % vector of 15 zeros should be large enough
allCount = allVal; % how many trials we have in each distance
allPercent = nan*ones(size(percentOfReductionAll,2),20);   % vector of 15 zeros should be large enough

for i=1:length(percentOfReductionAll)
    if isempty(percentOfReductionAll(i).percentOfReduction)
        continue;
    end
    indx=(percentOfReductionAll(i).rng-percentOfReductionAll(i).rng(1))/GRAIN+1;
    allVal(i, indx) = percentOfReductionAll(i).percentOfReduction;    
    allPercent(i, indx) = percentOfReductionAll(i).ratePerLayer(1:length(indx),1)./percentOfReductionAll(i).ratePerLayer(1:length(indx),2);    
    allCount(indx) = allCount(indx) + 1;   
end

x=[]
for i=1:size(allVal,2)
    posIndx = find(allVal(:,i) > 0);
    if length(1:posIndx) == 0
        x(end+1,:) = [nan nan];        
    end
    
    if length(posIndx) == 1
        x(end+1,:) = [(allVal(posIndx,i)) 0]
    end
    if length(posIndx) > 1
        x(end+1,:) = [mean(allVal(posIndx,i)) std(allVal(posIndx,i))./sqrt(length(posIndx))]
    end
end
   
% percent of spots that are inhibitory in each layer
y=[];
for i=1:size(allPercent,2)
    posIndx = find(~isnan(allPercent(:,i))==1);
    if length(posIndx) == 0
        y(end+1,:) = [nan nan];        
    end
    
    if length(posIndx) == 1
        y(end+1,:) = [(allPercent(posIndx,i)) 0]
    end
    if length(posIndx) > 1
        y(end+1,:) = [mean(allPercent(posIndx,i)) std(allPercent(posIndx,i))./sqrt(length(posIndx))]
    end
end


figure
errorbar([1:length(x)]*GRAIN*10, x(:,1), x(:,2))
hold on;
box off;
plot([1 1200], [1 1],':k')
axis([-0.5 1400 0.6 1.32])
title('inhbition strength')

figure;
errorbar([1:length(y)]*GRAIN*10, y(:,1), y(:,2))
title('inhbition frequency')
axis([-0.5 1400 -0.1 0.3])
box off


% how inhibitory are glomeruli that are far?
[h,p]=ttest2(allVal(find(allVal(:,1) > 0),1), allVal(find(allVal(:,5) > 0),5))
[h,p]=ttest2(allVal(find(allVal(:,1) > 0),1), allVal(find(allVal(:,4) > 0),4))
% mean reduction
x(isnan(x(:,1)),:) = [];
meanReduction = mean(x(:,1))

%%
AIdirName = 'Figure 3\';
saveAIfigure(AIdirPath, AIdirName, 'inhibition per distance OMP frequency', [150:300:1400], [0:0.1:1])
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% figure 4: tbet
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%
% example 1
lp=findLp(lpall, 6,1, 'Jan 2 2013 TBET bulb');
%lp=lpall(9).lp;
hotspotmap
hotspotmapPvalue(lp,0.05,1)
%%
AIdirName = 'Figure 4\';
saveAIfigure(AIdirPath, AIdirName, 'example 1', [], [0:20:100])
%%
% compare strength of activation
MAX_HOTSPOT=4;
resTbet = hotspotFr(lpall, 4, 'tbet');
resOmp = hotspotFr(lpall, 4, 'omp');
figure; boxplot([resOmp resTbet], [ones(1,length(resOmp)) 2*ones(1,length(resTbet))])
%%
% balance point analysis
MAX_HOTSPOT=4;
balanceLocOMP = balance_E_I(lpall, MAX_HOTSPOT, 'OMP');
balanceLocTBET = balance_E_I(lpall, MAX_HOTSPOT, 'TBET');

%%
figure
balanceLocOMP=balanceLocOMP(:,1);
balanceLocTBET=balanceLocTBET(:,1);
balanceLocTBET(isnan(balanceLocTBET))=[];
balanceLocOMP(isnan(balanceLocOMP))=[];

boxplot([balanceLocOMP' balanceLocTBET'], [ones(1, length(balanceLocOMP)) 2*ones(1, length(balanceLocTBET))])
box off
[h,p]=ttest2(balanceLocTBET,balanceLocOMP)
title(num2str(p))
[p,h]=ranksum(balanceLocTBET,balanceLocOMP)
%%
AIdirName = 'Figure 4\';
saveAIfigure(AIdirPath, AIdirName, 'balance point dist both box', [], [0:20:100])

%%
% an example of inhibitory tbet neuron

dirPath='F:\Data\2013\Jan 2013\Jan 2 2013 TBET bulb\'
fileIndx=25; cluster=1;
[exp] = readExpDescFile(dirPath);
lp = initLightParam(exp, fileIndx, 1); lp = readLpData( lp, [-10 10], [1 1],cluster);
tpa = plotTemporalSignals(lp, lp.deltaTrange, [ -200 350 50], 1:4, 'psth', [1 2 3 4]);
plotTpaPane(tpa, 4, 1)
axis([-0.2  0.55 0 40])
%%
AIdirName = 'Figure 4\';
saveAIfigure(AIdirPath, AIdirName, 'inh example 1', [-0.2:0.1:0.4], [0:10:40])
%%
% inhibiton strength
pTh=0.05;
[inhStrengthOmp] = inh_strength(lpall, 'OMP',10, pTh);
[inhStrengthTbet] = inh_strength(lpall, 'TBET',10, pTh);

figure
boxplot([inhStrengthOmp inhStrengthTbet], [ones(1,length(inhStrengthOmp)) 2*ones(1,length(inhStrengthTbet))])
[h,p]=ttest2(inhStrengthOmp, inhStrengthTbet);
[p,h]=ranksum(inhStrengthOmp, inhStrengthTbet);
title(num2str(p))

box off

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Figure 6: simulation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
% simulation
% the connection map is only for 50x50 ~1 mm
lp=findLp(lpall, 3,1, 'Dec 27 2012 OMP bulb');
clear exp
%lp=lpall(8).lp;
evokedFrDist = lp.lightSpikesFRnew - mean(lp.nonLightSpikes_allNew);




%%  baseline simulation: no odors
param = initParam(evokedFrDist);

param.numOfInhSpots=0;
[connMat, actualConnRatio] = buildConnMat(lp, param);

param.percentExc = 0.0;
phistory=[];
[frOdorBase, neuronStatTrials, neuronIbase, phistory] = simulateTrials(lp, param, connMat, phistory,0);
[frOdor, neuronStatTrials, neuronI, phistory] = simulateTrials(lp, param, connMat, phistory,0);
[pall, ratio] = simInhExcRatio(param, neuronIbase,neuronI )

plotBreakdown(param, pall, frOdor)

box off;
title(['no odors: inh=' num2str(length(find(pall(:,1) < param.pTh))) ' - exh=' num2str(length(find(pall(:,2) < param.pTh))) ' ratio=' num2str(ratio)])

%%
% with inhibition
figure
param = initParam(evokedFrDist);    

%param.numOfInhSpots=0;
[connMat, actualConnRatio] = buildConnMat(lp, param);

phistory=[];
param.percentExc = 0;
[frOdor, neuronStatTrials, neuronI, phistory] = simulateTrials(lp, param, connMat, phistory, 0);

param.percentExc = 0.1;
[frOdor, neuronStatTrialsOdor, neuronIOdor, phistory] = simulateTrials(lp, param, connMat, phistory, 0);
[pall, ratio] = simInhExcRatio(param, neuronI, neuronIOdor)

%plotBreakdown(param, pall, frOd    or)
hold on
plot((1:size(frOdor,2))*(param.TimeSteps*2*param.sniffNum/size(frOdor,2))-param.TimeSteps*param.sniffNum, mean(frOdor), 'k', 'LINEWIDTH', 4)
plot((1:size(frOdor,2))*(param.TimeSteps*2*param.sniffNum/size(frOdor,2))-param.TimeSteps*param.sniffNum, std(frOdor), ':r', 'LINEWIDTH', 4)
plot((1:size(frOdor,2))*(param.TimeSteps*2*param.sniffNum/size(frOdor,2))-param.TimeSteps*param.sniffNum, std(frOdor)./mean(frOdor), 'k', 'LINEWIDTH', 1)
box off;
title(['% door=' num2str(param.percentExc) ' inh = ' num2str(length(find(pall(:,1) < param.pTh))) ' - exh=' num2str(length(find(pall(:,2) < param.pTh))) ' ratio=' num2str(ratio)])
%%
AIdirName = 'Figure 6\';
axis([-450 450 5 30])
saveAIfigure(AIdirPath, AIdirName, 'mean and std with inhbition', [-400:200:400], [0:10:45])

%%
% without inhibiton
figure;
param = initParam(evokedFrDist);    

param.numOfInhSpots=0;
[connMat, actualConnRatio] = buildConnMat(lp, param);

phistory=[];
param.percentExc = 0;
[frOdor, neuronStatTrials, neuronI, phistory] = simulateTrials(lp, param, connMat, phistory, 0);

param.percentExc = 0.1;
[frOdor, neuronStatTrialsOdor, neuronIOdor, phistory] = simulateTrials(lp, param, connMat, phistory, 0);
[pall, ratio] = simInhExcRatio(param, neuronI, neuronIOdor)

%plotBreakdown(param, pall, frOdor)
hold on
plot((1:size(frOdor,2))*(param.TimeSteps*2*param.sniffNum/size(frOdor,2))-param.TimeSteps*param.sniffNum, mean(frOdor), 'b', 'LINEWIDTH', 4)
plot((1:size(frOdor,2))*(param.TimeSteps*2*param.sniffNum/size(frOdor,2))-param.TimeSteps*param.sniffNum, std(frOdor), ':r', 'LINEWIDTH', 4)
plot((1:size(frOdor,2))*(param.TimeSteps*2*param.sniffNum/size(frOdor,2))-param.TimeSteps*param.sniffNum, std(frOdor)./mean(frOdor), 'b', 'LINEWIDTH', 1)


%%
AIdirName = 'Figure 6\';
axis([-450 450 5 30])
saveAIfigure(AIdirPath, AIdirName, 'mean and std without inhbition', [-400:200:400], [0:10:100])
%%
[t, fr] = obPlotOdor(oc2, 2, 1:52, 0.02,'mean');
AIdirName = 'Figure 6\';
axis([-1. 1. 5 25])
saveAIfigure(AIdirPath, AIdirName, 'odor 2 example', [-1:0.5:1], [0:10:100])
%%
[t, fr] = obPlotOdor(oc2, 7, 1:52, 0.02,'mean');
AIdirName = 'Figure 6\';
axis([-1. 1. 5 25])
saveAIfigure(AIdirPath, AIdirName, 'odor 7 example', [-1:0.5:1], [0:10:100])
%%
[t, fr] = obPlotOdor(oc2, 6, 1:52, 0.02,'mean');
AIdirName = 'Figure 6\';
axis([-1. 1. 5 25])
saveAIfigure(AIdirPath, AIdirName, 'odor 6 example', [-1:0.5:1], [0:10:100])

%% spontanous fr distribution
sponFr=[];
for i=1:size(neuronI,1)
    nr = squeeze(neuronI(i,:,:));
    sponFr(end+1) = sum(sum(nr))/(size(nr,1))*5;
end
figure
hist(sponFr,20)
box off
%%
AIdirName = 'Figure 6\';
saveAIfigure(AIdirPath, AIdirName, 'fr dist', [0:10:300], [0:10:100])
%%
AIdirName = 'Figure 6\';
saveAIfigure(AIdirPath, AIdirName, 'example of all neurons', [-100:50:100], [0:30:100])
%%
% an example of exc, in, neutral
%-----------------------------------------
%
param = initParam(evokedFrDist);
param.numOfInhSpots=0;
[connMat, actualConnRatio] = buildConnMat(lp, param);

% without odor stimulation
param.percentExc = 0.0;

phistory=[];
[fr, neuronStatTrials, neuronI, phistory] = simulateTrials(lp, param, connMat, phistory);
[pall, ratio] = simInhExcRatio(param, neuronI, neuronIOdor)
box off;
title(['inh=' num2str(length(find(pall(:,1) < 0.05))) ' - exh=' num2str(length(find(pall(:,2) < 0.05))) ' ratio=' num2str(ratio)])

% with odor stimulation
phistory(:,2) = 0;

param.percentExc = 0.08;
[frOdor, neuronStatTrialsOdor, neuronIOdor, phistory] = simulateTrials(lp, param, connMat, phistory);
[pall, ratio] = simInhExcRatio(param, neuronI, neuronIOdor)

plotBreakdown(param, pall, frOdor)

%%
AIdirName = 'Figure 6\';
saveAIfigure(AIdirPath, AIdirName, 'all neuron example_05percent', [-100:50:200], [0:20:100])


%%  ratio as a function of number of exc neurons

res=[];
rang=5:5:60;
for excNeuronPerc = rang

    [connMat, actualConnRatio] = buildConnMat(lp, param);

    % bg activity
    param.percentExc = 0.0;
    phistory=[];
    [fr, neuronStatTrials, neuronI, phistory] = simulateTrials(lp, param, connMat, phistory);
    close;
    
    % odor response
    param.percentExc = excNeuronPerc/100;
    
    [frOdor, neuronStatTrialsOdor, neuronIOdor, phistory] = simulateTrials(lp, param, connMat, phistory);
    
    [pall, ratio] = simInhExcRatio(param, neuronI, neuronIOdor);
    
    title(['inh=' num2str(length(find(pall(:,1) < 0.05))) ' - exh=' num2str(length(find(pall(:,2) < 0.05))) ' ratio=' num2str(ratio)])
    inhIndx=length(find(pall(:,1) < 0.05));
    excIndx=length(find(pall(:,2) < 0.05));
    res(end+1,:) = [inhIndx excIndx];
    box off;
end
% plot

figure;
plot(rang, res(:,1)/param.GLO_NUM,'r') ; % inh
hold on;
plot(rang, res(:,2)/param.GLO_NUM,'b')  % exc
box off
legend('inh', 'exc')
%%
AIdirName = 'Figure 6\';
saveAIfigure(AIdirPath, AIdirName, 'inh as a function of exc', [0:20:300], [0:0.2:1])

%% ratio versus num of inh glos
ratioall=[];


gloRange=0:25:param.GLO_NUM;
ct=0;
for inhGloNum = gloRange
    ct=ct+1;
    for trialIndx=1:10
        param.numOfInhSpots = 0:inhGloNum;  % num of inhibitory spots
        [connMat, actualConnRatio] = buildConnMat(lp, param);

        % build spontanous response
        phistory=[];
        param.percentExc = 0.0;
        [fr, neuronStatTrials, neuronI, phistory] = simulateTrials(lp, param, connMat, phistory);
        close;
        
        % build odor evoked response
        phistory(:,2) = 0;
        param.percentExc = 0.1;    
        [frOdor, neuronStatTrialsOdor, neuronIOdor, phistory] = simulateTrials(lp, param, connMat, phistory);
        [pall, ratio] = simInhExcRatio(param, neuronI, neuronIOdor)

        % calc inh/exh ratio
        [pall, ratio] = simInhExcRatio(param, neuronI, neuronIOdor)
        ratioall(ct,trialIndx) = ratio;
        close
    end
end
figure;
errorbar(gloRange,mean(ratioall'),std(ratioall')./sqrt(size(ratioall,2)));
box off

%%
AIdirName = 'Figure 6\';
saveAIfigure(AIdirPath, AIdirName, 'ratio vs num of inh glo', [0:25:300], [0:0.5:100])
%%
% two example with and without odor
odorIndx = find(phistory(:,2) >1);
nr=simPlotRaster(neuronStatTrials, odorIndx(1));  
nr=simPlotRaster(neuronStatTrialsOdor, odorIndx(1));
%%
AIdirName = 'Figure 6\';
saveAIfigure(AIdirPath, AIdirName, 'raster without odor', [-0,1:0.1:0.2], [0:10:100])
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%  Figure 7: odor response
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
load ('C:\backup\Code\kevin\oc')

%%
% plot the breathing info 
odorId=1;
[brAllAfterSniffs, brAllBeforeSniffs, inhaleTimes , exhaleTimes] =  obBrStat(oc2, odorId,1);    
%%
AIdirName = 'Figure 7\';
saveAIfigure(AIdirPath, AIdirName, 'breath info', [-30:10:30], [0:0.05:100])

%%
% plot the total neuron response
odorId=1;
[ t, fr, evoked]= obBreakFr(oc2, odorId, 'active_mean', 'blank');
axis([-2 2.5 5 35])
%%
AIdirName = 'Figure 7\';
saveAIfigure(AIdirPath, AIdirName, 'odor 1 break', [-3:0.5:3], [0:5:100])
%%
% how many neurons were excitatory and inhibitory per odor
extInCount=[];
for odorId = 1:6
    [ t, fr, evoked]= obBreakFr(oc2, odorId, 'active_mean', 'blank');
    extInCount(odorId,:) = [size(evoked.evoked_pos,2) size(evoked.evoked_neg,2) size(evoked.evoked_neutral,2)];
end
%%
Inh2ExcRatio = extInCount(:,2)./extInCount(:,1)
median(Inh2ExcRatio)

%%
figure
bar(extInCount(:,1:2)./[(sum(extInCount(:,1:3)')') (sum(extInCount(:,1:3)')')])
box off
%%
AIdirName = 'Figure 7\';
saveAIfigure(AIdirPath, AIdirName, 'inh2exc ratio', [], [0:0.05:100])


