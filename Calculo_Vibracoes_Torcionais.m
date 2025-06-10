i=sqrt(-1);
Tol=0;
TETA_polia=0;
TETA_cilindro_n=0;
TETA_cilindro_1=0;
TETA_volante=0;
TETA_anel=0;
potencia_damper=0;
OMEGA=2*pi*rotacao/60;
b1=zeros(length(I),1);
t=linspace(0,2*60/rotacao,720);
TETA=zeros(length(I),length(t));
TETA_D=rotacao*ones(length(I),length(t));
TETA_D2=zeros(length(I),length(t));
for w=2:25
    Matriz_Amortecimento_Rigidez
    b2=I\Cn(1:length(I),w);
    b=[b1;b2];
    F=i*((w-1)/2)*OMEGA*eye(2*length(I),2*length(I))-A;
    g=F\b;
    %TVD Hub
    TETA_ordem_polia=2*abs(g(I_plot))*cos(((w-1)/2)*OMEGA*t-angle(g(I_plot)));
    maximo_ordem(w-1,index_rotacao)=180/pi*max(TETA_ordem_polia);
    TETA_polia=TETA_polia+(2*abs(g(I_plot))*cos(((w-1)/2)*OMEGA*t-angle(g(I_plot))));
    %Flywheel
    TETA_ordem_volante=2*abs(g(Flywheel))*cos(((w-1)/2)*OMEGA*t-angle(g(Flywheel)));
    maximo_ordem_volante(w-1,index_rotacao)=180/pi*max(TETA_ordem_volante);
    TETA_volante=TETA_volante+(2*abs(g(Flywheel))*cos(((w-1)/2)*OMEGA*t-angle(g(Flywheel))));
    Torque_Extremidades
    if Tipo_damper==2 || Tipo_damper==3 || Tipo_damper==4 || Tipo_damper==5
        Potencia_Damper
        if Tipo_damper==4 || Tipo_damper==5
            Temperatura_Silicone
        end
    end
    if Tipo_damper==2 || Tipo_damper==3
        Tensao_Borracha
    end
    for k=1:length(I)
        TETA(k,:)=TETA(k,:)+(2*abs(g(k))*cos(((w-1)/2)*OMEGA*t-angle(g(k))));
        TETA_D(k,:)=TETA_D(k,:)-60/(2*pi)*(2*abs(g(k))*((w-1)/2)*OMEGA*sin(((w-1)/2)*OMEGA*t-angle(g(k))));
        TETA_D2(k,:)=TETA_D2(k,:)-(2*abs(g(k))*((w-1)/2)^2*OMEGA^2*cos(((w-1)/2)*OMEGA*t-angle(g(k))));
    end
end

%Torque calculations
%Constant terms
Cn(:,1)=-1*Cn(:,1);
Co_sum(1,1)=real(Cn(1,1))+T_front;
for k=2:length(I)
    Co_sum(k,1)=Co_sum(k-1,1)+real(Cn(k,1));
end
%Instantaneous torques
for k=1:length(I)-1
    Torque_time(k,:)=(TETA(k+1,:)-TETA(k,:)).*kt(k)+Co_sum(k,1);
end
Torque_time(Flywheel-1,:)=Torque_time(Flywheel-1,:)+T_rear;
%Updating the instantaneous torque matrix for branched systems
if brch~=0
    for k=1:length(brch)
        Torque_time(brch(k)+1,:)=(TETA(brch(k)+2,:)-TETA(brch(k),:)).*kt(brch(k)+1)+Co_sum(brch(k)+1,1);
        Torque_time(Free_inertia(k),:)=(TETA(Free_inertia(k)+1,:)-TETA(brch(k)+1,:)).*kt(Free_inertia(k))+Co_sum(Free_inertia(k),1);
    end
end
%Maximum torque for each engine speed
for k=1:length(I)-1
    Torque_freq(k,index_rotacao)=max(abs(Torque_time(k,:)));
end
Co_sum(length(I),1)=Co_sum(length(I),1)+T_rear;

%Including static displacements (Calculated only for inertias of the engine up to the flywheel)
TETA_est(Flywheel)=0;
for h=Flywheel-1:-1:1
    TETA_est(h)=TETA_est(h+1)+Co_sum(h)/kt(h);
end
for h=Flywheel+1:length(I)
    TETA_est(h)=TETA_est(Flywheel);
end
for k=1:length(I)
    TETA(k,:)=180/pi*(TETA(k,:)-TETA_est(k));
end

%Synthesis TVD hub
max_global(index_rotacao)=180/pi*max(TETA_polia);
min_global(index_rotacao)=180/pi*min(TETA_polia);
maximo_global(index_rotacao)=(max_global(index_rotacao)-min_global(index_rotacao))/2;
%Synthesis Flywheel
max_global_volante(index_rotacao)=180/pi*max(TETA_volante);
min_global_volante(index_rotacao)=180/pi*min(TETA_volante);
maximo_global_volante(index_rotacao)=(max_global_volante(index_rotacao)-min_global_volante(index_rotacao))/2;

Speed=[num2str(rotacao),' rpm'];
DATA_OUTPUT_TIME(index_rotacao)=struct('Engine_Speed',Speed,'Time',t,'Inertia_Displacement',TETA,'Inertia_Velocity',TETA_D,'Inertia_Acceleration',TETA_D2,'Instantaneous_Torque',Torque_time,'Interpolated_Pressure_Trace',p(index_rotacao,:));