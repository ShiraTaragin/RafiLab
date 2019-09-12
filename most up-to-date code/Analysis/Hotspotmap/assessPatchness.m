function actualPatchesRate = assessPatchness(mat)
%% check the patchness of the matrix mat
% we assume mat has 0 or 1  values
% calculate how many 1's are close to each other


i1=size(mat,1);
j1=size(mat,2);
  
%%
c=2;
s=[];
for i=1:i1-c
    for j=1:j1-c
        s = [s  sum(sum(mat(i:(i+c), j:(j+c))))];
    end
end

actualPatchesRate = length( find(s>2))/length(s);

    
    