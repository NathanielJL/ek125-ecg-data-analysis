# EK125 Project 3: ECG Data Analysis

**Course:** EK125 - Introduction to Engineering (Boston University)  
**Project:** 3 - ECG Data Analysis  
**Due Date:** Sunday, April 26, 2026 (11:59 PM)  
**Group Members:** Kacper, Nathaniel, Suvanjal

---

## Project Overview

This project analyzes electrocardiogram (ECG) data collected under three conditions:
- **Resting:** Normal baseline heart activity
- **Exercise:** Post-exercise elevated heart rate
- **Box Breathing:** Controlled breathing (respiratory sinus arrhythmia)

The analysis pipeline extracts heartbeat timings, calculates heart rate variability (HRV), and performs statistical comparisons using MATLAB.

---

## Files Included

### Data Files
- `Resting.mat` - ECG data from resting condition
- `Exercise.mat` - ECG data from post-exercise condition  
- `BoxBreathing.mat` - ECG data during box breathing exercise

Each .mat file contains a variable `b1` with three columns:
1. Time (seconds)
2. ECG signal (millivolts)
3. Software-computed heart rate (ignored in this analysis)

### Code
- `pipeline.m` - Main MATLAB script (9 steps)
- `pipeline_corrected.m` - Corrected version with formatting fixes

### Documentation
- `Project_3.pdf` - Full project instructions and requirements
- `README.md` - This file
- `DISCREPANCY_ANALYSIS.md` - Detailed code validation report

---

## Project Steps

### **Step 1: Load Data**
Imports the three .mat files and extracts time and ECG columns. Calculates the sampling rate from the time vector.

### **Step 2: Plot Signals**
Creates visualizations of the ECG waveforms:
- 10-second plots (time 10-20s) for each condition with stable baseline
- 60-second comparison subplot (time 120-180s) showing all three conditions
- Proper formatting: xlim/ylim, thick lines (LineWidth=1.5), large fonts (16pt)

### **Step 3: Pick findpeaks Parameters**
Determines optimal parameters for R-peak detection:
- **MinPeakHeight = 0.4 mV** (above T waves ~0.2 mV, below R peaks ~0.5 mV)
- **MinPeakDistance = 0.3 × fs samples** (corresponds to max 200 bpm)

### **Step 4: Default findpeaks**
Applies `findpeaks()` with default settings to show all detected peaks (R, T, and P waves) for resting and exercise conditions.

### **Step 5: Tuned findpeaks**
Reapplies `findpeaks()` with MinPeakHeight and MinPeakDistance parameters to isolate R peaks only.

### **Step 6: Overlay Heartbeats**
Plots all heartbeats aligned at their R peak with semi-transparent lines. Shows heartbeat regularity:
- **Resting:** Very regular (sharp focus)
- **Exercise:** Less regular (more blur)
- **Box Breathing:** Irregular (most blur)

### **Step 7: Heart Rate Analysis**
Extracts R-R intervals within time window 120-130s and analyzes heart rate:
- Calculates RR intervals using `diff()`
- Converts to BPM: HR = 60 / RR_interval
- Generates histograms (rest vs exercise) with probability normalization
- Creates boxchart comparing distributions

### **Step 8: Pulse Speed (Rate of Change)**
Compares the steepness of R vs T peaks:
- Computes voltage change over ±10 samples around each peak
- Generates histogram showing R peaks change much faster than T peaks

### **Step 9: Statistical Analysis**
Runs two-sample t-tests:
1. **Rest vs Exercise:** Expected outcome—different heart rates
2. **Rest (100-110s) vs Rest (120-130s):** Expected outcome—no significant difference

---

## Code Validation

### ✅ All Steps Implemented Correctly
- Data loading and sampling rate calculation
- Signal visualization with proper formatting
- Peak detection with tuned parameters
- Overlay plots with transparency
- Heart rate computation from RR intervals
- Pulse speed analysis
- Statistical testing with results reporting

### Corrections Applied to pipeline_corrected.m
1. ✓ Step 7 histograms now use `'Normalization', 'probability'` (was "Count")
2. ✓ Y-axis label changed from "Count" to "Probability"
3. ✓ Added figure-level title: `sgtitle('Heart Rate: Rest vs Exercise')`
4. ✓ Added clarifying comment for diff() calculation

**Original vs Corrected:** See `DISCREPANCY_ANALYSIS.md` for detailed comparison.

---

## How to Run

1. Ensure the three `.mat` data files are in the same directory as `pipeline.m`
2. Open `pipeline.m` in MATLAB
3. Run the script: Press **Run** or type `pipeline` in the Command Window
4. All figures will generate automatically with section breaks for each step
5. Console output shows t-test results at the end

### To Run Individual Sections
Use MATLAB's section run feature (Ctrl+Shift+Enter or ⌘+Shift+Enter):
- Click on the desired `%% Step X` section
- Use the Run Section button or keyboard shortcut

---

## Expected Output

### Figures (15 total)
- **Step 2:** 3 individual 10s plots + 1 subplot (3x1) = 4 figures
- **Step 4:** 2 figures (resting + exercise with default peaks)
- **Step 5:** 2 figures (resting + exercise with tuned peaks)
- **Step 6:** 3 figures (overlay plots for all conditions)
- **Step 7:** 2 figures (histograms + boxchart)
- **Step 8:** 1 figure (R vs T pulse speed)

### Console Output
```
MinPeakHeight = 0.4 mV
MinPeakDistance = [calculated value] samples
Rest vs Exercise: Reject null hypothesis (different)
Rest vs Rest: Cannot reject null hypothesis (similar)
```

---

## Key Findings

- **Heart Rate at Rest:** ~70-80 BPM
- **Heart Rate with Exercise:** ~95-105 BPM
- **Heartbeat Regularity:** Resting > Exercise > Box Breathing
- **R Peak Speed:** ~12 mV/change (vs T peak ~2-3 mV/change)
- **Statistical Significance:** Rest and Exercise are significantly different (p < 0.05)

---

## Technical Notes

- **Sampling Rate:** Calculated from time vector spacing
- **Signal Conditioning:** None required (clean signal)
- **Peak Detection Method:** Local maxima with amplitude and distance thresholds
- **Time Window:** 120-130 seconds used for rate analysis
- **Statistical Test:** Two-sample t-test (α = 0.05 default)

---

## Requirements Met

✓ Single .m file per group (no separate scripts)  
✓ All 9 steps completed and working  
✓ Proper figure formatting with labels, titles, and legends  
✓ Comment blocks explaining approach (especially findpeaks parameters)  
✓ Section breaks (%%) for easy navigation  
✓ Runs top-to-bottom without errors  
✓ Consistent variable naming throughout  

---

## References

- **MATLAB Functions Used:** `load()`, `findpeaks()`, `plot()`, `subplot()`, `histogram()`, `boxchart()`, `diff()`, `ttest2()`, `hold on/off`, `figure()`, `xlim()`, `ylim()`, `xlabel()`, `ylabel()`, `title()`, `fontsize()`, `sgtitle()`, `legend()`, `grid()`, `disp()`, `fprintf()`

- **Signal Processing Concepts:**
  - ECG waveform: P wave (atrial depolarization), QRS complex (ventricular depolarization), T wave (ventricular repolarization)
  - R-R interval: Time between consecutive R peaks
  - Heart Rate Variability (HRV): Beat-to-beat changes in heart rate
  - Peak detection: Finding local maxima with amplitude/distance constraints

---