

maxTime = [];

for ii=1:size(alltpAll,2)
    maxTime(end+1) = alltpAll(ii).maxTime;
end

maxTime = reshape(maxTime, lp.dims(2),lp.dims(1))'
figure;
imagesc(maxTime);