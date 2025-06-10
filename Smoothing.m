%Smooth curves of the amplitudes per order
x=1:length(maximo_ordem(1,:));
xx=1:0.3:length(maximo_ordem(1,:));
for w=1:24
    yy_ordem(w,:)=interp1(x,maximo_ordem(w,:),xx,'spline');
    yy_ordem_volante(w,:)=interp1(x,maximo_ordem_volante(w,:),xx,'spline');
    yy_torque_ordem_volante(w,:)=interp1(x,torque_ordem_volante(w,:),xx,'spline');
    yy_torque_ordem_cilindro_n(w,:)=interp1(x,torque_ordem_cilindro_n(w,:),xx,'spline');
    if Tipo_damper==2 || Tipo_damper==3 || Tipo_damper==4 || Tipo_damper==5
        yy_potencia_damper_ordem(w,:)=interp1(x,potencia_damper_ordem(w,:),xx,'spline');
    end
    if Tipo_damper==2 || Tipo_damper==3
        yy_tensao_borracha_ordem(w,:)=interp1(x,tensao_borracha_ordem(w,:),xx,'spline');
    end
end
maximo_ordem=abs(yy_ordem);
maximo_ordem_volante=abs(yy_ordem_volante);
torque_ordem_volante=abs(yy_torque_ordem_volante);
torque_ordem_cilindro_n=abs(yy_torque_ordem_cilindro_n);
if Tipo_damper==2 || Tipo_damper==3 || Tipo_damper==4 || Tipo_damper==5
    potencia_damper_ordem=abs(yy_potencia_damper_ordem);
end
if Tipo_damper==2 || Tipo_damper==3
    tensao_borracha_ordem=abs(yy_tensao_borracha_ordem);
end

%Smooth curves of the global amplitudes
yy_global=interp1(x,maximo_global,xx,'spline');
yy_global_volante=interp1(x,maximo_global_volante,xx,'spline');
yy_torque_volante=interp1(x,torque_volante,xx,'spline');
yy_torque_cilindro_n=interp1(x,torque_cilindro_n,xx,'spline');
yy_torque_polia_max=interp1(x,torque_polia_max,xx,'spline');
yy_torque_volante_max=interp1(x,torque_volante_max,xx,'spline');
maximo_global=yy_global;
maximo_global_volante=yy_global_volante;
torque_volante=yy_torque_volante;
torque_cilindro_n=yy_torque_cilindro_n;
torque_polia_max=yy_torque_polia_max;
torque_volante_max=yy_torque_volante_max;
if Tipo_damper==2 || Tipo_damper==3 || Tipo_damper==4 || Tipo_damper==5
	yy_potencia_damper=interp1(x,potencia_damper_global,xx,'spline');
	potencia_damper_global=abs(yy_potencia_damper);
end
if Tipo_damper==2 || Tipo_damper==3
    yy_tensao_borracha=interp1(x,tensao_borracha,xx,'spline');
    tensao_borracha=abs(yy_tensao_borracha);
end

%Smooth curves of the viscous damper limit and silicone temperature
if Tipo_damper==4 || Tipo_damper==5
    yy_Q_linha=interp1(x,Q_linha,xx,'spline');
    Q_linha=yy_Q_linha;
    yy_T_silicone=interp1(x,T_silicone,xx,'spline');
    T_silicone=abs(yy_T_silicone);
end

%Smooth curves of the rubber damper limit
if Tipo_damper==2 || Tipo_damper==3
	yy_limite_borracha=interp1(x,limite_borracha,xx,'spline');
	limite_borracha=yy_limite_borracha;
end

%Smooth curves of the rubber permissibe stress
if Tipo_damper==2 || Tipo_damper==3
	yy_tensao_adm_borracha=interp1(x,tensao_adm_borracha,xx,'spline');
	tensao_adm_borracha=yy_tensao_adm_borracha;
end