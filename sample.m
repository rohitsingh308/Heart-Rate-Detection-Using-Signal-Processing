
file_path = 'ECG.csv';
ecg_data = readmatrix(file_path);
elapsed_time = ecg_data(:, 1); % Elapsed time in seconds
ecg_signal = ecg_data(:, 2); % ECG signal
figure
plot(ecg_signal)
hold on
% plot(tm(ann),ecg_signal(ann),'ro')
xlabel('Seconds')
ylabel('Amplitude')
title('Sample Signal')
qrsEx = ecg_signal(456:481);
fb = dwtfilterbank('Wavelet','sym4','SignalLength',numel(qrsEx),'Level',3);
psi = wavelets(fb);
figure
plot(qrsEx)
hold on
plot(-2*circshift(psi(3,:),[0 -38]),'r')
axis tight
legend('QRS Complex','Sym4 Wavelet')
title('Comparison of Sym4 Wavelet and QRS Complex')
hold off