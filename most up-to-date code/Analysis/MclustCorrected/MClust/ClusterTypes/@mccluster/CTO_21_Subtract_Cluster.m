function [MCC, redraw, rekey, undoable] = SubtractCluster(MCC, varargin)

% f = SubtractCluster(MCC, varargin)
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

subSet = inputdlg(['Subtract Cluster: ']);
if isempty(subSet), return, end
subSet = str2num(subSet{1}); %#ok<ST2NM>

fLog = false(nS,1); fLog(f) = true;
fLog(FindInCluster(MClust_Clusters{subSet})) = false;
fnew = find(fLog);

MCC.recalc = 1;
MCC.myOrigPoints = fnew;
