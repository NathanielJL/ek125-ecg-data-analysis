% EK125 Project 3 - ECG Data Analysis
% Part 1: Steps 1-3 (load data, plot signals, pick findpeaks parameters)
% Part 2: 
% Part 3: 
% Group - Kacper, Nathaniel, Suvanjal
% Date: April 21, 2026

clear
clc
close all

%% Step 1: Load Data
% Each .mat file has a variable b1 with 3 columns:
%   col 1 = time (s), col 2 = ECG (mV), col 3 = HR from software (ignore)
% All 3 files use the same name b1, so I pull out the columns before
% loading the next one or it gets overwritten.

load('Resting.mat')
t_rest = b1(:,1);
ecg_rest = b1(:,2);

load('Exercise.mat')
t_ex = b1(:,1);
ecg_ex = b1(:,2);

load('BoxBreathing.mat')
t_bb = b1(:,1);
ecg_bb = b1(:,2);

% sampling rate (need this in Step 3)
fs = 1 / (t_rest(2) - t_rest(1));

%% Step 2: Plot Signals

% Resting - 10 second window where the baseline is stable
figure
plot(t_rest, ecg_rest, 'LineWidth', 1.5)
xlim([10 20])
ylim([-0.2 0.8])
xlabel('time (s)')
ylabel('ECG (mV)')
title('Resting')
fontsize(gcf, 16, 'points')

% Exercise
figure
plot(t_ex, ecg_ex, 'LineWidth', 1.5)
xlim([10 20])
ylim([-0.2 0.8])
xlabel('time (s)')
ylabel('ECG (mV)')
title('Exercise')
fontsize(gcf, 16, 'points')

% Box Breathing
figure
plot(t_bb, ecg_bb, 'LineWidth', 1.5)
xlim([10 20])
ylim([-0.2 0.8])
xlabel('time (s)')
ylabel('ECG (mV)')
title('Box Breathing')
fontsize(gcf, 16, 'points')

% All three conditions on one figure, 60 seconds each (3x1 subplot)
figure

subplot(3,1,1)
plot(t_rest, ecg_rest)
xlim([120 180])
ylim([-0.2 0.8])
ylabel('ECG (mV)')
title('Resting')

subplot(3,1,2)
plot(t_ex, ecg_ex)
xlim([120 180])
ylim([-0.2 0.8])
ylabel('ECG (mV)')
title('Exercise')

subplot(3,1,3)
plot(t_bb, ecg_bb)
xlim([120 180])
ylim([-0.2 0.8])
xlabel('time (s)')
ylabel('ECG (mV)')
title('Box Breathing')

%% Step 3: Pick findpeaks parameters
% We want to detect only the R peak of each heartbeat, not the T or P waves.
%
% MinPeakHeight: In the resting plot, R peaks reach around 0.5 mV and the
% T waves are much smaller (under ~0.2 mV). Setting the threshold at
% 0.4 mV is above the T waves but below the R peaks, so it catches
% only the R peaks.
%
% MinPeakDistance: Heart rate shouldn't go above ~200 bpm even during
% exercise. 200 bpm = 1 beat every 0.3 seconds, so peaks closer than
% 0.3 s apart can't both be R peaks. findpeaks wants this in samples,
% not seconds, so we multiply by fs.

MinPeakHeight = 0.4;           % mV
MinPeakDistance = 0.3 * fs;    % samples

disp(['MinPeakHeight = ', num2str(MinPeakHeight), ' mV'])
disp(['MinPeakDistance = ', num2str(MinPeakDistance), ' samples'])