function phaseStat = nullInhExcPhases(lp, spotType, numOfIndx)
% computete the phase versus friing rate graph for null , exc or inh spots

if nargin < 3
    numOfIndx = 0;  % all index
end
%%

pVal = lp.pVal;
% if length(find(pVal==2)) < 2 | length(find(pVal==1)) < 2
%     disp('not enough inh and exc spots')
%     return;
% end
pValValues = lp.pValValues;

switch (spotType)
    case {'null'}
        [Indx1 Indx2] = find(pValValues > 0.25 & pValValues < 0.75);
        if length(Indx1) < 1
            [Indx1 Indx2] = find(pValValues > 0.1 & pValValues < 0.9);
        end
    case {'inh'}
        [Indx1 Indx2] = find(pVal == 2);
    case {'exc'}
        [Indx1 Indx2] = find(pVal == 1);
    case {'nullHalf1'}
        [Indx1 Indx2] = find(pValValues > 0.25 & pValValues < 0.75);
        if length(Indx1) < 1
            [Indx1 Indx2] = find(pValValues > 0.2 & pValValues < 0.8);
        end 
        
        % take the fist half of the indcies
        Indx1=Indx1(1:round(length(Indx1)/2));
        Indx2=Indx2(1:round(length(Indx2)/2));
    case {'nullHalf2'}
        [Indx1 Indx2] = find(pValValues > 0.25 & pValValues < 0.75);
        if length(Indx1) < 1
            [Indx1 Indx2] = find(pValValues > 0.2 & pValValues < 0.8);
        end 
        
        % take the second half of the indcies
        Indx1=Indx1(round(length(Indx1)/2)+1:length(Indx1));
        Indx2=Indx2(round(length(Indx2)/2)+1:length(Indx2));
    case {'bootstrap'}
        [Indx1 Indx2] = find(pValValues > 0.25 & pValValues < 0.75);
        if length(Indx1) < 1
            [Indx1 Indx2] = find(pValValues > 0.1 & pValValues < 0.9);
        end 
        
        % take a random set
        p=randi(length(Indx1),1,length(Indx1));
        Indx1=Indx1(p);
        Indx2=Indx2(p);
        
        
    otherwise
        error('no such switch')
end

if numOfIndx > 0 & length(Indx1) > numOfIndx
    Indx1=Indx1(numOfIndx);
    Indx2=Indx2(numOfIndx);
end
lightEventsIDList = [Indx1, Indx2];
if size(lightEventsIDList,1) > 10
    lightEventsIDList = lightEventsIDList(1:10,:);
end

if length(lightEventsIDList) < 1
    phaseStat=[];
else
    [lp, lightEvokedSpikesCount, lightEvokedSpikesTimes, phaseStat] = phaseLightLockFR(lp,1, [lightEventsIDList]);
end
%









% % null
% [nullIndx1 nullIndx2] = find(pValValues > 0.25 & pValValues < 0.75);
% lightEventsIDList = [nullIndx1, nullIndx2];
% [lp, lightEvokedSpikesCount, lightEvokedSpikesTimes, phaseStat] = phaseLightLockFR(lp,1, lightEventsIDList,1);
% close
% title('Null')
% nullPhaseStat = lp.PhaseStat;
% 
% % exc
% [excIndx1 excIndx2] = find(pVal==1);
% lightEventsIDList = [excIndx1, excIndx2];
% [lp, lightEvokedSpikesCount, lightEvokedSpikesTimes, phaseStat] = phaseLightLockFR(lp,1, lightEventsIDList,1);
% close
% title('Exc')
% excPhaseStat = lp.PhaseStat;
% 
% [inhIndx1 inhIndx2] = find(pVal==2);
% lightEventsIDList = [inhIndx1, inhIndx2];
% 
% [lp, lightEvokedSpikesCount, lightEvokedSpikesTimes, phaseStat] = phaseLightLockFR(lp,1, lightEventsIDList,1);
% close
% title('Inh')
% inhPhaseStat = lp.PhaseStat;
% 
% lightSpikeCountExc = excPhaseStat.R;
% lightSpikeCountInh = inhPhaseStat.R;
% lightSpikeCountNull = nullPhaseStat.R;
% 
% ip = min(length(lightSpikeCountExc), min(length(lightSpikeCountNull), length(lightSpikeCountInh)));
% 
% nullIp = decimate(lightSpikeCountNull,round(length(lightSpikeCountNull)/(ip)));
% inhIp = decimate(lightSpikeCountInh,round(length(lightSpikeCountInh)/(ip)));
% excIp = decimate(lightSpikeCountExc,round(length(lightSpikeCountExc)/(ip)));
% 
% excIp=interp1(1:length(excIp),excIp,1:ip);
% 
% nullIp=smooth(nullIp,10);
% inhIp=smooth(inhIp,10);
% excIp=smooth(excIp,10);
% 
% if plotFlag
%     figure;
%     plot(nullIp, 'LINEWIDTH', 2); 
%     hold all; 
%     plot(inhIp, 'LINEWIDTH', 2); 
%     plot(excIp, 'LINEWIDTH', 2)
%     legend('Null', 'Inh', 'Exc')
%     
%     % plot the diffs
% %     plot(nullIp - inhIp,'-.g')
% %     plot(excIp - nullIp,'-.r')
% end
% 
% 
% % compute phase shifts
% disp('null, inh and exc phases')
% [nullPhaseStat.psthPhase inhPhaseStat.psthPhase excPhaseStat.psthPhase]
% 
% disp('diff null- inh and null-exc phases')
% [nullPhaseStat.psthPhase-inhPhaseStat.psthPhase nullPhaseStat.psthPhase-excPhaseStat.psthPhase]*360
