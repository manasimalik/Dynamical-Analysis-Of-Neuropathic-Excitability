function MPO
%% Fig 3
clear
clc
%% 
tspan = 0:1e-1:1000;	% Time vector
y0 = [-70 0.000025];
I=70;

%Noise Dependent
beta_w=-13;

%With Noise
opts = sdeset('RandSeed',1);
with_noise=sde_euler(@(t,y)model_2D_both(t,y,beta_w,I),@(t,y)noise(t,y),tspan,y0,opts);
%figure; plot(tspan,with_noise(:,1),'k');
%title('With Noise Spikes');

%Without Noise
[t no_noise]=ode15s(@(t,y)model_2D_both(t,y,beta_w,I),tspan,y0);
%figure; plot(t,no_noise(:,1),'k');
%title('No Noise Spikes');

%Noise Independent
beta_w=-19;
[t independent]=ode15s(@(t,y)model_2D_both(t,y,beta_w,I),tspan,y0);
%figure; plot(t,independent(:,1),'k');
%title('Noise Independent Spikes');

%% Plot the spectrum
N=length(with_noise(:,1));
fs=100;
fx=linspace(0,fs,N);

X_with_noise=(fft(with_noise(:,1)))/(10^5);
Power_with_noise=smooth(abs(X_with_noise).^2);

X_no_noise=(fft(no_noise(:,1)))/(10^5);
Power_no_noise=smooth(abs(X_no_noise).^2);

X_independent=(fft(independent(:,1)))/(10^5);
Power_independent=smooth(abs(X_independent).^2);

figure('units','normalized','outerposition',[0 0 1 1])
plot(fx(1:end/2)/fs,Power_with_noise(1:end/2),'k');
hold on
plot(fx(1:end/2)/fs,Power_no_noise(1:end/2),'b');
hold on
plot(fx(1:end/2)/fs,Power_independent(1:end/2),'r');
set(gca, 'YScale', 'log')
xlabel('MPO Frequency (in kHz)');
ylabel('MPO power (mV^2/Hz');
legend('Noise Dependent,No Noise','Noise Dependent,With Noise','Noise Independent,No Noise');
end