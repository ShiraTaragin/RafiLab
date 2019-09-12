


%%

disp('^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^')
odorIds = [ 22 34];

osn = carlson(odorIds,:);

[pn] = applyInh(prs, (osn), 'rafia');
[pnSum] = applyInh(prs, sum(osn), 'rafia');

%
disp('corr osn to osn sum')
[r01,p]=corrcoef(osn(1,:), sum(osn));
[r02,p]=corrcoef(osn(2,:), sum(osn));
[r01(1,2) r02(1,2)]

% %
% disp('corr pn sum to osn')
% [r1,p]=corrcoef(pnSum, osn(1,:));
% [r2,p]=corrcoef(pnSum, osn(2,:));
% [ r1(1,2) r2(1,2)]
% 
% %
% disp(['corr pn sum to osn sum ' num2str(r(1,2))])
% [r,p]=corrcoef(pnSum, sum(osn));
% 
%
disp('corr pn sum to pn')
[r1,p]=corrcoef(pnSum, pn(1,:));
[r2,p]=corrcoef(pnSum, pn(2,:));
[ r1(1,2) r2(1,2)]