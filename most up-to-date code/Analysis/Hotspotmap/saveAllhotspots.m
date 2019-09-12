function saveAllhotspots(lpall)
% analyze phase response of all neurons

AIdirPath = 'C:\Users\DELL\Google Drive\Papers\My papers\Lateral inhibition\Figures\';
AIdirName = 'hotspotFigs\';

fighandle = figure;
for i=1:length(lpall)
    i

    lp = lpall(i).lp;
    
    
    figure(fighandle);
    subplot(3,4,mod(i-1,12)+1)
    lp.allSpots = 'allSpots'; 
    scanHotSpotMap(lp, 1, fighandle);
    
    title(num2str(i))

    if mod(i,12) == 0

        pause(3)

        saveAIfigure(AIdirPath, AIdirName, num2str(i), [], [])
        fighandle = figure;
    end
    
    

end
