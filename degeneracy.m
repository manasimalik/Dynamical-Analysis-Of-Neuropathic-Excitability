function degeneracy
%% Fig 8
%% default
clc
clear

V=-80:2:40;
C=2;
Istim=70;

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

figure('units','normalized','outerposition',[0 0 1 1])
%% A

%beta=-21 Normal
beta_w=-21;
winf=.5*(1+tanh((V-beta_w)/gamma_w));
tau_w=1./cosh((V-beta_w)/(2*gamma_w));
nullclinew1=winf;

%beta=-13, Neuropathic
beta_w=-13;
winf=.5*(1+tanh((V-beta_w)/gamma_w));
tau_w=1./cosh((V-beta_w)/(2*gamma_w));
nullclinew2=winf;

nullclineV_stim=(-gfast*minf.*(V-ENa)-gl.*(V-El)+Istim)./(gslow*(V-Ek));
subplot(2,2,1);
plot(V,nullclinew1,'g',V,nullclinew2,'r',V,nullclineV_stim,'k');
title('vary beta_w');
ylabel('w');
xlabel('V(mV)');
ylim([-0.1 0.4]);
legend('w nullcline beta=-21','w nullcline beta=-13','V nullcline');
%% B
%back to default
beta_w=-21;
winf=.5*(1+tanh((V-beta_w)/gamma_w));
nullclinew=winf;

%Normal gfast=20
gfast=20;
nullclineV_stim1=(-gfast*minf.*(V-ENa)-gl.*(V-El)+Istim)./(gslow*(V-Ek));
%Normal gfast=30
gfast=30;
nullclineV_stim2=(-gfast*minf.*(V-ENa)-gl.*(V-El)+Istim)./(gslow*(V-Ek));

subplot(2,2,2);
plot(V,nullclinew,'k',V,nullclineV_stim1,'g',V,nullclineV_stim2,'r');
title('vary gfast');
ylabel('w');
xlabel('V(mV)');
ylim([-0.1 0.4]);
legend('w nullcline','V nullcline gfast=20','V nullcline gfast=30');
%% C
%back to default
gfast=20;

%Normal gslow=20
gslow=20;
nullclineV_stim1=(-gfast*minf.*(V-ENa)-gl.*(V-El)+Istim)./(gslow*(V-Ek));
%Normal gslow=6
gslow=6;
nullclineV_stim2=(-gfast*minf.*(V-ENa)-gl.*(V-El)+Istim)./(gslow*(V-Ek));

subplot(2,2,3);
plot(V,nullclinew,'k',V,nullclineV_stim1,'g',V,nullclineV_stim2,'r');
title('vary gslow');
ylabel('w');
xlabel('V(mV)');
ylim([-0.1 0.4]);
legend('w nullcline','V nullcline gslow=6','V nullcline gslow=30');
%% D
%back to default
gslow=20;

%beta_m=-1.2 Normal
beta_m=-1.2;
minf=.5*(1+tanh((V-beta_m)/gamma_m));
nullclineV_stim1=(-gfast*minf.*(V-ENa)-gl.*(V-El)+Istim)./(gslow*(V-Ek));

%beta_m=-5, Neuropathic
beta_m=-5;
minf=.5*(1+tanh((V-beta_m)/gamma_m));
nullclineV_stim2=(-gfast*minf.*(V-ENa)-gl.*(V-El)+Istim)./(gslow*(V-Ek));

subplot(2,2,4);
plot(V,nullclinew,'k',V,nullclineV_stim1,'g',V,nullclineV_stim2,'r');
title('vary beta_m');
ylabel('w');
xlabel('V(mV)');
ylim([-0.1 0.4]);
legend('w nullcline','V nullcline beta_m=-1.2','V nullcline beta_m=-5');
%%
end