%% look at the effect each model have on the odor responses
prs.modelType = 'rafic';
odor1 = 45; 
odor2 = 46;
% original correlation
mat = carlsonNoRandom;
%mat(odor2,1:11) = mat(odor1,1:11);

[dBefore]=pdist(mat([odor1 odor2],:), prs.method);

[newOdor1, inhInp1] =applyInhOn1Odor(prs, mat, odor1);
[newOdor2, inhInp2] =applyInhOn1Odor(prs, mat, odor2);
%

disp(['--------------------  ' prs.modelType '   ---------------' ])
disp(['mean inh for odor ' num2str(odor1) ' and ' num2str(odor2) '  ' num2str([mean(inhInp1) mean(inhInp2)])])
[dAfter]=pdist([newOdor1; newOdor2], prs.method);

disp(['cosine between the odors before and after inh ' num2str([dBefore dAfter])])

%%
figure;
bar(inhInp1-inhInp2)

%%
% oldOdor1 = reshape(mat(odor1,:), prs.dims(2), prs.dims(1));
% oldOdor2 = reshape(mat(odor2,:), prs.dims(2), prs.dims(1));
figure
% subplot(3,1,1)
% bar(mat([odor1 odor2],1:50)')
% 
% bar(diff(mat([odor1 odor2],1:50)))
% 
% newOdor1 = reshape(newOdor1, prs.dims(2), prs.dims(1));
% newOdor2 = reshape(newOdor2, prs.dims(2), prs.dims(1));

% subplot(3,1,2)
% bar(diff([newOdor1(1:50); newOdor2(1:50)]))
% subplot(3,1,3)
bar([diff(mat([odor1 odor2],1:50)); diff([newOdor1(1:50); newOdor2(1:50)])]')
title(['change in odor response before and after ' num2str([odor1 odor2]) ' model ' prs.modelType])
colormap gray
box off
%%
AIdirName = 'Figure 6_2\';
saveAIfigure(AIdirPath, AIdirName, '2 odor change wilson', [0:10:50], [-100:50:100])

%%
figure;
bar(diff([inhInp1; inhInp2]))
box off
%%
AIdirName = 'Figure 6_2\';
saveAIfigure(AIdirPath, AIdirName, '2 odor inh diff', [0:400:1150], [-100:100:100])

set(gca,'tickdir','out','ticklength',get(gca,'ticklength')*2);

