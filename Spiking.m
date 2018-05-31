function Spiking

%% Fig2A
clc
clear
figure('units','normalized','outerposition',[0 0 1 1])
%Normal
subplot(2,1,1);
beta_w=-21;
Istim=70;
[t y]=ode15s(@(t,y)model_2D_both(t,y,beta_w,Istim),0:1e-2:100,[-70 2.5e-05]);
plot(t,y(:,1),'k');
title('Normal, Bw=-21');
xlabel('Time');
ylabel('Voltage(mV)');

%Neuropathic
subplot(2,1,2);
beta_w=-13;
Istim=70;
[t y]=ode15s(@(t,y)model_2D_both(t,y,beta_w,Istim),0:1e-2:100,[-70 2.5e-05]);
plot(t,y(:,1),'k');
title('Neuropathic, Bw=-13');
xlabel('Time');
ylabel('Voltage(mV)');
%% Fig2C
clc
clear

V=-80:2:40;

Istim=70;
C=2;

ENa=50;
Ek=-100;
El=-70;

gfast=20;
gslow=20;
gl=2;

beta_m=-1.2;
beta_w=-21;
gamma_m=18;
gamma_w=10;

minf=.5*(1+tanh((V-beta_m)/gamma_m));
winf=.5*(1+tanh((V-beta_w)/gamma_w));
tau_w=1./cosh((V-beta_w)/(2*gamma_w));

phi=0.15;

Istim=0;
nullclineV=(-gfast*minf.*(V-ENa)-gl.*(V-El)+Istim)./(gslow*(V-Ek));
nullclinew=winf;
Istim=70;
nullclineV_stim=(-gfast*minf.*(V-ENa)-gl.*(V-El)+Istim)./(gslow*(V-Ek));
figure('units','normalized','outerposition',[0 0 1 1])
plot(V,nullclineV,'r',V,nullclinew,'b',V,nullclineV_stim,'r--');
hold on
Istim=70;
[t y]=ode15s(@(t,y)model_2D_both(t,y,beta_w,Istim),0:1e-2:100,[-70 2.5e-05]);
plot(y(:,1),y(:,2),'k');
title('Normal, Bw=-21');
ylabel('w');
xlabel('V(mV)');
legend('V Nullcline-no stim','w Nullcline','V nullcline-with stim','trajectory');

x = [0.35 0.37];
y = [0.35 0.3];
annotation('textarrow',x,y,'String','s')

x = [0.2 0.2];
y = [0.19 0.23];
annotation('textarrow',x,y,'String','s')

% beta=-13, Neuropathic
beta_m=-1.2;
beta_w=-13;
gamma_m=18;
gamma_w=10;

minf=.5*(1+tanh((V-beta_m)/gamma_m));
winf=.5*(1+tanh((V-beta_w)/gamma_w));
tau_w=1./cosh((V-beta_w)/(2*gamma_w));

phi=0.15;

Istim=0;
nullclineV=(-gfast*minf.*(V-ENa)-gl.*(V-El)+Istim)./(gslow*(V-Ek));
nullclinew=winf;
Istim=70;
nullclineV_stim=(-gfast*minf.*(V-ENa)-gl.*(V-El)+Istim)./(gslow*(V-Ek));
figure('units','normalized','outerposition',[0 0 1 1])
plot(V,nullclineV,'r',V,nullclinew,'b',V,nullclineV_stim,'r--');
hold on
Istim=70;
[t y]=ode15s(@(t,y)model_2D_both(t,y,beta_w,Istim),0:1e-2:100,[-70 2.5e-05]);
plot(y(:,1),y(:,2),'k');
title('Neuropathic, Bw=-13');
ylabel('w');
xlabel('V(mV)');
legend('V Nullcline-no stim','w Nullcline','V nullcline-with stim', 'trajectory');

x = [0.38 0.44];
y = [0.35 0.275];
annotation('textarrow',x,y,'String','u')

x = [0.2 0.2];
y = [0.19 0.23];
annotation('textarrow',x,y,'String','s')

end