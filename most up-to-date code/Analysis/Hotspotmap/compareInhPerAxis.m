function [f] = compareInhPerAxis(res, numOfRows)
%% compare inh per axis
% bin the matrix into n bins
f=[];

for i=1:size(res,2)
    
    vals=res(i).vals;
    if size(vals,1) < numOfRows 
        continue;     
    end

    f(:,i) = reshapeVector(vals(:,1), numOfRows)./vals(1,3);

%     mid = round(size(vals,1)/2);
%     mid1 = round((mid+1)/2);
%     mid2 = round((mid+size(vals,1))/2); 
% 
%     f(1,i) = [vals(1,Indx)/vals(1,3)];
%     f(2,i) = [ vals(mid1,Indx)/vals(mid1,3)];
%     
%     f(3,i)=[ vals(mid,Indx)/vals(mid,3)];
%     
%     f(4,i) = [ vals(mid2,Indx)/vals(mid2,3)];    
% 
%     f(5,i)=[ mean(vals(end-1:end,Indx))/vals(end,3)];

end
f=f*100;


