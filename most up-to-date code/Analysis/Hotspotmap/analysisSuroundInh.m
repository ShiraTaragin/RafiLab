function [exInCount, exInCountPer] = analysisSuroundInh(lpall, modelParam, overallInhP_th,spotPercentRate, permutationTest, correctMultiGlo)
% spotPercentRate hold the FDR for exc and inh estimated by random
% shuffeling analysis
% compure the percent of inhiitory spots
if nargin < 6
    correctMultiGlo = 0;
end
if nargin < 5
    permutationTest = 0;
end


exInCountPer=[];
    % #exc, #inh, #neutral, pNoExc, pNoInhExc estamtedInhExcFDR, adjSpots, mean_fr, mean_bgfr, mean_frInh, mean_bgfrInh, reducingFrSpotsPer, i
exInCount = countInExSpots(lpall, modelParam, permutationTest);

% percent wise omp
exInCountPer=[];
% remove overlapping inhibitopry spots
if correctMultiGlo
    exInCountPer(:,1) =  exInCount(:,1)'./sum(exInCount(:,[1:3])'); % exc
    exInCountPer(:,2) =  (exInCount(:,2)'-exInCount(:,8)')./sum(exInCount(:,[2 3])'); % inh
else
    %without removing overlapping inhibitopry spots
    exInCountPer(:,1) =  exInCount(:,1)'./sum(exInCount(:,[1:3])'); % exc
    exInCountPer(:,2) =  exInCount(:,2)'./sum(exInCount(:,[2 3])'); % inh
end

disp(' ------------------------ ');
disp([modelParam.MOUSE_TYPE '   '  modelParam.neuronType])
disp(' ------------------------ ');


exInCountPer = exInCountPer - repmat(spotPercentRate, size(exInCountPer,1),1);
disp(['mean (exc, inh), std(exc, inh) and median(exc, inh) percent of exc and inh:' num2str(size(exInCountPer,1)) ' neurons'])
[mean(exInCountPer)*100 std(exInCountPer)*100  median(exInCountPer)*100]


inhibtedNeruonsIndx = find(exInCountPer(:,2) > spotPercentRate(2));
disp(['mean (exc, inh) when we consider only neurons with inhibiton. #neurons = ' num2str(length(inhibtedNeruonsIndx))])
[mean(exInCountPer(inhibtedNeruonsIndx,:))*100 std(exInCountPer(inhibtedNeruonsIndx,:))*100  median(exInCountPer(inhibtedNeruonsIndx,:))*100]

inhIndx = find(exInCount(:,4) < overallInhP_th);
disp(['neurons with high global inhibition: ' num2str(length(inhIndx)) ' neurons'])
[mean(exInCountPer(inhIndx,:))*100 std(exInCountPer(inhIndx,:))*100  median(exInCountPer(inhIndx,:))*100]

;

% percent of exc and inh spots
subplot(2,2,1)
hold all;
barwitherr([std(exInCountPer(:,1:2))./sqrt(size(exInCountPer,2)) ]*100, mean(exInCountPer(:,1:2))*100);
box off;
h = findobj(gca,'Type','patch');
set(h,'FaceColor','w','EdgeColor','k')
title([modelParam.MOUSE_TYPE ' max percent of hotspots ' num2str(modelParam.MAX_HOTSPOT) ' MIN_NUM_OF_SPOTS '  num2str(modelParam.MIN_NUM_OF_SPOTS)])

inhPercentDist = ((exInCount(:,2)-exInCount(:,6))./sum(exInCount(:,2:3)')')';
disp(['inh percent distribution per mouse type after substrucing th expected one: ' num2str(mean(inhPercentDist)*100)])


% dist of percent of inh spots
hold all;
subplot(2,2,2)
hold all;
[a,b]=hist(inhPercentDist*100,[0:spotPercentRate(2)*100*2:20*spotPercentRate(2)*100]);
bar(b-spotPercentRate(2),a./sum(a));
xlabel('Inh percent'); ylabel('count'); title(modelParam.MOUSE_TYPE)
hold on;

% disp of PnoExc p values
subplot(2,2,3)
hold all;
[a,b]=hist(exInCount(:,4),[0:0.05:1]);
plot(b,a./sum(a),'.-')
xlabel('PnoExc value')

% disp of PnoInhExc p values
subplot(2,2,4)
hold all;
[a,b]=hist(exInCount(:,5),[0:0.05:1]);
plot(b,a./sum(a),'-')
xlabel('PnoInhExc value')


% amount of overall inhibition
noi = length(find(exInCount(:,4) > overallInhP_th)')/size(exInCount,1);
disp('  ');
disp(['percent of neurons with no overall inhibition: ' num2str(noi*100)])
disp(['percent of neurons with no inhibitory spots: ' num2str(sum(inhPercentDist <= spotPercentRate(2))/length(inhPercentDist)*100)])

indx=find(isnan(exInCount(:,end-2))'==0);
[r,p]=corr(exInCount(indx,end-2), exInCountPer(indx,2),'type','spearman');
disp([' correlation between bg firing rate and % of inhibiton r=' num2str(r) ' p=' num2str(p) ])

