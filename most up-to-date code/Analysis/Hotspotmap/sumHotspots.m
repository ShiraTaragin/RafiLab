
res=[];


x=reshape(lp.lightSpikesFRnew, lp.dims(2), lp.dims(1));
hmapOn=x';
x=reshape(lp.nonLightSpikes_allNew, lp.dims(2), lp.dims(1));
hmapOff=x';



outBoundery = [1 1 7 7 ]; %[3 3 6 5];
innerBoundery = [ 4 4 5 4];

innerOn = hmapOn(innerBoundery(1):innerBoundery(3),innerBoundery(2):innerBoundery(4));
innerOff = hmapOff(innerBoundery(1):innerBoundery(3),innerBoundery(2):innerBoundery(4));

res = (mean(innerOn(:))-mean(innerOff(:)));
for i=1:3
    

    outerOn = hmapOn(outBoundery(1):outBoundery(3),outBoundery(2):outBoundery(4));
    outerOff = hmapOff(outBoundery(1):outBoundery(3),outBoundery(2):outBoundery(4));


    res(end+1) = [ (mean(outerOn(:))-mean(outerOff(:))) ];
    outBoundery = outBoundery + [ 1 1 -1 -1];
end