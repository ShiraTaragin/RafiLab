function [ pAll, res] = lpTemporalModulation(lp, numOfBins,extBoundry, controlFlag)
pAll=[];

plotFlag=0;

for i=1:size(lp.lightFR,2)
    if i==43
        d=2;
    end
    
    [tpAll, lp] = plotTrialTime3(lp, i, extBoundry, controlFlag);

    % arrange the spikes before 0 and after 0 in n=5 bins 
    beforeZero = tpAll.allSpikesTimes(find(tpAll.allSpikesTimes <= 0));
    afterZero = tpAll.allSpikesTimes(find(tpAll.allSpikesTimes > 0));
    
    
    rng = -0.15:0.15/numOfBins:0;
    binS=[];
    for jj = 1:numOfBins
        binS(end+1) = length(find(beforeZero > rng(jj) & beforeZero <= rng(jj+1)));
    end
    
    rng = 0:0.15/numOfBins:0.15;
    for jj = 1:numOfBins
        binS(end+1) = length(find(afterZero > rng(jj) & afterZero <= rng(jj+1)));
    end
        
 
%     a1=acumlate(binS(1:numOfBins)); a1=a1/max(a1);
%     b1=acumlate(binS((numOfBins+1):end)); b1=b1/max(b1);
    [h,p]=ttest2(tpAll.fr, tpAll.bgFr, 0.05, 'right');
    
    if p < 0.05 continue; end
    
    [hAccum,pAccum] = kstest2((binS(1:numOfBins)),(binS((numOfBins+1):end)));
    pAll(end+1,1) = pAccum;
end
    

res = size(find(pAll(:,1) < 0.05),1)/size(pAll,1);
