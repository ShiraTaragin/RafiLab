function [MCC, redraw, rekey, undoable] = AddCluster(MCC, varargin)

% f = AddCluster(MCC, varargin)
%
% INPUTS
%     MCC - a MCCluster
% needs xdim, ydim, drawingAxis from parent
%
% OUTPUTS
%     MCC - The updated cluster
%
% 
% ncst 26 Nov 02
% ADR 2008
%

redraw= true; rekey = false; undoable = true;

global MClust_CurrentFeatureData
global MClust_Clusters MClust_FeatureTimestamps
    
nS = length(MClust_FeatureTimestamps);

extract_varargin;

f = MCC.myOrigPoints;

addSet = inputdlg(['Add all points from cluster: ']);
if isempty(addSet), return, end
addSet = str2num(addSet{1}); %#ok<ST2NM>

fLog = false(nS,1); fLog(f) = true;
fLog(FindInCluster(MClust_Clusters{addSet})) = true;
fnew = find(fLog);

MCC.recalc = 1;
MCC.myOrigPoints = fnew;
