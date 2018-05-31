function f=model_2D_both(t,x,beta_w,Istim)
V=x(1);
w=x(2);

C=2;

ENa=50;
Ek=-100;
El=-70;

gfast=20;
gslow=20;
gl=2;

beta_m=-1.2;
gamma_m=18;
gamma_w=10;

minf=.5*(1+tanh((V-beta_m)/gamma_m));
winf=.5*(1+tanh((V-beta_w)/gamma_w));
tau_w=1/cosh((V-beta_w)/(2*gamma_w));

phi=0.15;

f(1)=(Istim-gfast*minf*(V-ENa)-gslow*w*(V-Ek)-gl*(V-El))/C; 
f(2)=phi*(winf-w)/tau_w;

f=f';

end