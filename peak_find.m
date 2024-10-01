% Specify the file path
file_path = 'ECG.csv';

% Read the CSV file
ecg_data = readmatrix(file_path);

% Extract the elapsed time and ECG signal from the data
elapsed_time = ecg_data(:, 1); % Elapsed time in seconds
ecg_signal = ecg_data(:, 2); % ECG signal

% Calculate the sampling frequency
fs = 100; % Assuming a uniform time interval
[qrs_amp_raw,qrs_i_raw,delay]= pan_tompkin(ecg_signal,fs);