function [] = AvgPartsFromFFTCSC(lp,path,range)
%%
odorLight = lp.TTLEvents(:,find(lp.lightOnOffvec==1));
odor = lp.TTLEvents(:,find(lp.lightOnOffvec==0));
light = lp.TTLEvents(:,find(lp.lightOnOffvec==2));
%% analyze Odor + Light.
figure;
all = [];
for i = 1:size(odorLight,2)
    ev = odorLight(:,i);
    [f,data] = fftLFP(path,range,[ev(1) ev(2)],10,0);
    close;
    if length(data) > size(all,2) & i>1 % to prevent unequal vectors for concatenation.
        data(size(all,2)+1:end) = [];
    elseif length(data) < size(all,2) & i>1
        data(length(data) + 1:size(all,2)) = 0;
    end
    all(end+1,:) = data';
end
if length(f) > size(all,2)% compare the length of f to dta.
    f(size(all,2)+1:end) = [];
elseif length(f) < size(all,2)
	all(:,length(f)+1:end) = [];
end

meanOdorLight = mean(all);
subplot(2,2,1)
plot(f,meanOdorLight)
xlabel('f (Hz)')
ylabel('|P1(f)|')
title(['Odor + Light, #trials: ' num2str(size(odorLight,2))])
%% analyze Odor only.

all = [];
for i = 1:size(odor,2)
    ev = odor(:,i);
    [f,data] = fftLFP(path,range,[ev(1) ev(2)],10,0);
    close;
    if length(data) > size(all,2) & i>1 % to prevent unequal vectors for concatenation.
        data(size(all,2)+1:end) = [];
    elseif length(data) < size(all,2) & i>1
        data(length(data) + 1:size(all,2)) = 0;
    end
    all(end+1,:) = data';
end

if length(f) > size(all,2)%compare the length of f to dta.
    f(size(all,2)+1:end) = [];
elseif length(f) < size(all,2)
	all(:,length(f)+1:end) = [];
end
meanOdor = mean(all);
subplot(2,2,2)
plot(f,meanOdor)
xlabel('f (Hz)')
ylabel('|P1(f)|')
title(['Odor, #trials: ' num2str(size(odorLight,2))])
%% analyze Light only.

all = [];
for i = 1:size(light,2)
    ev = light(:,i);
    [f,data] = fftLFP(path,range,[ev(1) ev(2)],10,0);
    close;
    if length(data) > size(all,2) & i>1 % to prevent unequal vectors for concatenation.
        data(size(all,2)+1:end) = [];
    elseif length(data) < size(all,2) & i>1
        data(length(data) + 1:size(all,2)) = 0;
    end
    all(end+1,:) = data';
end

if length(f) > size(all,2)%compare the length of f to dta.
    f(size(all,2)+1:end) = [];
elseif length(f) < size(all,2)
	all(:,length(f)+1:end) = [];
end

meanLight = mean(all);
subplot(2,2,3)
plot(f,meanLight)
xlabel('f (Hz)')
ylabel('|P1(f)|')
title(['Light, #trials: ' num2str(size(odorLight,2))])

%% analyze Baseline Activity.
all = [];
for i = 1:size(lp.TTLEvents,2)-1
    ev = lp.TTLEvents(:,i);
    ev2 = lp.TTLEvents(:,i+1);% calc the power in the ISI, between stimuli.
    [f,data] = fftLFP(path,range,[ev(2) ev2(1)],10,0);
    close;
    if length(data) > size(all,2) & i>1 % to prevent unequal vectors for concatenation.
        data(size(all,2)+1:end) = [];
    elseif length(data) < size(all,2) & i>1
        data(length(data) + 1:size(all,2)) = 0;
    end
    all(end+1,:) = data';
end

if length(f) > size(all,2)%compare the length of f to dta.
    f(size(all,2)+1:end) = [];
elseif length(f) < size(all,2)
	all(:,length(f)+1:end) = [];
end
meanBG = mean(all);
subplot(2,2,4)
plot(f,meanBG)
xlabel('f (Hz)')
ylabel('|P1(f)|')
title(['Basline Activity, #trials: ' num2str(size(lp.TTLEvents,2))])