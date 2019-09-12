%%
% read the new tpa's we collected

dirPaths{1} = 'f:\Data\2012\Dec 2012\Dec 26 2012 OMP bulb\';
dirPaths{2} = 'f:\Data\2012\Dec 2012\Dec 27 2012 OMP bulb\';
dirPaths{3} = 'f:\Data\2012\Dec 2012\Dec 28 2012 OMP bulb\';
dirPaths{4} = 'f:\Data\2012\Dec 2012\Dec 30 2012 OMP bulb\';
dirPaths{5} = 'f:\Data\2013\Jan 2013\Jan 1 2013 OMP bulb\';
dirPaths{6} = 'f:\Data\2013\Jan 2013\Jan 2 2013 TBET bulb\';
    
allTpaNewOrg=[];
for i = 1:length(dirPaths)    
    [dirPaths{i} 'Analysis']
    cd ([dirPaths{i} 'Analysis'])
    load tpaArraryMng2    
    tpaArraryMng2.dirPath = dirPaths{i};
    allTpaNewOrg{end+1} = tpaArraryMng2;
end


allTpaNewOrg = cleanTpaSize(allTpaNewOrg);

[badSignalsList] = tempUpdateBadSignals(allTpaNewOrg);
allTpaNew=allTpaNewOrg;
allTpaNew(badSignalsList) = [];
allTpaNew=readAllSniffInfo(allTpaNew)
allTpaNew =  updateStartTimes(allTpaNew);

%%
% statistics:
res=[];
for i=1:45
    tpa = allTpaNew{i};
    if length(strfind(tpa.lp.dirPath, 'OMP')) > 0
        res(end+1,1) = 1;
    else
        res(end+1,1) = 2;
    end
        
    res(end,2) = size(tpa.lp.Bounderies,2);    
    res(end,3:4) = tpa.trialMean_11(3:4);
end
res(4:7,:) = [];
ompIndx = find(res(:,1) == 1);
ompIndx = ompIndx(end);

disp('mean and std of number of spots OMP')
[mean(res(1:ompIndx,2))/2 std((res(1:ompIndx,2))/2)]
disp('mean and std of number of spots TBET')
[mean(res(ompIndx+1:end,2))/2 std((res(ompIndx+1:end,2))/2)]
% sort res so that all inhibiton values will be in column 3
for i=1:size(res,1)
    if res(i,3) > res(i,4)
        res(i,3) = res(i,4);
    end
end
disp('mean fr OMP and TBET')
[mean(res(1:ompIndx,3)) mean(res(ompIndx+1:end,3))]
boxplot(res(:,3), [ones(1,ompIndx) 2*ones(1,size(res,1)-ompIndx)])
[h,p]=ttest2(res(1:ompIndx,3), res(ompIndx+1:end,3))
box off;
title(['p = ' num2str(p)])
