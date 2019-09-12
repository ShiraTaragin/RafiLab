function [exInCount] = countInExSpots(lpall, modelParam, permutationTest)
% count how many spots are ex and in
% input:
%   MOUSE_TYPE omp or tbet
%   MAX_SPOT- consider only cases in which we have no more than excitatory
%   spots than MAX_SPOT
%   minStimuliSize - do not consider cases which have stimuli size > minStimuliSize
%   th- the p value to use to compute exc and inh
if nargin < 3
    permutationTest=0;
end


exInCount=[];
cn=0;
for i=1:length(lpall)

    if i==99
        i;
    end
    if strcmp(lpall(i).mouseType, modelParam.MOUSE_TYPE) == 0
        continue
    end

    lp=lpall(i).lp;

    if lpall(i).twoBulbs == 1 
        disp([' two bulbs: ' num2str(i)])
        %continue
    end
    
    res = checkMapConfitions(lp,  modelParam);
    if res > 0
        res;
         continue;
    end

    % compute when the fr and bgfr are shuffeled
    %lp.shuffelingFalg=1;   hotSpotMap;  close
    
    
    
    cn=cn+1;
    if permutationTest
        [lp statP]= hotSpotMapPvalue(lp,modelParam.th,0,permutationTest);
    end
    
    pVal=lp.pVal;
    map=lp.map;
    bgmap=lp.bgmap;
    
    statP=lp.statP;

    % clean up for cases we recorded two bulbs
    
     
    pValTemp = pVal;
    pValTemp(pValTemp==1)=0;     pValTemp(pValTemp==2)=1;

    % find how many adjecnt inhibitory spots we have
    adjSpots = length(find(conv2(pValTemp, [1 1 ;1 1],'valid')==2));


    mean_fr = mean(map(:));
    mean_bgfr = mean(bgmap(:));
    
    mean_frInh = mean(lp.map(find(pVal==2)));
    mean_bgfrInh = mean(lp.bgmap(find(pVal==2)));
    
    % compute how many spots reduce the fr on avearge
    indx = find(lp.pVal == 0);
    reducingFrSpotsPer = sum((lp.map(indx)-lp.bgmap(indx)) <= 0)/length(indx);

    estamtedInhExcFDR = [0 0];

    % #exc, #inh, #neutral, #pNoExc, estamtedInhExcFDR, adjSpots, mean_fr, mean_bgfr, mean_frInh, mean_bgfrInh, reducingFrSpotsPer i
    exInCount(end+1,:) =[length(find(pVal==1)) length(find(pVal==2)) length(find(pVal==0)) statP.pNoExc statP.pNoInhExc estamtedInhExcFDR adjSpots mean_fr mean_bgfr mean_frInh mean_bgfrInh reducingFrSpotsPer i];
end


