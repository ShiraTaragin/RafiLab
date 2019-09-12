function m = responsePerAvg(m)
%109X1200 is mUpdated
m(find(m==0)) = 1;
for i=1:size(m,1)
    mn = mean(m(i,:));
    if mn == 0
        mn
    end
    
    m(i,:) = m(i,:)./mn;
end


