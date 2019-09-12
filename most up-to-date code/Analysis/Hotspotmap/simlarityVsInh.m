function meanrall = simlarityVsInh(prs, carlson)
inh1=0; inh2=0;
rall=[]; meanrall=[];
mFactorRange = [ 0  0.01 0.05 0.1 0.2 0.3 0.4 0.5 1 ]/(prs.n/prs.GloNum);
for mfactor = mFactorRange
    rall=[];
    for i=1:100
        pr = randperm(size(carlson,1));
        a = carlson(pr(1),:);
        b = carlson(pr(2),:);

        d1 = pdist([a;b], prs.method);

        % non-linear transform
        inh1 =sum(a)*mfactor; 
        inh2 =sum(b)*mfactor;
        [a1 w1] = hf(prs.Rmax, a, prs.sigma, inh1);
        [b1 w2] = hf(prs.Rmax, b, prs.sigma, inh2);

        d2 = pdist([a1;b1], prs.method);

        %rall(end+1,:) = [r1(1,2) - r2(1,2) ];
        rall(end+1,:) = [d2-d1 w1 w2 ];
    end
    meanrall(end+1,:) = mean(rall);
end

