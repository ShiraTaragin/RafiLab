function res = assessRanomPatchness(mat)
%% patchness
%% mat is the a matrix with 0,1
% we generate many random mat's with the same number of 1 values and check
% patchens

%% check patcheness assuming random
res=[];
for i=1:300
    matR = zeros(size(mat));
    p=randperm(length(mat(:)));
    p = p(1:length(find(mat==1)));
    matR(p) = 1;
    actualPatchesRate = assessPatchness(matR);
    res = [res actualPatchesRate];
end

    