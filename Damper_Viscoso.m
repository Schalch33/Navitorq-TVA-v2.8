%Silicone Properties
if NI==0.03
    G01=17.3e-4;
    B01=3015;
    a01=2.39;
    a11=386;
    G02=32.7e-4;
    B02=3595;
    a02=2.25;
    a12=480;
elseif NI==0.06
    G01=57.6e-4;
    B01=3072;
    a01=2.21;
    a11=384;
    G02=721e-4;
    B02=2974;
    a02=1.86;
    a12=410;
elseif NI==0.08
    G01=6.0e-4;
    B01=4025;
    a01=2.61;
    a11=555;
    G02=0.35;
    B02=2506;
    a02=1.53;
    a12=298;
elseif NI==0.10
    G01=20.4e-4;
    B01=3590;
    a01=2.25;
    a11=442;
    G02=0.73;
    B02=2332;
    a02=1.48;
    a12=295;
elseif NI==0.15
    G01=21.0e-4;
    B01=3791;
    a01=2.35;
    a11=504;
    G02=1.01;
    B02=2353;
    a02=1.50;
    a12=321;
elseif NI==0.20
    G01=103.0e-4;
    B01=3491;
    a01=2.13;    
    a11=454;
    G02=1.34;
    B02=2356;
    a02=1.54;
    a12=353;
elseif NI==0.30
    G01=726.0e-4;
    B01=3040;
    a01=1.93;
    a11=403;
    G02=7.71;
    B02=2050;
    a02=1.30;
    a12=310;
elseif NI==0.50
    G01=2313.0e-4;
    B01=2820;
    a01=1.82;
    a11=392;
    G02=26.4;
    B02=1760;
    a02=1.11;
    a12=277;
end
k1=B01/(Tol+273);
k2=a01-a11/(Tol+273);
k3=B02/(Tol+273);
k4=a02-a12/(Tol+273);
Gs=G01*exp(k1)*(((w-1)/2)*rotacao/60)^k2;
Gv=G02*exp(k3)*(((w-1)/2)*rotacao/60)^k4;
kt(1)=Gs*S;
c_rel(1)=Gv*S/(2*pi*((w-1)/2)*rotacao/60);

%Heat Dissipation
Q=f*105*am*Ad^1.3*(2*pi*rotacao/60)^0.8*(T0-Tamb); %Iwamoto Equation
%Q=112.1*am*Ad^1.3*(2*pi*rotacao/60)^0.8*(T0-Tamb)*exp(-0.00176*T0); %Hartmann Equation
Q_linha(index_rotacao)=Q;