function [expectedOverlap, p] = estimateOverlapOfMaps(inh1, inh2, matSize, actual)
%% check how many spots are expected (mean and std) to overlap assuming random distribution
res=[];p=[];
for i=1:1000
    r=zeros(1,matSize);

    p=randperm(matSize);
    r(p(1:inh1)) = 1;
    p=randperm(matSize);
    r(p(1:inh2)) = r(p(1:inh2)) + 1;
    res(end+1) = length(find(r==2));
end
%disp('Mean number of spots expected to overlap when assuming random spread')
expectedOverlap = [mean(res) std(res);];
p = length(find(res >= actual))/length(res);