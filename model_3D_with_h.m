function f=model_3D_with_h(t,x,beta_w,Istim)

V=x(1);
w=x(2);
h=x(3)

C=2;

ENa=50;
Ek=-100;
El=-70;

gfast=20;
gslow=20;
gl=2;

beta_m=-1.2;
beta_h=30;
gamma_m=15;
gamma_w=10;
gamma_h=-5;

minf=.5*(1+tanh((V-beta_m)/gamma_m));
winf=.5*(1+tanh((V-beta_w)/gamma_w));
hinf=1/(1+exp(-(V-beta_h)/gamma_h));

tau_w=1/cosh((V-beta_w)/(2*gamma_w));
tau_h=2000;

phi=0.15;

f(1)=(Istim-gfast*minf*h*(V-ENa)-gslow*w*(V-Ek)-gl*(V-El))/C;
f(3)=(hinf-h)/tau_h;

f=f';

end