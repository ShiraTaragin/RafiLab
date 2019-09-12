

% set basic parameters
%lp = initLightParam(exp,  fileIndx,  1); 


% read eventfile, TTL and Spike data (the threshold used will be kept in lp
lp = readLpData(exp, lp,[.1 4], 0);