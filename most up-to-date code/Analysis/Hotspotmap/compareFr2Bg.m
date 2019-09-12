function [spotNum, balanceLoc] = compareFr2Bg(lp, plotFlag, percentMethod)
% check how many spots are required to balance the excitation elicited from
% one glomeruli
% output: spotNum = [the number of spots used to compare bg to fr, % media(p), mean(fr), mean(bg) std(fr), std(bg) and number of spot in the % map]
% we assume there is atleast one hotspot and we remove the hostspot
%%
spotNum=[];
balanceLoc = [nan nan];

if nargin < 2
    plotFlag = 1;
end

    
% remove excitatory spots

map=reshape(lp.lightSpikesFRnew, lp.dims(2), lp.dims(1))';
bgmap=reshape(lp.nonLightSpikes_allNew, lp.dims(2), lp.dims(1))';

pval = hotspotmapPvalue(lp,0.05,0);
exIndx = find(pval == 1);  
if isempty(exIndx) 
    return
end

frMax = mean(map(exIndx)); 
bgMax = mean(bgmap(exIndx));
% remove exc spots
map(exIndx) = []; bgmap(exIndx) = [];
map=map(:); bgmap=bgmap(:);


spotNum=[];
% how many spots we need to balance the excitatory response
if percentMethod
    maxNumOfSpots = round(percentMethod*length(map));
else
    maxNumOfSpots = length(map)-1;
end
    

for NumOfSpots=5:2:maxNumOfSpots
    p=[]; frall=[]; bgall=[];
    for k=1:10  % 10 random trials
        fr=[]; bg=[];

        prnd = randperm(length(map));
        prnd=prnd(1:NumOfSpots);

        fr = [ map(prnd)'];                    
        bg = [ bgmap(prnd)'];

        [h,p(end+1)]=ttest2(fr,bg, 0.05,'left');
        frall(end+1) = mean(fr);
        bgall(end+1) = mean(bg);
    end
    spotNum(end+1,:) = [NumOfSpots, median(p) mean(frall) mean(bgall) std(frall) std(bgall) length(map)];
end

if plotFlag
    figure;
    errorbar(spotNum(:,1)./spotNum(:,end), spotNum(:,3), spotNum(:,5), '-o')
    hold on
    errorbar(spotNum(:,1)./spotNum(:,end), spotNum(:,4), spotNum(:,6), '-or')
    legend('Mean light response', 'Mean background response')
    hold on;
%     sigIndx = find(spotNum(:,2) < 0.05);
%     plot(spotNum(sigIndx,1)', mean(bg)*ones(1,length(sigIndx))+2, '*k')
    box off;
end

% check when the  fr - bg is < 0 
fi=find((spotNum(:,3)./spotNum(:,4)) < 1);
if isempty(fi)
    balanceLoc(1) = nan;  % the number of spots; nan if there is no balance
else
    balanceLoc(1)=fi(min(3,length(fi)));
end

% check when the  fr - bg is < 0 
fi=find(spotNum(:,2) < 0.05);
if isempty(fi)
    balanceLoc(2)=nan;
else
    balanceLoc(2)=fi(1);
end


