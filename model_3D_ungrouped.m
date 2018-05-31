function f=model_3D_ungrouped(t,x,beta_w,Istim)

V=x(1);
w=x(2);
yNa=x(3);
yK=x(4);

C=2;

ENa=50;
Ek=-100;
El=-70;

gfast=20;
gl=2;
gslow=20;
gsubNa=0;
gsubK=0;

beta_m=-1.2;
%beta_w=-13;
beta_y=-23;
gamma_m=18;
gamma_w=10;
gamma_y=9;

minf=.5*(1+tanh((V-beta_m)/gamma_m));
winf=.5*(1+tanh((V-beta_w)/gamma_w));
yna_inf=.5*(1+tanh((V-beta_y)/gamma_y));
yk_inf=.5*(1+tanh((V-beta_y)/gamma_y));

tau_w=1/cosh((V-beta_w)/(2*gamma_w));
tauyna=1/cosh((V-beta_y)/(2*gamma_y));
tauyk=1/cosh((V-beta_y)/(2*gamma_y));

phi_w=0.15;
phi_yna=0.3; %inward current
phi_yk=0.15;

f(1)=(Istim-gfast*minf*(V-ENa)-gk*w*(V-Ek)-gl*(V-El)-gsubNa*yNa*(V-ENa)-gsubK*yK*(V-Ek))/C;
f(2)=phi_w*(winf-w)/tau_w;
f(3)=phi_yna*(yna_inf-yNa)/tauyna;
f(4)=phi_yk*(yk_inf-yK)/tauyk;

f=f';

end