function pValueMap = drawHotSpotMapPvalue(lp, alltpAll)


P1=[]; m1=[]; m2=[]; P2=[];
range=(2:40)*5/1000;
bgRange = (1:40)*5/1000;

for ii=1:(lp.dims(1)*lp.dims(2))       
    %[spikesCount, spikePerSec,spikePerSec_bg, spikePerSec_bgbg] = getSpikesPerSec4Range(alltpAll(ii),range, bgRange);
    spikePerSec = lp.lightFR{ii};
    spikePerSec_bg = lp.nonLightFR{ii}

    [H, P] = ttest2(spikePerSec, spikePerSec_bg);
        
    P1 = [P1 P];
         
    m1 = [m1 mean(spikePerSec)];
    m2 = [m2 mean(spikePerSec_bg)]; 
end
bgMeanValue = mean(m2);
bgStdValue = std(m2);

P2= P1%*lp.dims(1)*lp.dims(2);
% 
P2(P2<= 0.05) = 0.0;
P2(P2> 0.05) = 1;
P2 = 1-P2;

% inhibition
P2(find(m1-m2 < 0)) = P2(find(m1-m2 < 0))*2;




pValueMap = (reshape(P2, lp.dims(2), lp.dims(1)))';

figure;
imagesc(lp.xRange, lp.yRange,pValueMap); 

inhibitNum = length(find(pValueMap==2))/length(pValueMap(:));
excitNum = length(find(pValueMap==1))/length(pValueMap(:));
title([ num2str(lp.fileIndx) '_' num2str(lp.mClusterIndx) ' - P values ' num2str([excitNum  inhibitNum ])])

