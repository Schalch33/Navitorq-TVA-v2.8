%Total Inertia Matrix
Ieq_temp=zeros(1,length(p(1,:)));

ALFA=0;
for j=1:length(p(1,:))
    BETA=asin(((s/2)/L)*sin(ALFA));
    X=(s/2)*cos(ALFA)+L*cos(BETA);
    KAPPA_beta=(s/2)*cos(ALFA)/(L*cos(BETA));
    KAPPA_2x=-(s/2)*sin(ALFA)-KAPPA_beta*(u*sin(BETA)-v*cos(BETA));
    KAPPA_2y= (s/2)*cos(ALFA)-KAPPA_beta*(u*cos(BETA)-v*sin(BETA));
    KAPPA_x=X*tan(BETA);
    ALFA=ALFA+(720/length(p(1,:)))*pi/180;
    Ieq_temp(j)=1e-6*(mb*(KAPPA_2x^2+KAPPA_2y^2) + Ib*KAPPA_beta^2 + mp*KAPPA_x^2);
end

Cn=1/length(Ieq_temp)*fft(Ieq_temp);
ALFA=0:(720/length(p(1,:)))*(pi/180):4*pi-(720/length(p(1,:)))*(pi/180);
Ieq=zeros(length(ord_ign),length(ALFA));
index_torque=1;
i=sqrt(-1);
for GAMA=0:(720/length(ord_ign))*(pi/180):4*pi-(720/length(p(1,:)))*(pi/180)
    for w=2:25
        for j=1:length(ALFA)
            Ieq(index_torque,j)=Ieq(index_torque,j)+(Cn(w)*exp(i*((w-1)/2)*(ALFA(j)-GAMA))+conj(Cn(w))*exp(-i*((w-1)/2)*(ALFA(j)-GAMA)));
        end
    end
    index_torque=index_torque+1;
end
Ieq=Ieq+Cn(1);

I(Crankpin(1),Crankpin(1)) = I(Crankpin(1),Crankpin(1)) + mean(Ieq(1,:));
I(Crankpin(2),Crankpin(2)) = I(Crankpin(2),Crankpin(2)) + mean(Ieq(5,:));
I(Crankpin(3),Crankpin(3)) = I(Crankpin(3),Crankpin(3)) + mean(Ieq(3,:));
I(Crankpin(4),Crankpin(4)) = I(Crankpin(4),Crankpin(4)) + mean(Ieq(6,:));
I(Crankpin(5),Crankpin(5)) = I(Crankpin(5),Crankpin(5)) + mean(Ieq(2,:));
I(Crankpin(6),Crankpin(6)) = I(Crankpin(6),Crankpin(6)) + mean(Ieq(4,:));

%{
figure, plot(ALFA*180/pi, Ieq(1,:), '.m', ALFA*180/pi, Ieq(5,:), '+c', ALFA*180/pi, Ieq(3,:), '*k', ALFA*180/pi, Ieq(6,:), '-.sr', ALFA*180/pi, Ieq(2,:), '-.ob', ALFA*180/pi, Ieq(4,:), '-.dg')
grid on
title('Inertias of the Con Rod and Piston')
xlabel('Crank angle [deg]')
ylabel('[kg.m]')
legend('Cylinder 1', 'Cylinder 2', 'Cylinder 3', 'Cylinder 4', 'Cylinder 5', 'Cylinder 6')
axis([0 800 0 0.02])
%}