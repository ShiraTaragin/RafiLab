% new simulation

% g number of of glo  
% m number of mt cells per glo
% t time steps for the analysis. it include inh + exh

% wMat is the matrix of the inhibitory connection between every two
% neurons. it is g x g x m matirx. two mt cells from the same glo can have
% different inhibition maps

% nStat is the matrix with the status of each neuron over time
% it is g x m x t 

n = 100;  % glo
mt = 3;    % mt per glo
t = 100;  % time steps

nStatus = zeros(n, mt, t);  % neurons status
w = -8:0.5:3;   % distribution of inhibition strength. should be replaced by a geometric distribution

param = initParam(w);

wMat = buildWeightMap(n, mt, w);


%%

%% build the wight maps between all neurons

function wMat = buildWeightMap(n, mt, w)

wMat = zeros(n, n, mt);
connRatioAll=[];
for j=1:mt
    for i=1:n
        % randomly select the connection ratio from the distributoin: param.numOfInhSpots
        p = randperm(length(param.numOfInhSpots));
        numOfInhSpots = param.numOfInhSpots(p(1));
        connRatioAll(end+1) = numOfInhSpots;

        % update the ith neuron connection weights mat up to the distance of: param.inhDistance
        while numOfInhSpots > 0
            y = randperm(n); y=y(1);
            if abs(i-y) < param.inhDistance | (n - abs(y-i)) < param.inhDistance  % we take into account the OB 2 diemnsional structure
                wMat(i,y, j) = w(randi(length(w), 1,1));
                numOfInhSpots = numOfInhSpots - 1;
            else
                continue;
            end
        end
        % the diaganol is 0
        for i=1:n, wMat(i,i,j)=0; end
    end
end
actualConnRatio = length(find(wMat ~=0))/(n^2);
