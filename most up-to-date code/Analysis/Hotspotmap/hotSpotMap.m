
plotFlag=4;

switch lp.scriptType
    case {'STA STIMULI', 'STA WHITE NOISE', 'STA RANDOM SPOTS','STA_RANDOM_SPOTS_ISI0','STA_RANDOM_SPOTS_ISI'}
        [STAevents, STAfinal, obGuess,lp] = staHotSpot_Shira(lp);
        
        

%         subplot(2,2,3)
%         scatter(STAfinal1(:), STAfinal2(:))

    case {'SIMULTAN STIMULI'}
        xValue = 1:3;
        paramHotSpot
    case {'INTENSITY STIMULI'}
        paramHotSpot
    case {'INTENSITY STIMULI N'}
        paramHotSpot
    case {'MANY STIMULI'}       
        xValue = 1:lp.stimuliListSize;   
        % sort the spots according to increasing order
        for ii=1:size(lp.eventsLog,1)
            if strcmp(lp.sortFlag, 'location') 
                x = lp.eventsLog(ii,1:lp.stimuliNum*2);
                y = sortrows((reshape(x,2,length(x)/2))')';
                y = fliplr(y);
                lp.eventsLog(ii,1:lp.stimuliNum*2) = y(:)';
            end
            if strcmp(lp.sortFlag, 'distance') % ohow clusterred the spots are
                x = lp.eventsLog(ii,1:lp.stimuliNum*2);
                y = (reshape(x,2,length(x)/2))';
                y = pdist(y);
                lp.eventsLog(ii,1) = y;
            end
        end
        
        paramHotSpot
    case {'TEMPORAL STIMULI'}       
        temporalHotSpot        
    case {'TEMPORAL STIMULI 4','TEMPORAL STIMULI 4 FAST AND SIMUL', 'DYNAMIC OVERLAP ALL PAIRS'}       
        temporalOverlapHotSpot2
    case {'TEMPORAL OVERLAP STIMULI', 'TEMPORAL OVERLAP STIMULI FIXED TIME'}
        temporalOverlapHotSpot2        
    case {'MANY STIMULI WITH CONTROL'}
        paramHotSpot
    
    case {'DURATION STIMULI'}
        paramHotSpot
    case {'SEQUENCE BULB SCANNING','SEQUENCE CENTER BULB SCANNING'}
        if isfield(lp,'pTh')== 0
            lp.pTh = 0.05;
        end
            lp = scanHotSpotMap_Shira(lp, plotFlag);
    case {'SPECIFIC PATTERN'}
        specificPattern(lp);
    case {'SPECIFIC_PATTERN_PERMUTATION','SPECIFIC_PATTERN_SEQUENCE'}
%         if isfield(lp,'valveNum')% analysze odor + light.
%             odorLightAnalysis(lp);
%         else
            [lp, data] = permAnalysis_Shira(lp);
%         end
    case {'ODOR_LIGHT_STIM'}
        odorLightAnalysis(lp);
        
    otherwise
            disp(['no appropriate script for this type of run: ' lp.scriptType])
        return;
end


