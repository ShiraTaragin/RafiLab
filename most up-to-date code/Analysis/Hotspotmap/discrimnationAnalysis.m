%% decoding analysis using distance between samples using a cosine function
randomFlag=0;
if randomFlag == 1
    carlson = carlsonRandom;
else
    carlson = carlsonNoRandom;
end

mat1 = randomizeMat(carlsonRandom);      
mat1(find(mat1<0)) = 0;
mat2 = randomizeMat(carlsonRandom);      
mat2(find(mat2<0)) = 0;
%%
prs.modelType = 'rafic';

trainMat = applyInh(prs, mat1);
testMat = applyInh(prs, mat2);

%
disp('---------------') 
res=[];
for i=1:110
    d=[];
    d=pdist([testMat(i,1:10); trainMat(:,1:10)], 'cosine');
    d1=squareform(d);
    [a,b]=mymin(d1(1,:),2);
    res(end+1) = [ b(2)-i-1];
end
disp([prs.modelType])
length(find(res~=0))/length(res)*100