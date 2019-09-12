% local functions
function y = bandpass_signal(x,sample_freq,HighPass,LowPass)

[b,a] = butter(1,[HighPass/sample_freq/2 LowPass/sample_freq/2]);

y = filtfilt(b,a,x)';

