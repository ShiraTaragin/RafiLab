function estimateWeakConnectivity( exp, th)
% extmaite how many weak inhibtory connection exists
% we do this by computing how many spots caused a reduction in fr in the
% case we have global inhibition and when we dont

%exp = exInCountOmp;

[a,b]=hist(exp(:,13)');
plot(b,a)

indx = find(exp(:,4)  > th);
hold all;
% [a,b]=hist(exp(indx,13)');
% plot(b,a,'r')
[length(find(exp(indx,13) < 0.5)) length(find(exp(indx,13) > 0.5))]

% plot([0.5 0.5],[0 30],'k')

% dist1=[]; dist2=[];
% for i=1:size(exp,1)
%     pNoExc = exp(i,4)
%     if pNoExc < th
%         dist1(end+1) = exp(i,13);
%     else
%         dist2(end+1) = exp(i,13);
%     end
% end
% 
% figure
% [a,b]=hist(dist1);
% plot(b,a,'b')
% hold all
% [a,b]=hist(dist2);
% plot(b,a,'r')
% 
% legend('global inhibition p < th', 'no global inhibtion p>th' )