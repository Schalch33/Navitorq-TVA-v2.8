%Torque calculation (pressure + inertia) for each cylinder
clear Mt
Mtemp=zeros(1,length(p(1,:)));
ALFA=0;
for w=1:length(p(1,:))
    BETA=asin(((s/2)/L)*sin(ALFA));
    Fg=9.8*p(index_rotacao,w)*1.0197*((pi*(d/10)^2)/4);
    Ftg=Fg*sin(ALFA+BETA)/cos(BETA);
    Fi=-ma*(s/2000)*(2*pi*rotacao/60)^2*(cos(ALFA)+((s/2)/L)*cos(2*ALFA)+...
       (1/4)*((s/2)/L)^3*cos(4*ALFA)+(9/128)*((s/2)/L)^5*cos(6*ALFA));
    Fti=Fi*sin(ALFA+BETA)/cos(BETA);
    Mtemp(w)=(Ftg+Fti)*s/2000;
    ALFA=ALFA+(720/length(p(1,:)))*pi/180;
end
Cn=1/length(Mtemp)*fft(Mtemp);
ALFA=0:(720/length(p(1,:)))*(pi/180):4*pi-(720/length(p(1,:)))*(pi/180);
Mt=zeros(length(ord_ign),length(ALFA));
index_torque=1;
i=sqrt(-1);
for GAMA=0:(720/length(ord_ign))*(pi/180):4*pi-(720/length(p(1,:)))*(pi/180)
    for w=2:25
        for j=1:length(ALFA)
            Mt(index_torque,j)=Mt(index_torque,j)+(Cn(w)*exp(i*((w-1)/2)*(ALFA(j)-GAMA))+conj(Cn(w))*exp(-i*((w-1)/2)*(ALFA(j)-GAMA)));
        end
    end
    index_torque=index_torque+1;
end
Mt=Mt+Cn(1);