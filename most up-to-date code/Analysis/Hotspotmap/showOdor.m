function [odorMat , newOdorVec] = showOdor(prs,mat, odorIndx, plotFlag)
% plot in 2D one of the odor in the carlson matrix after orgenizing it in
% 2d
odorMat=[];
odorVec = mat(odorIndx, :);

odorMat = reshape(odorVec, prs.dims(1), prs.dims(2));

if plotFlag
    figure;
    imagesc(odorMat)
    title(num2str(odorIndx))
end

newOdorVec = odorMat(:)';




