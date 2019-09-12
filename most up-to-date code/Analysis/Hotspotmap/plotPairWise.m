function rAll = plotPairWise(carlson, mUpdated, method)
rAll=[];

d1 = pdist(carlson, method);

d2 = pdist(mUpdated, method);


rAll = [d1; d2]';
return

for i=1:size(carlson,1)
    for j=i+1:size(carlson,1)
                
        r1 = pdist([carlson(i,:); carlson(j,:)],method);
        r2 = pdist([mUpdated(i,:); mUpdated(j,:)],method);
        rAll(end+1,:) = [r1, r2, i j];
    end
end
    