% Fig 5: Bursting
function Bursting
tspan = 0:0.01:1000;
y0 = [-70 0.000025 0];
I=50; 
beta_w=-16;
opts = sdeset('RandSeed',1);
with_noise=sde_euler(@(t,y)model_3D_adaptation(t,y,beta_w,I),@(t,y)noise3D(t,y),tspan,y0,opts);

figure('units','normalized','outerposition',[0 0 1 1])
plot(tspan,with_noise(:,1),'k');
title('Bursting');
xlabel('Time');
ylabel('Voltage(mV)');

figure('units','normalized','outerposition',[0 0 1 1])
plot(with_noise(:,3),with_noise(:,1));
title('Bursting Dynamics');
xlabel('z');
ylabel('Voltage(mV)');
end