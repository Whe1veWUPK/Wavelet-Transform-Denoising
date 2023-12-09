% Setting parameters
fs = 1000; % Sampling Rate
t = 0:1/fs:1; % Time vector, from 0 to 1 second, sampled at 1/fs intervals


% Generate FM signal
f0 = 100; % Initial frequency
f1 = 0.5; % Termination frequency
linear_chirp = chirp(t, f0,1, f1, 'logarithmic');

% Generate random noise
noise = 0.1 * randn(size(t)); % 0.1 is the amplitude of the noise

% Merge chirp signal and noise
signal_with_noise = linear_chirp + noise;

% Draw signal waveform
figure;
plot(t, signal_with_noise);
xlabel('time (seconds)');
ylabel('amplitude');
title('Noisy chirp signal');


% Perform Fourier transform on the original signal and output the spectrum image.

% Calculate the Fourier transform
N = length(signal_with_noise);
frequencies = linspace(0, fs, N); % Calculate frequency axis
fft_result = fft(signal_with_noise, N); 
magnitude_spectrum = abs(fft_result / N); % Calculate amplitude spectrum
% Plot a spectrogram
figure;
plot(frequencies, magnitude_spectrum);
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('Fourier transform of the signal');

% Plot the original signal and the inverse transformed signal
figure;
subplot(4, 1, 1);
plot(t, signal_with_noise);
xlabel('time (seconds)');
ylabel('amplitude');
title('original signal');

% Delete frequency components greater than 50Hz
remove_50=find(frequencies>=50);
fft_result(remove_50)=0;
ifft_result=ifft(fft_result,length(fft_result));

% Plot the inverse Fourier transformed signal after removing frequency components greater than 50Hz
subplot(4, 1, 2);
plot(t, ifft_result);
xlabel('time (seconds)');
ylabel('amplitude');
title('Signal filtered by a low-pass filter with a width of 50Hz');


% Delete frequency components greater than 30Hz
remove_30=find(frequencies>=30);
fft_result(remove_30)=0;
ifft_result=ifft(fft_result,length(fft_result));

% Plot the inverse Fourier transformed signal after removing frequency components greater than 30Hz
subplot(4, 1, 3);
plot(t, ifft_result);
xlabel('time (seconds)');
ylabel('amplitude');
title('Signal filtered by a low-pass filter with a width of 30Hz');



% Delete frequency components greater than 10Hz
remove_10=find(frequencies>=10);
fft_result(remove_10)=0;
ifft_result=ifft(fft_result,length(fft_result));

% Plot the inverse Fourier transformed signal after removing frequency components greater than 10Hz
subplot(4, 1, 4);
plot(t, ifft_result);
xlabel('time(seconds)');
ylabel('amplitude');
title('Signal filtered by a low-pass filter with a width of 10Hz');


% Filter signals using global thresholds and hierarchical thresholds respectively
denois_signal_with_sln=wden(signal_with_noise,'heursure','s','sln',5,'sym4');
denois_signal_with_mln=wden(signal_with_noise,'heursure','s','mln',5,'sym4');


% Plot wavelet filtered signal
figure;
subplot(3, 1, 1);
plot(t, signal_with_noise);
xlabel('time(seconds)');
ylabel('amplitude');
title('Original signal');

subplot(3,1,2);
plot(t,denois_signal_with_sln);
xlabel('time(seconds)');
ylabel('amplitude');
title('Signal after denoising using global threshold');

subplot(3,1,3);
plot(t,denois_signal_with_mln);
xlabel('time(seconds)');
ylabel('amplitude');
title('Signal after denoising using hierarchical thresholding');
