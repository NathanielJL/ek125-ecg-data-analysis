% EK125 Project 3 - ECG Data Analysis
% Part 1: Steps 1-3 (load data, plot signals, pick findpeaks parameters)
% Part 2: 
% Part 3: 
% Group - Kacper, Nathaniel, Suvanjal
% Date: April 21, 2026

clear; clc; close all

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

% EK125 Project 3 - ECG Data Analysis
% Part 1: Steps 1-3 (load data, plot signals, pick findpeaks parameters)
% Part 2: 
% Part 3: 
% Group - Kacper, Nathaniel, Suvanjal
% Date: April 21, 2026

clear; clc; close all

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

% EK125 Project 3 - ECG Data Analysis
% Part 1: Steps 1-3 (load data, plot signals, pick findpeaks parameters)
% Part 2: 
% Part 3: 
% Group - Kacper, Nathaniel, Suvanjal
% Date: April 21, 2026

clear; clc; close all

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

%% Step 4: Use findpeaks() with default settings
% First, try default findpeaks to see all peaks (R, T, and P waves)

% Resting data - 10 seconds around time 120-130
figure
subplot(2,1,1)
plot(t_rest, ecg_rest)
xlim([120 130])
ylim([-0.2 0.8])
xlabel('time (s)')
ylabel('ECG (mV)')
title('Resting')

subplot(2,1,2)
[pks_rest_default, locs_rest_default] = findpeaks(ecg_rest);
plot(t_rest, ecg_rest)
hold on
plot(t_rest(locs_rest_default), pks_rest_default, 'v', 'MarkerSize', 8, 'Color', 'r')
xlim([120 130])
ylim([-0.2 0.8])
xlabel('time (s)')
ylabel('ECG (mV)')
title('Resting with peaks (default findpeaks)')
hold off

% Exercise data - 10 seconds around time 120-130
figure
subplot(2,1,1)
plot(t_ex, ecg_ex)
xlim([120 130])
ylim([-0.2 0.8])
xlabel('time (s)')
ylabel('ECG (mV)')
title('Exercise')

subplot(2,1,2)
[pks_ex_default, locs_ex_default] = findpeaks(ecg_ex);
plot(t_ex, ecg_ex)
hold on
plot(t_ex(locs_ex_default), pks_ex_default, 'v', 'MarkerSize', 8, 'Color', 'r')
xlim([120 130])
ylim([-0.2 0.8])
xlabel('time (s)')
ylabel('ECG (mV)')
title('Exercise with peaks (default findpeaks)')
hold off

%% Step 5: Redo with appropriate MinPeakHeight and MinPeakDistance
% Now use the tuned parameters to detect only R peaks

% Resting data with tuned parameters
figure
subplot(2,1,1)
plot(t_rest, ecg_rest)
xlim([120 130])
ylim([-0.2 0.8])
xlabel('time (s)')
ylabel('ECG (mV)')
title('Resting')

subplot(2,1,2)
[pks_rest, locs_rest] = findpeaks(ecg_rest, 'MinPeakHeight', MinPeakHeight, ...
                                   'MinPeakDistance', MinPeakDistance);
plot(t_rest, ecg_rest)
hold on
plot(t_rest(locs_rest), pks_rest, 'v', 'MarkerSize', 8, 'Color', 'r')
xlim([120 130])
ylim([-0.2 0.8])
xlabel('time (s)')
ylabel('ECG (mV)')
title('Resting with R peaks only')
hold off

% Exercise data with tuned parameters
figure
subplot(2,1,1)
plot(t_ex, ecg_ex)
xlim([120 130])
ylim([-0.2 0.8])
xlabel('time (s)')
ylabel('ECG (mV)')
title('Exercise')

subplot(2,1,2)
[pks_ex, locs_ex] = findpeaks(ecg_ex, 'MinPeakHeight', MinPeakHeight, ...
                              'MinPeakDistance', MinPeakDistance);
plot(t_ex, ecg_ex)
hold on
plot(t_ex(locs_ex), pks_ex, 'v', 'MarkerSize', 8, 'Color', 'r')
xlim([120 130])
ylim([-0.2 0.8])
xlabel('time (s)')
ylabel('ECG (mV)')
title('Exercise with R peaks only')
hold off

%% Step 6: Overlay all heartbeats on the same graph using trigger (R peak)
% Plot each heartbeat centered on the R peak with semi-transparent lines
% This shows how regular the heartbeat is across many cycles

% Determine window size: 200 samples before and after each R peak
window = 200;  % samples before and after the peak

% RESTING - overlay all heartbeats
figure
[pks_rest_final, locs_rest_final] = findpeaks(ecg_rest, 'MinPeakHeight', MinPeakHeight, ...
                                              'MinPeakDistance', MinPeakDistance);
hold on
for i = 1:length(locs_rest_final)
    % Get indices for window around this peak
    idx_start = locs_rest_final(i) - window;
    idx_end = locs_rest_final(i) + window;
    
    % Make sure we stay within bounds
    if idx_start > 0 && idx_end <= length(ecg_rest)
        % Create x-axis centered at R peak (0)
        x_axis = (idx_start:idx_end) - locs_rest_final(i);
        
        % Plot with transparency (4th value in color)
        plot(x_axis, ecg_rest(idx_start:idx_end), 'Color', [0 0 1 0.3])
    end
end
hold off
xlabel('samples relative to R peak')
ylabel('ECG (mV)')
title('Resting - All heartbeats overlaid')
grid on

% EXERCISE - overlay all heartbeats
figure
[pks_ex_final, locs_ex_final] = findpeaks(ecg_ex, 'MinPeakHeight', MinPeakHeight, ...
                                          'MinPeakDistance', MinPeakDistance);
hold on
for i = 1:length(locs_ex_final)
    idx_start = locs_ex_final(i) - window;
    idx_end = locs_ex_final(i) + window;
    
    if idx_start > 0 && idx_end <= length(ecg_ex)
        x_axis = (idx_start:idx_end) - locs_ex_final(i);
        plot(x_axis, ecg_ex(idx_start:idx_end), 'Color', [1 0 0 0.3])
    end
end
hold off
xlabel('samples relative to R peak')
ylabel('ECG (mV)')
title('Exercise - All heartbeats overlaid')
grid on

% BOX BREATHING - overlay all heartbeats
figure
[pks_bb_final, locs_bb_final] = findpeaks(ecg_bb, 'MinPeakHeight', MinPeakHeight, ...
                                          'MinPeakDistance', MinPeakDistance);
hold on
for i = 1:length(locs_bb_final)
    idx_start = locs_bb_final(i) - window;
    idx_end = locs_bb_final(i) + window;
    
    if idx_start > 0 && idx_end <= length(ecg_bb)
        x_axis = (idx_start:idx_end) - locs_bb_final(i);
        plot(x_axis, ecg_bb(idx_start:idx_end), 'Color', [0 0.7 0 0.3])
    end
end
hold off
xlabel('samples relative to R peak')
ylabel('ECG (mV)')
title('Box Breathing - All heartbeats overlaid')
grid on

%% Step 7: Heart Rate Analysis (R-R intervals, histogram, boxchart)

% --- RESTING ---
R_times_rest = t_rest(locs_rest_final);

% limit to time window 120–130 s
mask_rest = (R_times_rest >= 120) & (R_times_rest <= 130);
R_times_rest_win = R_times_rest(mask_rest);

% R-R intervals
RR_rest = diff(R_times_rest_win);

% heart rate (BPM)
HR_rest = 60 ./ RR_rest;

% --- EXERCISE ---
R_times_ex = t_ex(locs_ex_final);

mask_ex = (R_times_ex >= 120) & (R_times_ex <= 130);
R_times_ex_win = R_times_ex(mask_ex);

RR_ex = diff(R_times_ex_win);
HR_ex = 60 ./ RR_ex;

% --- HISTOGRAMS ---
figure
subplot(2,1,1)
histogram(HR_rest)
xlabel('Heart Rate (BPM)')
ylabel('Count')
title('Resting Heart Rate Distribution')

subplot(2,1,2)
histogram(HR_ex)
xlabel('Heart Rate (BPM)')
ylabel('Count')
title('Exercise Heart Rate Distribution')


% --- BOXCHART ---
combinedData = [HR_rest; HR_ex];
group = [ones(length(HR_rest),1); 2*ones(length(HR_ex),1)];

figure
boxchart(group, combinedData)
xlabel('Condition')
ylabel('Heart Rate (BPM)')
title('Rest vs Exercise Heart Rate')
xticklabels({'Rest','Exercise'})

%% Step 8: Pulse Speed (R vs T)

% Find T peaks (lower threshold)
[pks_T, locs_T] = findpeaks(ecg_rest, ...
    'MinPeakHeight', 0.1, ...
    'MinPeakDistance', MinPeakDistance);

R_speeds = [];
T_speeds = [];

% --- R peaks ---
for i = 1:length(locs_rest_final)
    idx = locs_rest_final(i);
    
    if idx > 10 && idx < length(ecg_rest)-10
        speed = abs(ecg_rest(idx+10) - ecg_rest(idx-10));
        R_speeds(end+1) = speed;
    end
end

% --- T peaks ---
for i = 1:length(locs_T)
    idx = locs_T(i);
    
    if idx > 10 && idx < length(ecg_rest)-10
        speed = abs(ecg_rest(idx+10) - ecg_rest(idx-10));
        T_speeds(end+1) = speed;
    end
end

% --- Histogram ---
figure
histogram(R_speeds)
hold on
histogram(T_speeds)
legend('R Peaks','T Peaks')
xlabel('Voltage Change (mV)')
ylabel('Count')
title('Pulse Speed: R vs T')

%% Step 9: Two-sample t-tests

% --- Rest vs Exercise ---
[h1, p1] = ttest2(HR_rest, HR_ex);

if h1 == 1
    fprintf('Rest vs Exercise: Reject null hypothesis (different)\n')
else
    fprintf('Rest vs Exercise: Cannot reject null hypothesis\n')
end

% --- Rest vs Rest (two time windows) ---
R_times_w1 = R_times_rest(R_times_rest >= 100 & R_times_rest <= 110);
R_times_w2 = R_times_rest(R_times_rest >= 120 & R_times_rest <= 130);

RR1 = diff(R_times_w1);
RR2 = diff(R_times_w2);

HR1 = 60 ./ RR1;
HR2 = 60 ./ RR2;

[h2, p2] = ttest2(HR1, HR2);

if h2 == 1
    fprintf('Rest vs Rest: Reject null hypothesis\n')
else
    fprintf('Rest vs Rest: Cannot reject null hypothesis (similar)\n')
end
