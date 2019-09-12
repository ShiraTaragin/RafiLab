function [] = getBoundsCenterScan(lp,buff,jumpSize)
[yAll yPlot xPlot] =  getSelectedSpots(lp);

[a,I] = sortrows(yAll);
spotLoc = [lp.yRange(a(1,1)) lp.xRange(a(1,2))]; % the selected spot location
disp(['Selected spot was: ' num2str(spotLoc)])
xCenter = minmax([lp.xRange(a(2))-buff*lp.stimuliSize lp.xRange(a(2))+buff*lp.stimuliSize(1)]);
yCenter = minmax([lp.yRange(a(1))-buff*lp.stimuliSize lp.yRange(a(1)) lp.yRange(a(1))+buff*lp.stimuliSize]);

minY = min(fliplr(yCenter(1):-buff*lp.stimuliSize*jumpSize: lp.Bounderies(2))); % go backwards to the hot spot in y axis.
maxY = max(yCenter(2):+buff*lp.stimuliSize*jumpSize:lp.Bounderies(4));% go forwards to the hot spot in y axis.

minX = min(fliplr(xCenter(1):-buff*lp.stimuliSize*jumpSize:lp.Bounderies(1))); % go backwards to the hot spot in x axis.
maxX = max(xCenter(2):+buff*lp.stimuliSize*jumpSize:lp.Bounderies(3)); % go forkwards to the hot spot in x axis.

disp(['New boundaries: ' num2str([minX minY maxX maxY])])
disp(['New stimuli size: ' num2str(jumpSize*lp.stimuliSize)])