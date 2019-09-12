function [res] = sharedInhExcMap(pval1, pval2)
%% compute how many inhibiton spots are shared in two maps
% res(1) amount of inh overlap 
% res(2) amount of exc overlap

pval1e=pval1;
pval2e=pval2;

pval1e(find(pval1e == 2)) = 0;
pval2e(find(pval2e == 2)) = 0;

pvalIntersectExc = length(find((pval1e.*pval2e) > 0));

pval1(find(pval1 == 1)) = 0;
pval2(find(pval2 == 1)) = 0;

pvalIntersectInh = length(find((pval1.*pval2) > 0));


res = [pvalIntersectInh pvalIntersectExc];


