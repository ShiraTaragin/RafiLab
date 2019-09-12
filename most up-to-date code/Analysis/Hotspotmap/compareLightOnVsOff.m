function [lp pvals P2 m1 m2] = compareLightOnVsOff(lp, permutationTest)
% compute the P value between the fr before and after the light
% 
% Pvals the P value computed with either ttest or man-U paired or unpaired
% P2 is the 0,1,2 for no response, excitation and inhibition respectivly
P1=[]; m1=[]; m2=[];
pTH=lp.pTh;

if strcmp(lp.scriptType,'SEQUENCE CENTER BULB SCANNING') == 1
    lp.allSpots = 'centerspot';
end

% construct the 'allbg' vector of all fr before light of all trials 
allbg=[];    
if strcmp(lower(lp.allSpots), lower('allSpots')) == 1
    for ii=1:length(lp.nonLightFR)
        nonLightEvent_ii = lp.nonLightFR{ii};
        nonLightEvents_id = lp.eventIDs{ii};
        if isfield(lp, 'toRemoveIndx') &  isfield(lp, 'removePostExcEvents')
            [a,b,c]= intersect(nonLightEvents_id, lp.toRemoveIndx);
            nonLightEvent_ii(b) = [];            
        end
        allbg = [allbg nonLightEvent_ii];        
    end
end

size_of_allbg = size(allbg);
bgVector1 = calcBgFrFromNonLightEvents(lp);
for ii=1:(lp.dims(1)*lp.dims(2))   
    
     
    lightEvent_ii= lp.lightFR{ii};
    nonLightEvent_ii = lp.nonLightFR{ii};
    nonLightEvents_id = lp.eventIDs{ii};


    
    if isfield(lp, 'toRemoveIndx')' &  isfield(lp, 'removePostExcEvents')'
        [a,b,c] = intersect(nonLightEvents_id, lp.toRemoveIndx);
        nonLightEvent_ii(b) = [];
        lightEvent_ii(b)=[];
    end
    
    spikePerSec = lightEvent_ii;
    spikePerSec_bg = nonLightEvent_ii;

    switch lower(lp.allSpots)
        case {'allspots'}
            lp.statTestType = 'non-paired';
            bgVector = allbg;
        case {'noeventsperiod'}  % only the periords when there was not light events
            lp.statTestType = 'non-paired';
            bgVector = bgVector1;   
        case {'centerspot'}
            lp.statTestType = 'non-paired';
            indx = find(lp.eventsLog(:,1)==lp.centerScanIndx(1) & lp.eventsLog(:,2)==lp.centerScanIndx(2));% find the indices where we hit the hot spot.
            allFR = [lp.lightFR{:}];
            yin = (lp.centerScanIndx(2)-lp.Bounderies(2))/lp.stimuliSize(1)+1;
            xin = (lp.centerScanIndx(1)-lp.Bounderies(1))/lp.stimuliSize(1)+1;

            
            indx = sub2ind(fliplr(lp.dims), yin,xin);
            bgVector = lp.lightFR{indx};
            
        otherwise  % only the spots before this light event
            lp.statTestType = 'paired';
            bgVector = spikePerSec_bg;
    end
    %lp.bgVector = bgVector1;
    lp.bgVector = bgVector;
    
    % shuffel the bg and ligh response. this will give us an estimate of
    % the FDR
    if permutationTest
        z= [bgVector spikePerSec];
        rp=randperm(length(z));
        spikePerSec = z(rp(1:length(spikePerSec)));
        bgVector = z(rp(length(spikePerSec)+1:end));                        
    end
    
    
    switch lower(lp.statTestType)
        case {'ttest'}
            [H, P] = ttest2(spikePerSec, (lp.bgVector),pTH);
        case {'paired'}
            [P, H] = signrank(spikePerSec, lp.bgVector,pTH); %, 'method', 'exact');
        case {'non-paired'}
            [P, H] = ranksum(spikePerSec, lp.bgVector,pTH); %, 'method', 'exact');
    end
    
        
    P1 = [P1 P];
         
    m1 = [m1 mean(spikePerSec)];
    m2 = [m2 mean(bgVector)]; 
end

lp.pValValues = (reshape(P1, lp.dims(2), lp.dims(1)))';
pvals=P1;
P2= P1;%*lp.dims(1)*lp.dims(2);
% excitation
P2(P2 <= pTH) = 0.0;
P2(P2 > pTH) = 1;
P2 = 1 - P2;

% inhibition
P2(find(m1-m2 < 0)) = P2(find(m1-m2 < 0))*2;

% % remove eventx that are excatly after an hotspot as these might be
% % still excited or rebound inhibiton
% hotspotIndx = find(P2==1);
% toRemoveIndx=[];
% for i = hotspotIndx
%     toRemoveIndx = [toRemoveIndx; lp.eventIDs{i}+1];
% end
% lp.toRemoveIndx =toRemoveIndx;
% 
