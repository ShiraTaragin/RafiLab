function [expectedActualOverlap,  pall, inhDist, hostspotsDist, mapCorr, resall] = processNeuronPairs(lpall, hotspotMapsPerMouse,plotFlag)
% check the amount of overlap of inhibitiry spots between all neuron pairs
% recorded in the same mouse with the same parameters
resall=[];
pall=[]; mapCorr=[]; expectedActualOverlap=[];
hostspotsDist=[]; inhDist=[];
if nargin < 3
    plotFlag=0;
end

for i=1:length(hotspotMapsPerMouse)
    neuronHotspots = hotspotMapsPerMouse{i};
    for j=1:length(neuronHotspots)
        for k=j+1:length(neuronHotspots)
            x = [neuronHotspots{j}.Boundery - neuronHotspots{k}.Boundery];
            % if these neurons have the same parameters (spot size,
            % boundery)
            if size(neuronHotspots{j}.pVal, 1) == size(neuronHotspots{k}.pVal, 1) & size(neuronHotspots{j}.pVal, 2) == size(neuronHotspots{k}.pVal, 2) & sum(abs(x)) == 0

                disp('neuron indecies')
                [neuronHotspots{j}.indx neuronHotspots{k}.indx]
                
                lp1=lpall(neuronHotspots{j}.indx).lp;
                lp2=lpall(neuronHotspots{k}.indx).lp;
                lp1.dirPath
                % actual overlap
                pval1 = neuronHotspots{j}.pVal;
                pval2 = neuronHotspots{k}.pVal;
                

                % compute the correaltion between the maps without the exc
                % spots!


                nonExcSpots = [intersect(find(pval1 ~= 1), find(pval2 ~= 1))]';

                map1 = lp1.map;
                map2 = lp2.map;

                [r,p]=corrcoef(map1(nonExcSpots), map2(nonExcSpots));
                %[r,p]=corrcoef(map1(), map2());
                
                mapCorr(end+1,:) = [r(1,2) p(1,2)];

                % find the main hotspot
                [a1, b1] = max(map1(:));
                [a1, b1] = find(map1 == a1);
                [a2, b2] = max(map2(:));
                [a2, b2] = find(map2 == a2);

                
                %distance between hotspots:
                hostspotsDist(end+1,: ) = [sqrt((a1-a2)^2+(b1-b2)^2)*lp1.stimuliSize(1)*lp1.exp.pixelSize  neuronHotspots{j}.indx neuronHotspots{k}.indx]; % in pixels
                % distance in inhibitory strength
                p1=lp1.statP.pNoExc
                p2=lp2.statP.pNoExc
                z1 = p2z(p1); %
                z2 = p2z(p2);  %-sqrt(2) * erfcinv(p2*2);
                
                inhDist(end+1) = abs(z1-z2);
                
                disp(['hotspot distance versus inh strength distance: hotspotDist =  '  num2str(hostspotsDist(end)) '  inh distance = ' num2str(inhDist(end))])
                
                if plotFlag
                 subplot(2,2,1); imagesc(pval1); title([num2str(neuronHotspots{j}.indx) ' - ' num2str(neuronHotspots{j}.neuronNum) '_' num2str(neuronHotspots{j}.mClusterIndx)])
                 subplot(2,2,2); imagesc(pval2); title([num2str(neuronHotspots{k}.indx) ' - ' num2str(neuronHotspots{k}.neuronNum) '_' num2str(neuronHotspots{k}.mClusterIndx)])

                 subplot(2,2,3); imagesc(map1); title([num2str(neuronHotspots{j}.neuronNum) '_' num2str(neuronHotspots{j}.mClusterIndx)])
                 subplot(2,2,4); imagesc(map2); title([num2str(neuronHotspots{k}.neuronNum) '_' num2str(neuronHotspots{k}.mClusterIndx)])
                end
                 %[p, r, un, sharedExcSpots] = compare2LpPmaps (lp1, lp2, 0);
%                  disp(['number of shared inhibitory hotspot: ' num2str(un)])
                 
                lpiIndex = [lp1.fileIndx lp2.fileIndx]
                [shaerdInhSpots ] = sharedInhExcMap(pval1, pval2 );

                % compute the expected overlap assuming random
                [expOverlap, pall(end+1,:)] = estimateOverlapOfMaps(length(find(pval1==2)), length(find(pval2==2)), length(pval1(:)), shaerdInhSpots(1));
                expectedActualOverlap(end+1,:) = [expOverlap shaerdInhSpots(1)];
                disp(['mean +std of expected overlap and p value if actual is > expected'])
                
                disp('expected, #inh1, #inh2, #Shared, P, hotspotSid, lpId1, lpId2, corr, lp indx1, ,lp indx2')
                resall(end+1,:) = [expOverlap(1), length(find(pval1==2)), length(find(pval2==2)), shaerdInhSpots(1), pall(end,1), hostspotsDist(end)', lp1.fileIndx, lp1.mClusterIndx(1), lp2.fileIndx, lp2.mClusterIndx(1), mapCorr(end,:) neuronHotspots{j}.indx neuronHotspots{k}.indx]
                
%                 res(end+1,:) = [res1 res2 neuronHotspots{j}.indx neuronHotspots{k}.indx];
                
                disp('phase of each neuron')
                if isempty(lp1.sniffTimes) | isempty(lp2.sniffTimes)
                    disp('no sniff data available')
                end
                
                 disp('p value of inhibition level')
                [lp1.statP.pNoExc lp2.statP.pNoExc]
                        
                if plotFlag
                    input('press and key to continue')
                end

            end
        end
    end
end


