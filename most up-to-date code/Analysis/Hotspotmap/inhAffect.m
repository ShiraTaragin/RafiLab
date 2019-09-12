function [R12 sall] = inhAffect(prs, carlson, iter, type1, rng)

R12=[];
sall=[];


cc=0; 
prsOrg = prs;
for i = rng
    cc=cc+1;
    i
    res=[];      
    for rep=1:iter
        rep
        if type1 == 1
            prs.inhMean = i
        end
        if type1 == 0
            prs.maxInhDist = i;
        end
        
        if type1 == 2
            prs.m = prsOrg.m*i;
            prs.modelType = 'wilson';
        end
        
        if type1 < 2
            prs.wMat = buildWeightMap(prs);
        end
        [mUpdated sval] = applyInh(prs, carlson);

%         [R2,P]=corrcoef(mUpdated);
%         R2(isnan(R2)) = 1;

        d=[];
        d(1) = mymean(pdist(mUpdated, prs.method)); % odor similarity
        d(2) = mymean(pdist(mUpdated', prs.method)); % glo similarity
        
        d(3) = [mean(mymean(mUpdated')) ];   % mean firing rate across all odors and neurons
        d(4) = length(find(mUpdated < 1));   % number of no responses (e.g below 1 spikes/sec)
        res(end+1,:) = d;
        
    end  
    sall(end+1,:) = mean(sval);
    R12(end+1,:) = [mean(res) std(res)]
end
