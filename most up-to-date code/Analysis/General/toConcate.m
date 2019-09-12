function [lpConc] = toConcate(expArray,clusterArray)
if length(clusterArray) == 1
    clusterArray = ones(1,size(expArray,2))*clusterArray;
end
if size(expArray,2)~= size(clusterArray)
    error('all arrays should be line vectors, and in the same length')
end

lpArray = [];
for i = 1:size(expArray,2)
    [exp] = readExpDescFile(pwd); fileindx =expArray(i);
    lp = initLightParam(exp, fileindx, 1);  lp  = readLpData( lp, [-10 10], [1 1 1],clusterArray(i));
%     sprintf('lp%d_%d',expArray(i),clusterArray(i)) = lp;
    lpArray = [lpArray lp];
end

lpConc = concatLps(lpArray);
% save(['lpConc_ ' num2str(expArray)]);
drawWV(expArray,clusterArray);

% print the data on all lps
totalReps=0;
disp('ID,  cluster,   ISI,  TotalReps,  #spots,   repsUntilBreak,   breakTime')
for i=1:size(lpArray,2)    
    disp([num2str(lpArray(i).fileIndx) '  ,  ' num2str(lpArray(i).mClusterIndx) '  ,  ' num2str(lpArray(i).ISI) '  ,  ' ...
        num2str(lpArray(i).totalReps) '  ,  ' num2str(lpArray(i).NumOfSpots) '  ,  ' num2str(lpArray(i).repsUntilBreak) '  ,  ' num2str(lpArray(i).breakTime) '  ,  '])
    totalReps = totalReps + lpArray(i).totalReps;
end
disp(['total reps: ' num2str(totalReps)])