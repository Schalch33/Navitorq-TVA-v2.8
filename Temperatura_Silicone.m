%Temperature difference TVD housing / ambient
DT0=T0-Tamb;

%Temperature difference between TVD housing internal and esxternal surfaces
DT1=(potencia_damper_global(index_rotacao)/Ad)*sh/50;

%Temperature difference between TVD housing internal surface and silicone film
TETA_anel=TETA_anel+(2*abs(g(Ring_inertia))*cos(((w-1)/2)*OMEGA*t-angle(g(Ring_inertia))));
DELTA_damper=TETA_polia-TETA_anel;
D_sil=max(abs(DELTA_damper))*req/ss*OMEGA;
ALFA_sil=10^(2.629+3.48*0.0001*D_sil);
DT2=(potencia_damper_global(index_rotacao)/Ad)/ALFA_sil;
 
%Temperature difference between silicone film at TVD housing and TVD ring
DTol=(potencia_damper_global(index_rotacao)/Ad)*ss/(2*0.16);

%Silicone mean temperature
Tol=Tamb+DT0+DT1+DT2+2/3*DTol;
T_silicone(index_rotacao)=Tol;