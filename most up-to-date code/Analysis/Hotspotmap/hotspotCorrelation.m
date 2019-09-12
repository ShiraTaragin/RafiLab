function r = hotspotCorrelation(lp1,lp2)

%hotspotCorrelation
% calculate the resemblance of hotspots
% parameters: lp1 and lp2 (optional)
% if lp2 is not provided than self correlation will be calculated


if nargin < 2
    totalReps = size(lp1.lightFR{1},2);
    a = randperm(totalReps);
    a1 = a(1:totalReps/2);
    a2 =  a(totalReps/2+1:end);
    fr1=[]; fr2=[];
    for ii=1:size(lp1.lightFR,2)
        ii
        x = lp1.lightFR{ii};
        fr1(end+1) = mean(x(a1));
        fr2(end+1) = mean(x(a2));
    end

    [r,p]=corrcoef(fr1,fr2)
else
    [r,p2]=corrcoef( lp1.lightSpikesFRnew, lp2.lightSpikesFRnew)
    
    
end

