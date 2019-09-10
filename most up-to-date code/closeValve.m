function closeValve(exper)
if nargin < 4
    numOfChannels = 10;
end

if strcmp(exper.param.method, 'Daq') % work directly through Daq.
    v = zeros(1,numOfChannels);

    putvalue(exper.DIO.dio,v)
else
    sendLabViewMsg(5020, '0000')
end

