%TVD Hub side
TETA_ordem_cilindro_n=2*abs(g(I_plot+1))*cos(((w-1)/2)*OMEGA*t-angle(g(I_plot+1)));
DELTA_ordem_cilindro_n=TETA_ordem_cilindro_n-TETA_ordem_polia;
torque_ordem_cilindro_n(w-1,index_rotacao)=max(abs(DELTA_ordem_cilindro_n))*kt(I_plot);

TETA_cilindro_n=TETA_cilindro_n+(2*abs(g(I_plot+1))*cos(((w-1)/2)*OMEGA*t-angle(g(I_plot+1))));
DELTA_cilindro_n=TETA_cilindro_n-TETA_polia;
torque_cilindro_n(index_rotacao)=max(abs(DELTA_cilindro_n.*kt(I_plot)+T_front));
torque_polia_max(index_rotacao)=Tcap_polia;

%Flywheel side
TETA_ordem_cilindro_1=2*abs(g(Flywheel-1))*cos(((w-1)/2)*OMEGA*t-angle(g(Flywheel-1)));
DELTA_ordem_volante=TETA_ordem_volante-TETA_ordem_cilindro_1;
torque_ordem_volante(w-1,index_rotacao)=max(abs(DELTA_ordem_volante))*kt(Flywheel-1);

TETA_cilindro_1=TETA_cilindro_1+(2*abs(g(Flywheel-1))*cos(((w-1)/2)*OMEGA*t-angle(g(Flywheel-1))));
DELTA_volante=TETA_volante-TETA_cilindro_1;
torque_volante(index_rotacao)=max(abs(DELTA_volante.*kt(Flywheel-1)-length(ord_ign)*real(Cn(Crankpin(length(ord_ign)),1))+T_front+T_rear));
torque_volante_max(index_rotacao)=Tcap_volante;