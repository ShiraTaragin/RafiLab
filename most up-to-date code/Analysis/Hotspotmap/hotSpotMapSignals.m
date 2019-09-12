function [alltpAll] = hotSpotMapSignals(lp, trialIndex, subPlot, scaleVal, useFile)

histFlag = 0;
if length(trialIndex) ~= subPlot(1)*subPlot(2)
    error(' The subplot does not fir to the number of requested plots')
end

allRise=[];
P1 = []; m1=[]; m2=[];
indx=0;
figure;

[alltpAll,] = readAllSignals(lp, useFile)

% avearge spontanous FR:
res = [];
for ii=1:length(alltpAll) 
    res(end+1) = alltpAll(ii).mFRbg;
end

meanFRbg = mean(res)
stdFRbg = std(res);;

for ii=trialIndex 
    
    indx=indx+1;
    tpAll = alltpAll(ii);
    %[tpAll]= plotTrialTime2(lp, ii, lp.binSize, lp.resWin ,[-0 00], 0);

    subplot(subPlot(1),subPlot(2),indx)
    hold on;
    
    plotTp(tpAll, lp, lp.resWin/1000,-1);
    x=axis;
    axis([tpAll.meanXvalueFRbg(1)  tpAll.meanXValueFR(end) scaleVal])
   
    y = tpAll.meanXValueFR(find(tpAll.meanFR > 4*meanFRbg));%  + 2*stdFRbg/sqrt(length(res)) );
    if isempty(y) 
        y(1)=-10; 
    end
    alltpAll(ii).rise = y(1);
    allRise(end+1) = y(1);

    [a,maxPos] = max(tpAll.meanFR);
     if isempty(maxPos)
         maxPos = -1;
     end
    
    title(['rise:' num2str(y(1)) ' max:' num2str(tpAll.meanXValueFR(maxPos(1)))  ' P= ' num2str(alltpAll(ii).Prs,2)])
    grid on;
end


if histFlag
    figure; hist(allRise);
    title([lp.datFile(max(end-9,1):end)  ' Rise time distribution'])
    %xlabel('ms')
end