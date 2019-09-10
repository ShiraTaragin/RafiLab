function tf = checkPixelRes(lp)
if isfield(lp,'pixelRes')
    tf = lp.pixelRes;
else
    tf = 0;
end
