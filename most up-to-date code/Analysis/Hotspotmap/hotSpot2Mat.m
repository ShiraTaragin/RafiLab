
function hotspotMat = hotSpot2Mat(lp)
% convert a hotspot lp structure to .mat file with light on and light off
% info

hotspotMat=[];

hotspotMat.lighOn = reshape(lp.lightSpikesFRnew, lp.dims(2), lp.dims(1))';
hotspotMat.lighOff = reshape(lp.nonLightSpikes_allNew, lp.dims(2), lp.dims(1))';;

pValueMap= hotSpotMapPvalue(lp);
hotspotMat.pValueMap = pValueMap;

hotspotMat.fileIndx = lp.fileIndx;
hotspotMat.cluster = lp.mClusterIndx;
hotspotMat.dirPath = lp.dirPath;