function [mOdorsUpdated, sall, odorBeforeAfter, input_output ]= applyInh(prs, mOdors)
%%  Set up spon spikes in each mt cell
% Calculate the effect of inhibition on fr
% inhOn states that we need to take into account the lateral inhibiton,
% gainContrl - to add the gain contorl parameter
% otherwise we only apply the OSN to MT transformation function
w=[]; sall=[];
mOdorsUpdated=[];odorBeforeAfter=[];
if strcmp(prs.modelType, 'orn')
    mOdorsUpdated = mOdors;
    return;
end


sall=[];
input_output=[];
% loop over all odors
for i=1:size(mOdors,1)    

    % loop over all neurons
    [newOdor, sval, odorBeforeAfter(end+1,:), input_output1] = applyInhOn1Odor(prs, mOdors, i);
    input_output = [ input_output; input_output1];

    sall = [ sall sval];
    
    mOdorsUpdated(i, :) = newOdor;
    
end

