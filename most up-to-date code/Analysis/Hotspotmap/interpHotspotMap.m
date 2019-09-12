
function interpMap = interpHotspotMap(lp, STAfinal)
%%

if nargin > 1
    lp.dims = size(STAfinal);
    lp.map = STAfinal;
end

map=STAfinal; %lp.map;

[X,Y] = meshgrid(1:lp.dims(1),1:lp.dims(2));

[X2,Y2] = meshgrid(1:0.1:lp.dims(1),1:0.1:lp.dims(2));

interpMap = interp2(X,Y,map',X2,Y2)';
plotSTA(lp,interpMap)

end
% 
% if isfield(lp,'pixelRes') & isequal(lp.pixelRes,1)
%     xRange = [lp.Bounderies(1)-lp.stimuliSize :lp.Bounderies(3)+lp.stimuliSize];
%     yRange = [lp.Bounderies(2)-lp.stimuliSize :lp.Bounderies(4)+lp.stimuliSize];
%     imagesc(xRange, yRange, interpMap)
%     colorbar
% else
% imagesc(lp.xRange, lp.yRange, interpMap)
% colorbar

%title([num2str(lp.fileIndx) '_' num2str(lp.mClusterIndx(1))])