function [resStrct]=  hotspotCircles(lp, rng,  onlyPosteriorSpots, cen)
% calculate the bg and light response on circles surounding the hotspots

% resStrct:  a structure with:
%   1. ratePerLayer - is the rate of inhibitory spots in each layer. this is
%   a 2d array that contains the number of spots in each layer and the
%   number of inhibitory spots and the distance
%   2. rng - the range of layer distances
%   3. reductionRatePerLayer - The percent of reductions

resStrct=[];   lightFr=[]; bgFr=[];  distAll=[];ratePerLayer=[];

grain=rng(2)-rng(1);


% build the hotspot maps:

map = reshape(lp.lightSpikesFRnew, lp.dims(2), lp.dims(1))';
mapbg = reshape(lp.nonLightSpikes_allNew, lp.dims(2), lp.dims(1))';
[pVal, pValues] = hotSpotMapPvalue(lp,0.05,0);

% % correct for projector flip at the end 2011
% str = [findstr('2010', lp.dirPath) findstr('2011', lp.dirPath)];
% str2 = findstr('Nov 2011', lp.dirPath);
% if ~isempty(str) & isempty(str2) % 2000 or 2011 but not november 2011
%     map = flipud(map);
%     mapbg = flipud(mapbg);
%     pVal = flipud(pVal);    
% end

% find the location of the hotspot
pValTemp = pVal;
pValTemp(pValTemp==2) = 0;

% if isempty(cen)
    if sum(sum(pValTemp)) > 0 
        [~, b1] = max(sum(pValTemp));
        [~, b2] = max(sum(pValTemp'));
    else
        [a,b1] = max(max(map));
        [a,b2] = max(max(map'));
    end
    cen=[b2,b1];
% else
%     cen
% end         

% remove responding spots from the analysis
map(find(pVal == 1)) = mean(mean(mapbg));
pValues(find(pVal == 1)) = 1;

% only posterior spots:
if onlyPosteriorSpots == 1
    % remove posterior spots
    map(1:(cen(1)-1),:) = [];
    mapbg(1:(cen(1)-1),:) = [];
    cen(1) = 1;
end
if onlyPosteriorSpots == -1
    % remove posterior spots
    map((cen(1)+1):end,:) = [];
    mapbg((cen(1)+1):end,:) = [];
    cen(1) = size(map,1);
end


lightFr=[]; bgFr=[];  distAll=[]; diffFr=[];
centxy = [lp.xRange(cen(1,2)),  lp.yRange(cen(1,1)) ];

% search for all point that are in some distance from the centxyx
meanReductionInFR=[];

for kk=1:length(rng)-1
       
    llimit = rng(kk);
    hlimit = rng(kk+1);
    
    % d conatins all spots index in the range: "hlimit > X > llimit"
    d=[];
    yindx=0;
    xindx=0;
    for y=(lp.yRange)'
        yindx=yindx+1;
        if yindx > size(map,1)
            continue
        end
        for x=(lp.xRange)'
            xindx=xindx+1;
            if xindx > size(map,2)
                continue
            end
            dxy2centxy = norm([x y] - centxy);
            if dxy2centxy >= llimit & dxy2centxy < hlimit
                d(end+1,1:3) =[dxy2centxy xindx yindx];
            end
        end
        xindx=0;
    end
    
    distAll(end+1).d = d;
    %if isempty(d) continue; end
    
    % d contain the index of the spots in the raneg
    % go over d and calculate fr 
    s=[]; q=[]; v=[]; sTrials=[]; qTrials=[]; pPerSpot=[]; meanReductionInFRTemp=[];
    for i=1:size(d,1)    
        % fr and bg values
        s = [s map(d(i,3), d(i,2))];
        q = [q mapbg(d(i,3), d(i,2))];
        v = [v pValues(d(i,3), d(i,2))];  % if p < 0.05 it is inhibitory
               
    end
    

    % lightFr and bgFr contains the mean and std of all the spots in range
    lightFr(end+1,:) = [mean(s) std(s)/sqrt(length(s)) length(s)];
    bgFr(end+1,:) = [mean(q) std(q)/sqrt(length(q)) length(q)];
    % keep the diff in FR
    diffFr = [diffFr [s-q]];
    
    % keep the diff in FR of the inhibitory spots only
    meanReductionInFR(end+1) = mean(s(find(v < 0.05)) - q(find(v < 0.05)));    
    

    ratePerLayer(end+1,:) = [length(find(v < 0.05)) length(v) llimit];  % percent of inhibitory spots per layer
end


% remove nans
nn = isnan(lightFr(:,1));
lightFr(nn,:) = []; bgFr(nn,:) = []; rng(nn) = [];


resStrct.lightFr = lightFr;
resStrct.bgFr = bgFr;
resStrct.diffFr = diffFr;
resStrct.distAll = distAll;
resStrct.rng=rng;
resStrct.reductionRatePerLayer = lightFr(:,1)./bgFr(:,1);
resStrct.reductionRatePerLayer2 = lightFr(:,1)./mean(lp.nonLightSpikes_allNew);
resStrct.ratePerLayer = ratePerLayer;
resStrct.cen=cen;
resStrct.meanReductionInFR = meanReductionInFR;

