function [t,wvNLX,rc] = DetectThreshold(lp, t,v,thresh)

EXTENDED_SPIKE_AFTER=4;  %8 samples after
EXTENDED_SPIKE_BEFORE=12;  % 4 samples before
rc=0;
tv_size = [size(t) size(v)];
wvNLX=[];

if size(t,1) > 1
    t = t';
end
if size(v,1) > 1
    v = v';
end

% zero very high - non spike - events
%v(find(v > thresh(2))) = 0;

% find the index of spikes above threshold keep them in {indx}
Y = v-thresh(1);
Y2 = [-5 Y(1:end-1)];
S = Y.*Y2;
indx = find(S<0 & Y2<0);
indx_size = size(indx);
if isempty(indx)
    t=[];
    return
end
% ignore first spike if it too close to the begining
while indx(1) < 32/4+EXTENDED_SPIKE_BEFORE
    warning('Spike started in previous block - ignoring this spike')
    indx(1)=[];
end

% now extract the spikes with 32 points (or more)
t = t(indx);
wvNLX = zeros(length(indx),32+EXTENDED_SPIKE_AFTER+EXTENDED_SPIKE_BEFORE);

if indx(end) + 3/4*32+EXTENDED_SPIKE_AFTER  > length(v)  % the spike is partly in the next reading chunck
    rc = -1;
    return
end

for i = 1:length(indx);
    wv_ind = 1:(32+EXTENDED_SPIKE_AFTER+EXTENDED_SPIKE_BEFORE);
    wv_ind = wv_ind-wv_ind(1/4*32+EXTENDED_SPIKE_BEFORE);

    % find the max point
     [a,b] = max(v(indx(i):indx(i)+18)); % the max must be very close to the th
     indx(i) = indx(i) + b;
     t(i) = t(i) + (b-1)/lp.sampleRate;

    if indx(i)+3/4*32+EXTENDED_SPIKE_AFTER  > length(v)  % the spike is partly in the next reading chunck
        rc = -1;
        return
    end
    
    wvNLX(i,:) = v(indx(i)+wv_ind);
    end
end






