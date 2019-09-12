function [R] = subtractBaseline(R,t)
%% calc mean baseline and subtract it
baseline = mean(R(t<0));
R = R-baseline;

    