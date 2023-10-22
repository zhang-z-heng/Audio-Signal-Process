%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Introduction to Matlab                            
% Audio Signals course
% 2021
% Zhang Zheng
% Exercise 4
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Figures
% Create a figure with 4 subplots stacked vertically
% They contain sinusoids with same frequency but different phases 
% (0, pi/2, pi, 3pi/2)

figure()
N = 4;

f = 1;  % Hz
Fs = 10;  % Hz
duration = 3;
Ts = 1/Fs;  % s
t = 0:Ts:duration;  % time axis

for i = 1:N
    subplot(N, 1, i);
    phi = (i-1)/N * 2 * pi;
    x = cos(t * 2 * pi * f + phi);
    stem(t, x);
end
    