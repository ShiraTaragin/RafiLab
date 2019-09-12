function res = MitralOrTufted(phaseStatNull, mtRange)

    % remove not clear phase lock if we want TC or MC
    if isempty(phaseStatNull) 
        res = 'unknown';
        return;
    end

    % neuron is not loacked to sniffing
    if phaseStatNull.maxPsth - phaseStatNull.minPsth < 3
        res = 'unknown';
        return;
    end

    if  (phaseStatNull.psthPhase*360 > mtRange(1) & phaseStatNull.psthPhase*360 < mtRange(2))
        res = 'MC';
        return;
    end

    if phaseStatNull.psthPhase*360 <= mtRange(1) | phaseStatNull.psthPhase*360 >= mtRange(2)
        res = 'TC';
        return;
    end
end