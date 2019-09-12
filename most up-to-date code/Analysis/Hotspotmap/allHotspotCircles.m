function allHotspotCircles(hotspotmapList)
% analyze inhibition is circule around the hotspot for all maps

% extract the lp structure for a subset of experiments
allChange=[];
removeSpots=[];

for i=1:length(hotspotmapList)  %[1 3 6 10 13 14 16:27]
    lp=hotspotmapList{i}.lp;
    [allChange(end+1).percentOfReduction removeSpots(end+1)] = hotspotCircles(lp, hotspotmapList{i}.cen, hotspotmapList{i}.spotTh);
end

c=zeros(1,8);
for j=1:8
    p=[];
    for i=1:size(allChange,2)    
        if length( allChange(i).percentOfReduction) >= j %& removeSpots(i) < 4
            p(end+1) = allChange(i).percentOfReduction(j)
            c(j) = c(j) +1;
        end
    end
    percentOfReduction(j,1:2) = [mean(p) std(p)/sqrt(length(p))];
end
        
c = find(c > 5);

figure;
errorbar(c.*100, percentOfReduction(c,1), percentOfReduction(c,2))
hold on;
plot([0 c(end)*100], [ 1 1],':g')
a=axis;
axis([a(1:2) 0.7 1.05])
ylabel('% from background');
xlabel('Distance from hotspot (um)')
box off
title([ '# of experiments: ' num2str(size(allChange,2))])
