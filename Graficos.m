%Torsional Vibration Amplitudes at TVD Hub
figure
maximo_ordem=transpose(maximo_ordem);
rpm=linspace(rpm_min,rpm_max,length(maximo_ordem(:,1)));
plot(rpm,maximo_ordem(:,1),'b-')
hold on
plot(rpm,maximo_ordem(:,2),'g-')
hold on
plot(rpm,maximo_ordem(:,3),'r-')
hold on
plot(rpm,maximo_ordem(:,4),'c-')
hold on
plot(rpm,maximo_ordem(:,5),'m-')
hold on
plot(rpm,maximo_ordem(:,6),'y-')
hold on
plot(rpm,maximo_ordem(:,7),'k-')
hold on
plot(rpm,maximo_ordem(:,8),'b:')
hold on
plot(rpm,maximo_ordem(:,9),'g:')
hold on
plot(rpm,maximo_ordem(:,10),'r:')
hold on
plot(rpm,maximo_ordem(:,11),'c:')
hold on
plot(rpm,maximo_ordem(:,12),'m:')
hold on
plot(rpm,maximo_ordem(:,13),'y:')
hold on
plot(rpm,maximo_ordem(:,14),'k:')
hold on
plot(rpm,maximo_ordem(:,15),'g:.')
hold on
plot(rpm,maximo_ordem(:,16),'r:.')
hold on
plot(rpm,maximo_ordem(:,17),'c:.')
hold on
plot(rpm,maximo_ordem(:,18),'m:.')
hold on
plot(rpm,maximo_ordem(:,19),'y:.')
hold on
plot(rpm,maximo_ordem(:,20),'k:.')
hold on
plot(rpm,maximo_ordem(:,21),'b-.')
hold on
plot(rpm,maximo_ordem(:,22),'g-.')
hold on
plot(rpm,maximo_ordem(:,23),'r-.')
hold on
plot(rpm,maximo_ordem(:,24),'c-.')
hold on
plot(rpm,maximo_global,'b.-')
hold on
grid on
title('Torsional vibrations amplitudes at TVD hub')
xlabel('Engine speed [rpm]')
ylabel('Amplitude [deg]')
legend('0,5','1','1,5','2','2,5','3','3,5','4','4,5','5','5,5','6','6,5','7','7,5','8','8,5','9','9,5','10','10,5','11','11,5','12','Synthesis')
hold off

%Torsional Vibration Amplitudes at Flywheel
figure
maximo_ordem_volante=transpose(maximo_ordem_volante);
rpm=linspace(rpm_min,rpm_max,length(maximo_ordem_volante(:,1)));
plot(rpm,maximo_ordem_volante(:,1),'b-')
hold on
plot(rpm,maximo_ordem_volante(:,2),'g-')
hold on
plot(rpm,maximo_ordem_volante(:,3),'r-')
hold on
plot(rpm,maximo_ordem_volante(:,4),'c-')
hold on
plot(rpm,maximo_ordem_volante(:,5),'m-')
hold on
plot(rpm,maximo_ordem_volante(:,6),'y-')
hold on
plot(rpm,maximo_ordem_volante(:,7),'k-')
hold on
plot(rpm,maximo_ordem_volante(:,8),'b:')
hold on
plot(rpm,maximo_ordem_volante(:,9),'g:')
hold on
plot(rpm,maximo_ordem_volante(:,10),'r:')
hold on
plot(rpm,maximo_ordem_volante(:,11),'c:')
hold on
plot(rpm,maximo_ordem_volante(:,12),'m:')
hold on
plot(rpm,maximo_ordem_volante(:,13),'y:')
hold on
plot(rpm,maximo_ordem_volante(:,14),'k:')
hold on
plot(rpm,maximo_ordem_volante(:,15),'g:.')
hold on
plot(rpm,maximo_ordem_volante(:,16),'r:.')
hold on
plot(rpm,maximo_ordem_volante(:,17),'c:.')
hold on
plot(rpm,maximo_ordem_volante(:,18),'m:.')
hold on
plot(rpm,maximo_ordem_volante(:,19),'y:.')
hold on
plot(rpm,maximo_ordem_volante(:,20),'k:.')
hold on
plot(rpm,maximo_ordem_volante(:,21),'b-.')
hold on
plot(rpm,maximo_ordem_volante(:,22),'g-.')
hold on
plot(rpm,maximo_ordem_volante(:,23),'r-.')
hold on
plot(rpm,maximo_ordem_volante(:,24),'c-.')
hold on
plot(rpm,maximo_global_volante,'b.-')
hold on
grid on
title('Torsional vibrations amplitudes at flywheel')
xlabel('Engine speed [rpm]')
ylabel('Amplitude [deg]')
legend('0,5','1','1,5','2','2,5','3','3,5','4','4,5','5','5,5','6','6,5','7','7,5','8','8,5','9','9,5','10','10,5','11','11,5','12','Synthesis')
hold off

%Torque at Flywheel
figure
torque_ordem_volante=transpose(torque_ordem_volante);
plot(rpm,torque_ordem_volante(:,1),'b-')
hold on
plot(rpm,torque_ordem_volante(:,2),'g-')
hold on
plot(rpm,torque_ordem_volante(:,3),'r-')
hold on
plot(rpm,torque_ordem_volante(:,4),'c-')
hold on
plot(rpm,torque_ordem_volante(:,5),'m-')
hold on
plot(rpm,torque_ordem_volante(:,6),'y-')
hold on
plot(rpm,torque_ordem_volante(:,7),'k-')
hold on
plot(rpm,torque_ordem_volante(:,8),'b:')
hold on
plot(rpm,torque_ordem_volante(:,9),'g:')
hold on
plot(rpm,torque_ordem_volante(:,10),'r:')
hold on
plot(rpm,torque_ordem_volante(:,11),'c:')
hold on
plot(rpm,torque_ordem_volante(:,12),'m:')
hold on
plot(rpm,torque_ordem_volante(:,13),'y:')
hold on
plot(rpm,torque_ordem_volante(:,14),'k:')
hold on
plot(rpm,torque_ordem_volante(:,15),'g:.')
hold on
plot(rpm,torque_ordem_volante(:,16),'r:.')
hold on
plot(rpm,torque_ordem_volante(:,17),'c:.')
hold on
plot(rpm,torque_ordem_volante(:,18),'m:.')
hold on
plot(rpm,torque_ordem_volante(:,19),'y:.')
hold on
plot(rpm,torque_ordem_volante(:,20),'k:.')
hold on
plot(rpm,torque_ordem_volante(:,21),'b-.')
hold on
plot(rpm,torque_ordem_volante(:,22),'g-.')
hold on
plot(rpm,torque_ordem_volante(:,23),'r-.')
hold on
plot(rpm,torque_ordem_volante(:,24),'c-.')
hold on
plot(rpm,torque_volante,'b.-')
hold on
plot(rpm,torque_volante_max,'k.-')
grid on
title('Crankshaft rear end actuating torque')
xlabel('Engine speed [rpm]')
ylabel('Torque [N.m]')
legend('0,5','1','1,5','2','2,5','3','3,5','4','4,5','5','5,5','6','6,5','7','7,5','8','8,5','9','9,5','10','10,5','11','11,5','12','Synthesis','Permissible')
hold off

%Torque at TVD hub
figure
torque_ordem_cilindro_n=transpose(torque_ordem_cilindro_n);
plot(rpm,torque_ordem_cilindro_n(:,1),'b-')
hold on
plot(rpm,torque_ordem_cilindro_n(:,2),'g-')
hold on
plot(rpm,torque_ordem_cilindro_n(:,3),'r-')
hold on
plot(rpm,torque_ordem_cilindro_n(:,4),'c-')
hold on
plot(rpm,torque_ordem_cilindro_n(:,5),'m-')
hold on
plot(rpm,torque_ordem_cilindro_n(:,6),'y-')
hold on
plot(rpm,torque_ordem_cilindro_n(:,7),'k-')
hold on
plot(rpm,torque_ordem_cilindro_n(:,8),'b:')
hold on
plot(rpm,torque_ordem_cilindro_n(:,9),'g:')
hold on
plot(rpm,torque_ordem_cilindro_n(:,10),'r:')
hold on
plot(rpm,torque_ordem_cilindro_n(:,11),'c:')
hold on
plot(rpm,torque_ordem_cilindro_n(:,12),'m:')
hold on
plot(rpm,torque_ordem_cilindro_n(:,13),'y:')
hold on
plot(rpm,torque_ordem_cilindro_n(:,14),'k:')
hold on
plot(rpm,torque_ordem_cilindro_n(:,15),'g:.')
hold on
plot(rpm,torque_ordem_cilindro_n(:,16),'r:.')
hold on
plot(rpm,torque_ordem_cilindro_n(:,17),'c:.')
hold on
plot(rpm,torque_ordem_cilindro_n(:,18),'m:.')
hold on
plot(rpm,torque_ordem_cilindro_n(:,19),'y:.')
hold on
plot(rpm,torque_ordem_cilindro_n(:,20),'k:.')
hold on
plot(rpm,torque_ordem_cilindro_n(:,21),'b-.')
hold on
plot(rpm,torque_ordem_cilindro_n(:,22),'g-.')
hold on
plot(rpm,torque_ordem_cilindro_n(:,23),'r-.')
hold on
plot(rpm,torque_ordem_cilindro_n(:,24),'c-.')
hold on
plot(rpm,torque_cilindro_n,'b.-')
hold on
plot(rpm,torque_polia_max,'k.-')
grid on
title('Crankshaft front end actuating torque')
xlabel('Engine speed [rpm]')
ylabel('Torque [N.m]')
legend('0,5','1','1,5','2','2,5','3','3,5','4','4,5','5','5,5','6','6,5','7','7,5','8','8,5','9','9,5','10','10,5','11','11,5','12','Synthesis','Permissible')
hold off

%TVD Load
if Tipo_damper==2 || Tipo_damper==3 || Tipo_damper==4 || Tipo_damper==5
	figure
    potencia_damper_ordem=transpose(potencia_damper_ordem);
	plot(rpm,potencia_damper_ordem(:,1),'b-')
	hold on
	plot(rpm,potencia_damper_ordem(:,2),'g-')
	hold on
	plot(rpm,potencia_damper_ordem(:,3),'r-')
	hold on
	plot(rpm,potencia_damper_ordem(:,4),'c-')
	hold on
	plot(rpm,potencia_damper_ordem(:,5),'m-')
	hold on
	plot(rpm,potencia_damper_ordem(:,6),'y-')
	hold on
	plot(rpm,potencia_damper_ordem(:,7),'k-')
	hold on
	plot(rpm,potencia_damper_ordem(:,8),'b:')
	hold on
	plot(rpm,potencia_damper_ordem(:,9),'g:')
	hold on
	plot(rpm,potencia_damper_ordem(:,10),'r:')
	hold on
	plot(rpm,potencia_damper_ordem(:,11),'c:')
	hold on
	plot(rpm,potencia_damper_ordem(:,12),'m:')
	hold on
	plot(rpm,potencia_damper_ordem(:,13),'y:')
	hold on
	plot(rpm,potencia_damper_ordem(:,14),'k:')
	hold on
	plot(rpm,potencia_damper_ordem(:,15),'g:.')
	hold on
	plot(rpm,potencia_damper_ordem(:,16),'r:.')
	hold on
	plot(rpm,potencia_damper_ordem(:,17),'c:.')
	hold on
	plot(rpm,potencia_damper_ordem(:,18),'m:.')
	hold on
	plot(rpm,potencia_damper_ordem(:,19),'y:.')
	hold on
	plot(rpm,potencia_damper_ordem(:,20),'k:.')
	hold on
	plot(rpm,potencia_damper_ordem(:,21),'b-.')
	hold on
	plot(rpm,potencia_damper_ordem(:,22),'g-.')
	hold on
	plot(rpm,potencia_damper_ordem(:,23),'r-.')
	hold on
	plot(rpm,potencia_damper_ordem(:,24),'c-.')
	hold on
	plot(rpm,potencia_damper_global,'b.-')
	grid on
	title('Damper load')
	xlabel('Engine speed [rpm]')
	ylabel('[W]')
    hold on
    if Tipo_damper==2 || Tipo_damper==3
        plot(rpm,limite_borracha,'k.-')
        legend('0,5','1','1,5','2','2,5','3','3,5','4','4,5','5','5,5','6','6,5','7','7,5','8','8,5','9','9,5','10','10,5','11','11,5','12','Synthesis','Permissible')
    end
	if Tipo_damper==4 || Tipo_damper==5
        plot(rpm,Q_linha,'k.-')
        legend('0,5','1','1,5','2','2,5','3','3,5','4','4,5','5','5,5','6','6,5','7','7,5','8','8,5','9','9,5','10','10,5','11','11,5','12','Synthesis','Permissible')
        figure
        plot(rpm,T_silicone,'b.-')
        grid on
        title('Silicon mean temperature')
        xlabel('Engine speed [rpm]')
        ylabel('[°C]')
    else
	hold off
	end
end

%Rubber Shear Stress
if Tipo_damper==2 || Tipo_damper==3
    figure
    tensao_borracha_ordem=transpose(tensao_borracha_ordem);
	plot(rpm,tensao_borracha_ordem(:,1),'b-')
	hold on
	plot(rpm,tensao_borracha_ordem(:,2),'g-')
	hold on
	plot(rpm,tensao_borracha_ordem(:,3),'r-')
	hold on
	plot(rpm,tensao_borracha_ordem(:,4),'c-')
	hold on
	plot(rpm,tensao_borracha_ordem(:,5),'m-')
	hold on
	plot(rpm,tensao_borracha_ordem(:,6),'y-')
	hold on
	plot(rpm,tensao_borracha_ordem(:,7),'k-')
	hold on
	plot(rpm,tensao_borracha_ordem(:,8),'b:')
	hold on
	plot(rpm,tensao_borracha_ordem(:,9),'g:')
	hold on
	plot(rpm,tensao_borracha_ordem(:,10),'r:')
	hold on
	plot(rpm,tensao_borracha_ordem(:,11),'c:')
	hold on
	plot(rpm,tensao_borracha_ordem(:,12),'m:')
	hold on
	plot(rpm,tensao_borracha_ordem(:,13),'y:')
	hold on
	plot(rpm,tensao_borracha_ordem(:,14),'k:')
	hold on
	plot(rpm,tensao_borracha_ordem(:,15),'g:.')
	hold on
	plot(rpm,tensao_borracha_ordem(:,16),'r:.')
	hold on
	plot(rpm,tensao_borracha_ordem(:,17),'c:.')
	hold on
	plot(rpm,tensao_borracha_ordem(:,18),'m:.')
	hold on
	plot(rpm,tensao_borracha_ordem(:,19),'y:.')
	hold on
	plot(rpm,tensao_borracha_ordem(:,20),'k:.')
	hold on
	plot(rpm,tensao_borracha_ordem(:,21),'b-.')
	hold on
	plot(rpm,tensao_borracha_ordem(:,22),'g-.')
	hold on
	plot(rpm,tensao_borracha_ordem(:,23),'r-.')
	hold on
	plot(rpm,tensao_borracha_ordem(:,24),'c-.')
	hold on
	plot(rpm,tensao_borracha,'b.-')
	grid on
    plot(rpm,tensao_adm_borracha,'k.-')
    texto=['Rubber maximum deformation: ',num2str(deformacao_borracha),'%'];
    text(1250,max(tensao_adm_borracha)-0.02,texto)
    legend('0,5','1','1,5','2','2,5','3','3,5','4','4,5','5','5,5','6','6,5','7','7,5','8','8,5','9','9,5','10','10,5','11','11,5','12','Synthesis','Permissible')
    title('Rubber shear stress')
	xlabel('Engine speed [rpm]')
	ylabel('[MPa]')
    hold off
end