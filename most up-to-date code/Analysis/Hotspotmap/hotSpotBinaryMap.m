%function pValueMap = hotSpotMapPvalue(lp, plotFlag)

plotFlag = 1;


lp.binSize = 10;
lp.resWin = 1;
clear alltpAll;


[alltpAll] = readAllSignals(lp, 0);
res=zeros(1,length(alltpAll));

for ii=1:size(alltpAll,2)

    tpAll  = alltpAll(ii);
    [P, H]  = ranksum(tpAll.meanFR(1:end),  tpAll.meanFRbg(min(length(tpAll.meanFRbg), 1:length(tpAll.meanFR))));
    tpAll.Prs = P;
    % excitation
    % max FR is very high
    % RED: mean FR is not very high but P is very small
    if (tpAll.Prs < 0.01/(lp.dims(1)*lp.dims(2)) &  max(tpAll.meanFR) > 2*mean(tpAll.meanFRbg) ) & tpAll.mFRbg < tpAll.mFR
             res(ii) = 1;
    end
    if max(tpAll.meanFR) > 1.5*max(tpAll.meanFRbg) 
        res(ii) = 2;
    end
    
     % inhibition
    if (tpAll.Prs < 0.01/(lp.dims(1)*lp.dims(2)) &  tpAll.mFR < 0.8*tpAll.mFRbg)
             res(ii) = 3;
     end
end

M = reshape(res, lp.dims(2), lp.dims(1))'
x=[length(find(res==1)) length(find(res == 2)) length(find(res == 3))]
figure;
imagesc(M)
        
title([num2str(lp.fileIndx) ' - exitation BinaryMap ' num2str(x)])