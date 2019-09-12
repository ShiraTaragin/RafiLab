function [odorMat , newOdorVec] = showOdor(prs,mat, odorIndx, plotFlag)
% plot in 2D one of the odor in the carlson matrix after orgenizing it in
% 2d
odorMat=[];
odorVec = mat(odorIndx, :);

odorMat = reshape(odorVec, prs.dims(2), prs.dims(1));

if plotFlag
    figure;
    imagesc(odorMat)
    title(num2str(odorIndx));
end

% % reshape to have glomeruli clusters more packed
% odorMat = reshape(odorVec, prs.dims(2)/2, prs.dims(1)*2);
% odorMat = [odorMat(:,1:prs.dims(1)) ; odorMat(:,prs.dims(1)+1:end)];
% 
% if plotFlag
%     figure;
%     imagesc(odorMat)
% end
% 
newOdorVec = odorMat(:)';




