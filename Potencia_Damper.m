%TVD Load - Order
OMEGA_anel=-2*abs(g(Ring_inertia))*((w-1)/2)*OMEGA*sin(((w-1)/2)*OMEGA*t-angle(g(Ring_inertia)));
OMEGA_polia=-2*abs(g(I_plot))*((w-1)/2)*OMEGA*sin(((w-1)/2)*OMEGA*t-angle(g(I_plot)));
DELTA_OMEGA=OMEGA_polia-OMEGA_anel;
potencia_damper_ordem_n=mean((c_rel(Ring_stiff)*DELTA_OMEGA).*DELTA_OMEGA);
potencia_damper_ordem(w-1,index_rotacao)=potencia_damper_ordem_n;

%TVD Load - Synthesis
OMEGA_anel=-2*abs(g(Ring_inertia))*((w-1)/2)*OMEGA*sin(((w-1)/2)*OMEGA*t-angle(g(Ring_inertia)));
OMEGA_polia=-2*abs(g(I_plot))*((w-1)/2)*OMEGA*sin(((w-1)/2)*OMEGA*t-angle(g(I_plot)));
DELTA_OMEGA=OMEGA_polia-OMEGA_anel;
potencia_damper=potencia_damper+mean((c_rel(Ring_stiff)*DELTA_OMEGA).*DELTA_OMEGA);
potencia_damper_global(index_rotacao)=potencia_damper;

%Rubber TVD limit
if Tipo_damper==2 || Tipo_damper==3
    limite_borracha(index_rotacao)=Pot_max*V_borracha;
end