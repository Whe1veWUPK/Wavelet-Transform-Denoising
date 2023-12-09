% Generate noissin signal
t = 0:1:1000;
f = sin(0.03 * t);

% Generate random noise and add to noissin signal
noise_level = 0.5;
noise = noise_level * randn(size(f));
e = f + noise;


% Signal Dec
[c,l]=wavedec(e,5,'db10');
wname_db10 = 'db10';


% Reconstruct low frequency coefficients
a1_coef = appcoef(c,l,wname_db10,1);
a2_coef = appcoef(c,l,wname_db10,2);
a3_coef = appcoef(c,l,wname_db10,3);
a4_coef = appcoef(c,l,wname_db10,4);
a5_coef = appcoef(c,l,wname_db10,5);


%Plot the low frequency coefficients
figure;
subplot(5,1,1);
plot(a1_coef, 'b', 'LineWidth', 1.5);
title('a1 coef')

subplot(5,1,2);
plot(a2_coef, 'b', 'LineWidth', 1.5);
title('a2 coef')

subplot(5,1,3);
plot(a3_coef, 'b', 'LineWidth', 1.5);
title('a3 coef')

subplot(5,1,4);
plot(a4_coef, 'b', 'LineWidth', 1.5);
title('a4 coef')

subplot(5,1,5);
plot(a5_coef, 'b', 'LineWidth', 1.5);
title('a5 coef')

% Reconstruct high frequency coefficients
d1_coef = detcoef(c,l,1);
d2_coef = detcoef(c,l,2);
d3_coef = detcoef(c,l,3);
d4_coef = detcoef(c,l,4);
d5_coef = detcoef(c,l,5);


%Plot the high frequency coefficients
figure;
subplot(5,1,1);
plot(d1_coef, 'b', 'LineWidth', 1.5);
title('d1 coef')

subplot(5,1,2);
plot(d2_coef, 'b', 'LineWidth', 1.5);
title('d2 coef')

subplot(5,1,3);
plot(d3_coef, 'b', 'LineWidth', 1.5);
title('d3 coef')

subplot(5,1,4);
plot(d4_coef, 'b', 'LineWidth', 1.5);
title('d4 coef')

subplot(5,1,5);
plot(d5_coef, 'b', 'LineWidth', 1.5);
title('d5 coef')

% Calculate the len
a1_len=size(a1_coef,2);
a2_len=size(a2_coef,2);
a3_len=size(a3_coef,2);
a4_len=size(a4_coef,2);
a5_len=size(a5_coef,2);


d1_len=size(d1_coef,2);
d2_len=size(d2_coef,2);
d3_len=size(d3_coef,2);
d4_len=size(d4_coef,2);
d5_len=size(d5_coef,2);


% Reconstruct the signal based on low frequency coefficients
a1=waverec([a1_coef,zeros(1,a4_len+a3_len+a2_len+a5_len+d5_len+d4_len+d3_len+d2_len+d1_len)],l,'db10');
a2=waverec([a2_coef,zeros(1,a4_len+a3_len+a1_len+a5_len+d5_len+d4_len+d3_len+d2_len+d1_len)],l,'db10');
a3=waverec([a3_coef,zeros(1,a4_len+a1_len+a2_len+a5_len+d5_len+d4_len+d3_len+d2_len+d1_len)],l,'db10');
a4=waverec([a4_coef,zeros(1,a5_len),zeros(1,a1_len+a3_len+a2_len+d5_len+d4_len+d3_len+d2_len+d1_len)],l,'db10');
a5=waverec([a5_coef,zeros(1,a4_len+a3_len+a2_len+a1_len+d5_len+d4_len+d3_len+d2_len+d1_len)],l,'db10');

% Plot the results
figure;
subplot(6,1,1);
plot(t, e, 'b', 'LineWidth', 1.5);
title('Signal with noise');

subplot(6,1,2);
plot(t, a1, 'b', 'LineWidth', 1.5);
title('a1')

subplot(6,1,3);
plot(t, a2, 'b', 'LineWidth', 1.5);
title('a2')

subplot(6,1,4);
plot(t, a3, 'b', 'LineWidth', 1.5);
title('a3');

subplot(6,1,5);
plot(t, a4, 'b', 'LineWidth', 1.5);
title('a4');

subplot(6,1,6);
plot(t, a5, 'b', 'LineWidth', 1.5);
title('a5');
size(l,2)


% Reconstruct the signal based on high frequency coefficients
d1=waverec([d1_coef,zeros(1,a4_len+a3_len+a2_len+a5_len+d5_len+d4_len+d3_len+d2_len+a1_len)],l,'db10');
d2=waverec([d2_coef,zeros(1,a4_len+a3_len+a1_len+a5_len+d5_len+d4_len+d3_len+a2_len+d1_len)],l,'db10');
d3=waverec([d3_coef,zeros(1,a4_len+a1_len+a2_len+a5_len+d5_len+d4_len+a3_len+d2_len+d1_len)],l,'db10');
d4=waverec([d4_coef,zeros(1,a1_len+a3_len+a2_len+a5_len+d5_len+a4_len+d3_len+d2_len+d1_len)],l,'db10');
d5=waverec([d5_coef,zeros(1,a4_len+a3_len+a2_len+a1_len+a5_len+d4_len+d3_len+d2_len+d1_len)],l,'db10');


% Plot the results
figure;
subplot(6,1,1);
plot(t, e, 'b', 'LineWidth', 1.5);
title('Signal with noise');

subplot(6,1,2);
plot(t, d1, 'b', 'LineWidth', 1.5);
title('d1')

subplot(6,1,3);
plot(t,d2, 'b', 'LineWidth', 1.5);
title('d2')

subplot(6,1,4);
plot(t, d3, 'b', 'LineWidth', 1.5);
title('d3');

subplot(6,1,5);
plot(t, d4, 'b', 'LineWidth', 1.5);
title('d4');

subplot(6,1,6);
plot(t, d5, 'b', 'LineWidth', 1.5);
title('d5');