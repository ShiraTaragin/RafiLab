
%%
load m;  %original 24x100 matrix
m(find(m < 0)) = 0;  % remove inhibition 

% sort
[a,b]=sort(sum(m));
m=m(:,b);
[a,b]=sort(sum(m'));
m=m(b,:);

figure; imagesc(m)
[R,P]=corrcoef(m);
figure; imagesc(R)

title(['mean correlation: ' num2str(mean(mean(R)))])
%%
rMax = 165; sigma = 12;
for i=1:size(m,1)
    odorRes = m(i,:);
    s = 10.63/190*sum(odorRes);
    
    newOdorRes = rMax*(odorRes.^1.5./(odorRes.^1.5 + sigma^1.5 + s^1.5));
    m(i,:) = newOdorRes;
end

figure; imagesc(m)

[R,P]=corrcoef(m);

figure; imagesc(R)
title(['mean correlation: ' num2str(mean(mean(R)))])
