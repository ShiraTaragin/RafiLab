function [res] = inhPerAxis(lpall, MOUSE_TYPE, MAX_HOTSPOT, minStimuliSize, APorLM)
% count how many inh spots in each row
% for neuron number x vals summerize each row stat
% res(x).vals(i,1) is the number of inh spots in row i
% res(x).vals(i,2) is the % of inh spots in row i
% res(x).vals(i,3) is the number of spots in row i
%[res] = inhPerAxis(lpall, 'OMP', 3, [1 15] 1, 1,5);
%%
removeFirstRows=0;

vals=[];
res=[];
temp=[];
for i=1:length(lpall)
    
    lp=lpall(i).lp;
    if lp.stimuliSize(1) < minStimuliSize(1) | lp.stimuliSize(1) > minStimuliSize(2)
        continue
    end
    
    vals=[];
    if strcmp(lpall(i).mouseType, MOUSE_TYPE) == 0
        continue
    end
            
    pVal = hotspotmapPvalue(lp,0.05,0);
    if length(find(pVal==1)) > MAX_HOTSPOT | length(pVal(:)) < 20
        continue;
    end    
    
    map=reshape(lp.lightSpikesFRnew, lp.dims(2), lp.dims(1))';
    bgmap=reshape(lp.nonLightSpikes_allNew, lp.dims(2), lp.dims(1))';
    
    str = [findstr('2010', lp.dirPath) findstr('2011', lp.dirPath)];
    str2 = findstr('Nov 2011', lp.dirPath);
    if ~isempty(str) & isempty(str2) % 2000 or 2011 but not november 2011
        pVal = flipud(pVal);
        map = flipud(map);
        bgmap = flipud(bgmap);
    end
    
    % ignore the cases our hotspot is posterior
%    [a,rc] = max(max(map'));
%     if length(find([92 60 58 56 52 51 44 23] == i)) > 0 %rc == size(map,1) %& i ~=60 & i~=58 & i~=56 & i~=52
%         iall(end+1) = i;
%         continue
%     end

 % if length(find([ 16   22    23    24    25    26    28    29 39    41    42    43    44    48    49    51    52    54    56    57    58    60] == i)) > 0
%     if length(find(pVal(1,:) == 2))/size(pVal,2) > 0.3
%         iall(end+1) = i;  
%             continue;
%     end
    % remove most anterior row it is biasing the result
%     if removeFirstRows & length(find(pVal(1,:) == 2)) > 1 & size(pVal,1) > 4
%         pVal([1  ],:) = [];
%         map([1  ],:) = [];
%         bgmap([1  ],:) = [];
%     end
    
    if APorLM % anterior-posterior
        for j=1:size(pVal,1)
            vals(end+1,:) = [length(find(pVal(j,:)==2)) length(find((map(j,:) - bgmap(j,:)) < 0)) size(pVal,2) size(pVal,1)];
        end        
    else  % lateral - medial
        for j=1:size(pVal,2)
            vals(end+1,:) = [length(find(pVal(:,j)==2)) length(find((map(:,j) - bgmap(:,j)) < 0)) size(pVal,1) size(pVal,2)];
        end
    end
    %temp=[temp length(find(pVal(:)==2))/(size(pVal,2)*size(pVal,1))];

    res(end+1).vals= vals;
    res(end).i= i;
end
% temp
% mean(temp)

