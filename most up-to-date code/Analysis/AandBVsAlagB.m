function [facilPer, dtCounter, totalCases] = AandBVsAlagB(allTpa, recordingArea, calcType)
% calculate the number of case/neurons we see depression of AB and BA
% relative to A&B


if nargin < 3
    calcType='exc';
end


facil=[];;
%maxDt=4;

dtCounter = zeros(1,50);
totalCases=zeros(1,50);
tpaCount=0;

for i=1:length(allTpa)
    tpa=allTpa{i};
    
    % ignore non relvent brain area
    if strcmp(tpa.recordingArea, recordingArea) == 0
        continue;
    end
    
    
    tpaCount= tpaCount +1;

    % ignore too long dt cases
%     if tpa.lp.deltaTrange(end) > maxDt
%         continue
%     end
    
    
    % count the number of dt we have
    totalCases(tpa.lp.deltaTrange) = totalCases(tpa.lp.deltaTrange) + 1;  % positive dt's
    totalCases(tpa.lp.deltaTrange) = totalCases(tpa.lp.deltaTrange) + 1;  % negative dt's
    
    
    for dt=[tpa.lp.deltaTrange -tpa.lp.deltaTrange];                
        % A&B > A->B and B->A
    
        if strcmp(calcType, 'exc')
            [h,p1]=ttest2(tpa.trialM_all40{tpaDtIndx2ArrayIndx(tpa, dt)}, tpa.trialM_all40{tpaDtIndx2ArrayIndx(tpa, 0)}, 0.05, 'Left');
            
            if p1<0.025 
                dtCounter(abs(dt)) = dtCounter(abs(dt)) + 1;  % we add one due to dt =0
            end
        end        
        if strcmp(calcType, 'inh')
            [h,p1]=ttest2(tpa.trialM_all40{tpaDtIndx2ArrayIndx(tpa, dt)}, tpa.trialM_all40{tpaDtIndx2ArrayIndx(tpa, 0)}, 0.05, 'Right');
            if p1 < 0.05
                if abs(dt) == 6
                    dt;
                end
                dtCounter(abs(dt)) = dtCounter(abs(dt)) + 1;  % we add one due to dt =0
            end
        end                
    end    
end
totalCases

facilPer=dtCounter(1:5)./[ totalCases(1:5)];


