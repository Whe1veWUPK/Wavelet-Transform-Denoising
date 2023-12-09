% Generate noissin signal
t = 0:1:1000;
f = sin(0.03 * t);

% Generate random noise and add to noissin signal
noise_level = 0.5;
noise = noise_level * randn(size(f));
e = f + noise;

% Parameters of wavelet decomposition
decp_level = 5;
wname_db10 = 'db10';
wname_sym8 = 'sym8';


[e_denoi_db10,c11,l11,threshold_Minimax]=wden(e,'minimaxi', 'h','one', decp_level,wname_db10);
[e_denoi_sym8,c2,l2,threshold_Sure]=wden(e,'heursure', 'h','one', decp_level,wname_sym8);


% Plot the results
figure;

subplot(2, 2, 1);
plot(t, f, 'b', 'LineWidth', 1.5);
title('Original Signal');

subplot(2, 2, 2);
plot(t, e, 'r', 'LineWidth', 1.5);
title('The signal after adding noise');

subplot(2, 2, 3);
plot(t, e_denoi_db10, 'g', 'LineWidth', 1.5);
title('Signal after wavelet denoising (db10)');

subplot(2, 2, 4);
plot(t, e_denoi_sym8, 'g', 'LineWidth', 1.5);
title('Signal after wavelet denoising (sym8)');




