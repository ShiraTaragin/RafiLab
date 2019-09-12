function bgToLightDirectedGraph(lp, pTh)

if nargin < 2
    pTh=0.05;
end
map = reshape(lp.lightSpikesFRnew, lp.dims(2), lp.dims(1))';
mapbg = reshape(lp.nonLightSpikes_allNew, lp.dims(2), lp.dims(1))';
map=map(:);
mapbg = mapbg(:);
ind1=[]; ind2=[];
cout=[0 0];
figure; 
hold on;
% for i=1:length(map)
%     pairP = [ mapbg(i) map(i)];
%     if pairP(1) > 1*pairP(2)
%         plot(pairP, ':r')
%         cout(1) = cout(1)+1;
%         ind1(end+1) = i
%     end
%     if pairP(1) < 1*pairP(2)   
%         plot(pairP,':b')
%         cout(2) = cout(2)+1;
%         ind2(end+1) = i
%     end
% end
% subplot(2,1,1)
% plot([mean(mapbg(ind1)) mean(map(ind1))], 'r', 'LINEWIDTH',length(ind1)/10)
% plot([mean(mapbg(ind2)) mean(map(ind2))], 'b', 'LINEWIDTH',length(ind2)/10)
% legend('decrease', 'increase')
% title(['file:' num2str(lp.fileIndx) '_' num2str(lp.mClusterIndx) ' inh# & ext# ' num2str(cout)]) 

% scatter plot
pThList = [  pTh ];
for pTh = pThList
    pValueMap = lp.pVal(:);
    
    extIndx = find(pValueMap == 1);
    inhIndx = find(pValueMap == 2);

    %subplot(2,1,2)
    scatter(mapbg, map,  'fill','SizeData', 80);
    hold on;
    
%     if pTh == 0.05
%         scatter(mapbg(extIndx), map(extIndx),  'filled', 'SizeData', 20, 'MarkerFaceColor', [200 0 0]./255);
%         scatter(mapbg(inhIndx), map(inhIndx), 'filled', 'MarkerFaceColor', [0 00 200]./255, 'SizeData', 200);
%     else
%         scatter(mapbg(extIndx), map(extIndx), 'filled','SizeData', 20, 'MarkerFaceColor', [255 120 0]./255 );
%         scatter(mapbg(inhIndx), map(inhIndx),  'filled', 'SizeData', 20, 'MarkerFaceColor', [0 120 255]./255);
% 
%     end
    xlabel('bg fr'); ylabel('fr')


    plot([min(min(mapbg), min(map)) max(max(mapbg), max(map))], [   min(min(mapbg), min(map)) max(max(mapbg), max(map))], ':k')
    axis([min(min(mapbg), min(map)) max(max(mapbg), max(map)) min(min(mapbg), min(map)) max(max(mapbg), max(map))])
end