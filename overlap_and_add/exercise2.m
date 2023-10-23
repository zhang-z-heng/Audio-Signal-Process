%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Overlap and add                            
% Audio Signals course
% 2021
% Zhang Zheng
% Exercise 2
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear
clc
close all

%% Let's verify that windws sum to a constant.
% Define an hanning window (use command hanning) with size M = 101, and hop
% size 50% 

M = 101; % window length

win = hanning(M);
hopsize = (M+1)/2;

% Define a signal x of length 1000 samples
x = zeros(1000,1);

% sum the sliding windows along the signal
figure()
for i=1:10
    start = hopsize*(i-1)+1;
    stop  = start + M - 1;
    x(start:stop) = x(start:stop) + win;
    plot([start:stop],win,'r')
    hold on
end

plot(x)

%% Use a switch to select different windows and overlaps within 
% 1 hanning 50% overlap
% 2 bartlett 50% overlap
% 3 rectangular 50% overlap
% 4 blackman 75% overlap
% select the window type
type = 2; % 1 hanning
          % 2 bartlett
          % 3 rectangular
          % 4 blackman
M = 101;
switch type
    case 1
        win = hanning(M);
        hopsize = (M+1)/2;
    case 2
        win = bartlett(M);
        hopsize = (M-1)/2;
    case 3
        M = M-1;
        win = ones(M,1);
        hopsize = M/2;
    case 4
        M = M-1;
        win = blackman(M);
        hopsize = (M-1)/3;
end

x = zeros(1000,1);

for i=1:10
    start = hopsize*(i-1)+1; % Start index
    stop  = start + M - 1; % Stop index
    x(start:stop) = x(start:stop) + win; % Sum the window to the signal
    plot([start:stop],win,'r')
    hold on
end
    
plot(x)
title('COLA results');