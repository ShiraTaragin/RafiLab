function [lp] = permAnalysis(lp1, lp2)
% classify each patterns as  a specific type.
% for n spots, we get 2^n -1 types.


% 11/06/2019 update - psth is superimposed on pattern
lp = lp1;
%%%%%%%%%%%%% specific pattern with permutations %%%%%%%%%%%%%
if lp.perm == 1;
    types.num = [];types.order = {}; types.count = [];
    for i = 1:size(lp.eventsLog,1)
        v = find(lp.eventsLog(i,:));
        if isempty(types.order)
            types.order{1} = v;
            types.num = 1;
            types.count = 1;
        else
            for ii = 1:length(types.order)
                if length(types.order{ii})==length(v)&types.order{ii}==v
                    types.count(ii) = types.count(ii) + 1;
                    break
                end
                if ii == length(types.order)
                    types.order{end + 1} = v;
                    types.num(end + 1) = types.num(end) + 1;
                    types.count(end+1) = 1;
                end
            end
        end
    end
    %%
    % find indexs for each pattern.
    indx = [];types.indx = {};
    for j = 1:length(types.num)
        for k = 1:size(lp.eventsLog,1)
            vv = find(lp.eventsLog(k,:));
            if length(vv)==length(types.order{j}) & types.order{j} == vv
                indx = [indx k];
            end
        end
        types.indx{j} = indx;
        indx = [];
    end
    %%
    BG_RANGE = 400;  % how many ms before light we consider as bg
    LIGHT_RANGE = 500; % how many ms after light off we take into the calculation of fr
    ptrSpikeDataAll=[];
    
    resFr = zeros(length(types.indx{1}),length(types.indx));
    resBg = zeros(length(types.indx{1}),length(types.indx));
    
    for kk = 1:length(types.indx)% run over all 2^n - 1 patterns.
        cc = 0;
        ptrSpikeData=[];
        for i = types.indx{kk}%run over the index belong to each pattern.
            cc = cc +1;
            ev = lp.TTLEvents(:,i);
            spikeTbefore = lp.t(find(lp.t < ev(1) & lp.t > (ev(1) - BG_RANGE/1000))) - ev(1);
            % %             spikeTafter = lp.t(find(lp.t > ev(1) & lp.t < (ev(1) + LIGHT_RANGE/1000)))  - ev(1);
            
            spikeTafter2 = lp.t(find(lp.t > ev(1) & lp.t < (ev(2) + LIGHT_RANGE/1000)))  - ev(1);
            
            ptrSpikeData(cc).times = [spikeTbefore spikeTafter2];
            
            spikeTbeforeFR = length(spikeTbefore)/(LIGHT_RANGE/1000);
            spikeTafterFR = length(spikeTafter2)/(LIGHT_RANGE/1000);
            
            resFr(cc,kk) = spikeTafterFR;
            resBg(cc,kk) = spikeTbeforeFR;
            
        end
        ptrSpikeDataAll(end+1).ptrSpikeData = ptrSpikeData;
    end
    
    
    %%%%%%%%%%% plot %%%%%%%%%%%%%%
    
    figure;
    meanFR = mean(resFr);
    meanBG = mean(resBg);
    
    %sort the patterns.
    a = [];
    for i = 1:length(types.indx)
        a(i) = length(types.order{i});
    end
    [~,indx] = sort(a);
%     switch length(types.indx)
%         case 1
%             numfig = [1,2];
%         case 3
%             numfig = [2,2];
%         case 7
%             numfig = [3,3];
%         case 15
%             numfig = [4,4];
%         otherwise
%             numfig = [4,4];
%     end
numfig = [1,2];
    
    
    
    % plot the PSTH and raster plot for each pattern.
    c = 0;
    lp.buffer = 2;% to remove
    response = [];
    
    for i = 1:length(types.indx)
        
        % Build pattern matrix
        mat = zeros(length(lp.yRange),length(lp.xRange));
        mat(types.order{indx(i)}) = 1;
        
        % Display pattern matrix
        a = subplot(numfig(1),numfig(2),i);
        a1_pos = get(a,'Position');
        m = imagesc(mat);
%         hold on
        set(a,'XAxisLocation','top','YAxisLocation','right',...
            'XColor','b','YColor','b')
        set(m,'AlphaData',0.3);
        
        % Build and display raster plot
        a2 = axes('Position',a1_pos);
        [p,meanLightFR,R, t] = plotRasterPsthFromStruct_ptrn(ptrSpikeDataAll(indx(i)).ptrSpikeData);
        set(a2,'color','none')
        title([num2str(lp.fileIndx) '_' num2str(lp.mClusterIndx) ' pattern # ' num2str(indx(i)) ' p: ' num2str(p) ', ISI: ' num2str(lp.ISI) ' Sec'])
        
        % Stimulus patch
        p=patch([0 lp.stimuliDuration lp.stimuliDuration 0],[0 0 max(meanFR) max(meanFR)],'b');
        set(p,'FaceAlpha',0.3);
        hold off;
        
        % Update struct
        lp.rPSTH = R;lp.tPSTH = t;lp.p = p;
        response(indx(i)) = meanLightFR;
   
    end

end
    lp = lp2;
%%%%%%%%%%%%% specific pattern with permutations %%%%%%%%%%%%%
if lp.perm == 1;
    types.num = [];types.order = {}; types.count = [];
    for i = 1:size(lp.eventsLog,1)
        v = find(lp.eventsLog(i,:));
        if isempty(types.order)
            types.order{1} = v;
            types.num = 1;
            types.count = 1;
        else
            for ii = 1:length(types.order)
                if length(types.order{ii})==length(v)&types.order{ii}==v
                    types.count(ii) = types.count(ii) + 1;
                    break
                end
                if ii == length(types.order)
                    types.order{end + 1} = v;
                    types.num(end + 1) = types.num(end) + 1;
                    types.count(end+1) = 1;
                end
            end
        end
    end
    %%
    % find indexs for each pattern.
    indx = [];types.indx = {};
    for j = 1:length(types.num)
        for k = 1:size(lp.eventsLog,1)
            vv = find(lp.eventsLog(k,:));
            if length(vv)==length(types.order{j}) & types.order{j} == vv
                indx = [indx k];
            end
        end
        types.indx{j} = indx;
        indx = [];
    end
    %%
    BG_RANGE = 400;  % how many ms before light we consider as bg
    LIGHT_RANGE = 500; % how many ms after light off we take into the calculation of fr
    ptrSpikeDataAll=[];
    
    resFr = zeros(length(types.indx{1}),length(types.indx));
    resBg = zeros(length(types.indx{1}),length(types.indx));
    
    for kk = 1:length(types.indx)% run over all 2^n - 1 patterns.
        cc = 0;
        ptrSpikeData=[];
        for i = types.indx{kk}%run over the index belong to each pattern.
            cc = cc +1;
            ev = lp.TTLEvents(:,i);
            spikeTbefore = lp.t(find(lp.t < ev(1) & lp.t > (ev(1) - BG_RANGE/1000))) - ev(1);
            % %             spikeTafter = lp.t(find(lp.t > ev(1) & lp.t < (ev(1) + LIGHT_RANGE/1000)))  - ev(1);
            
            spikeTafter2 = lp.t(find(lp.t > ev(1) & lp.t < (ev(2) + LIGHT_RANGE/1000)))  - ev(1);
            
            ptrSpikeData(cc).times = [spikeTbefore spikeTafter2];
            
            spikeTbeforeFR = length(spikeTbefore)/(LIGHT_RANGE/1000);
            spikeTafterFR = length(spikeTafter2)/(LIGHT_RANGE/1000);
            
            resFr(cc,kk) = spikeTafterFR;
            resBg(cc,kk) = spikeTbeforeFR;
            
        end
        ptrSpikeDataAll(end+1).ptrSpikeData = ptrSpikeData;
    end
    
    
    %%%%%%%%%%% plot %%%%%%%%%%%%%%
    
    meanFR = mean(resFr);
    meanBG = mean(resBg);
    
    %sort the patterns.
    a = [];
    for i = 1:length(types.indx)
        a(i) = length(types.order{i});
    end
    [~,indx] = sort(a);

    
    
    % plot the PSTH and raster plot for each pattern.
    c = 0;
    lp.buffer = 2;% to remove
    response = [];
    
    for i = 1:length(types.indx)
        
        % Build pattern matrix
        mat = zeros(length(lp.yRange),length(lp.xRange));
        mat(types.order{indx(i)}) = 1;
        
        % Display pattern matrix
        a = subplot(numfig(1),numfig(2),2);
        a1_pos = get(a,'Position');
        m = imagesc(mat);
%         hold on
        set(a,'XAxisLocation','top','YAxisLocation','right',...
            'XColor','b','YColor','b')
        set(m,'AlphaData',0.3);
        
        % Build and display raster plot
        a2 = axes('Position',a1_pos);
        [p,meanLightFR,R, t] = plotRasterPsthFromStruct_ptrn(ptrSpikeDataAll(indx(i)).ptrSpikeData);
        set(a2,'color','none')
        title([num2str(lp.fileIndx) '_' num2str(lp.mClusterIndx) ' pattern # ' num2str(indx(i)) ' p: ' num2str(p) ', ISI: ' num2str(lp.ISI) ' Sec'])
        
        % Stimulus patch
        p=patch([0 lp.stimuliDuration lp.stimuliDuration 0],[0 0 max(meanFR) max(meanFR)],'b');
        set(p,'FaceAlpha',0.3);
        hold off;
        
        % Update struct
        lp.rPSTH = R;lp.tPSTH = t;lp.p = p;
        response(indx(i)) = meanLightFR;
   
    end
    
%     %%"STA"%%
%     sta = zeros(length(lp.yRange),length(lp.xRange));
%     for i = 1:length(types.order)
%         mat = zeros(size(sta));
%         mat(types.order{i}) = 1;
%         sta = sta + (mat .* response(i));
%     end
%     sta = sta/sum(response);
%     subplot(numfig(1),numfig(2),length(types.indx) + 1)
%     imagesc(lp.xRange, lp.yRange, sta);colorbar
%     title('"STA"')
    
    
    
else
    specificPattern(lp)
end




