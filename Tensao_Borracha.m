%Rubber Stress - Order
TETA_ordem_anel=2*abs(g(Ring_inertia))*cos(((w-1)/2)*OMEGA*t-angle(g(Ring_inertia)));
DELTA_ordem_anel=TETA_ordem_polia-TETA_ordem_anel;
tensao_borracha_ordem(w-1,index_rotacao)=max(abs(DELTA_ordem_anel))*kt(Ring_stiff)/(Wt*1e+6);

%Rubber Stress - Synthesis
TETA_anel=TETA_anel+(2*abs(g(Ring_inertia))*cos(((w-1)/2)*OMEGA*t-angle(g(Ring_inertia))));
DELTA_anel=TETA_polia-TETA_anel;
tensao_borracha(index_rotacao)=(max(abs(DELTA_anel.*kt(Ring_stiff))+T_front))/(Wt*1e+6);
tensao_adm_borracha(index_rotacao)=0.4001;

%Maximum Rubber Strain [%]
deformacao_borracha=(max(tensao_borracha)*1e+6*Wt/kt(Ring_stiff))*Denung_Fact*100;