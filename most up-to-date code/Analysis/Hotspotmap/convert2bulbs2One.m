function lp = convert2bulbs2One(lp)
% remove the sections that are contaminating the comutaitons of percent of
% exictatory spots and rate of inhibitory spots
% this will be done inside hotspotPmap only
%% convert a 2 bulb recording to one
lp=lp;

if size(lp.TTLEvents,2) < size(lp.eventsLog,1)
    return
    lp.eventsLog( size(lp.TTLEvents,2)+1:end,:)=[];
end
disp('[COVERTING a 2 Bulb recording into 1 bulb recording')

% correct the yRange
a = floor(length(lp.yRange)/2);
% correct the dims
lp.dims(1) = length(lp.yRange)-a;
lp.yRange(1:a) = [];


% remove the events
indx  = find(lp.eventsLog(:,1) < lp.yRange(1));
% remove indx that do not exsit in the TTLevnets (because we stopped the
% run or something else)

indx(find(indx > size(lp.TTLEvents,2)))=[];

lp.eventsLog(indx,:)=[];
lp.TTLEvents(:,indx) =[];


% correct the bounderies
lp.Bounderies(1) = lp.yRange(1);



