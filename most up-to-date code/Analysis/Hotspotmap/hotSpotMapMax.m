%drawHotSpotMapPvalue2

P2=[]; m1=[]; m2=[];
for ii=1:length(alltpAll)
   
    P2 = [P2 max(alltpAll(ii).meanFR(1:min(20*lp.resWin*1000, length(alltpAll(ii).meanFR))))];
      
end

pValueMap = (reshape(P2, lp.dims(2), lp.dims(1)))';

x=[];
for i=1:lp.dims(2)
    x = [ x max(alltpAll(i).meanFRbg)];
end
%pValueMap(end+1,:) = x;

if  lp.dims(1)*lp.dims(2)> lp.dims(1)+ lp.dims(2)
    imagesc(lp.xRange, lp.yRange, pValueMap); 
else
        errorbar_patch(1:lp.stimuliListSize, pValueMap,ones(1,lp.stimuliListSize), 'b')
end

%imagesc(lp.xRange, [lp.yRange; lp.yRange(end)+lp.yRange(2)-lp.yRange(1)], pValueMap); 
title(['max values, th=' num2str(lp.minwv(1))])

disp('Statistics of 0 1 and 2 values')
x = [sum(sum(pValueMap == 0)) sum(sum(pValueMap == 1)) sum(sum(pValueMap == 2))];

