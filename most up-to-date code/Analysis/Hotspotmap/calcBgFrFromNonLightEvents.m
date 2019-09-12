function bgFrDist = calcBgFrFromNonLightEvents(lp)

% calc bg fr distribution from the begining and end of recording before the
% light started and from the breaks if there are any
lp.pValBeforeAndAfterLighth = 1;

a1=[]; a2=[];
% from the begining
startT = lp.TTLEvents(1,1);
startTindx = find(lp.t < startT);


if length(startTindx) > 1
    startTindx = startTindx(end);

    w=0:lp.bgWin:startT;

    [a1,b]=hist(lp.t(1:startTindx), w);

    a1=a1/lp.bgWin;

end


endT = lp.TTLEvents(2,end) + 0.5;
endT = find(lp.t > endT);

if length(endT > 1)
    endT = endT(1);

    w=startT:lp.bgWin:lp.t(end);

    [a2,b]=hist(lp.t(endT:end), w);

    a2=a2/lp.bgWin;
end

p=-1;
if length(a1) > 0 & length(a2) > 0
    [h,p]=ttest2(a1,a2);
    lp.pValBeforeAndAfterLighth = p;
end

disp(['testing if the bg fr differ before light start and after light ends ' num2str(p)])

disp('')
if length(a1) < 30 || length(a2) < 30
        disp('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!')
        warning('There are not enough events in the pre and post light events')
        disp('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!')
end
disp(['-> Number of events before and after light events: ' num2str(length(a1)) ' , ' num2str(length(a2))])
disp([' mean before and mean after: ' num2str(mean(a1)) ' , ' num2str(mean(a2))])

bgFrDist = [a1 a2];

