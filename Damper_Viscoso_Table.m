if Tol==0
    Tol=T0;
end
T_find=Tol;
Freq_find=((w-1)/2)*OMEGA/(2*pi);

%Stiffness Interpolation
for k=1:length(Temp_TVD)
    if abs(T_find-Temp_TVD(k)) <= (Temp_TVD(2)-Temp_TVD(1))/2+1
        Temp_pos=k;
        break
    end
end
if Temp_pos==length(Temp_TVD)
    Temp_pos=Temp_pos-1;
end
for j=1:length(Freq_TVD)
    Kt_sil(j)=(T_find-Temp_TVD(Temp_pos+1))*(Stiffness(j,Temp_pos)-Stiffness(j,Temp_pos+1))/(Temp_TVD(Temp_pos)-Temp_TVD(Temp_pos+1))+Stiffness(j,Temp_pos+1);
end
for k=1:length(Freq_TVD)
    if abs(Freq_find-Freq_TVD(k)) <= (Freq_TVD(2)-Freq_TVD(1))/2+1
        Freq_pos=k;
        break
    end
    if k==length(Freq_TVD)
        Freq_pos=k-1;
    end
end
if Freq_pos==length(Freq_TVD)
    Freq_pos=Freq_pos-1;
end
if Freq_find >= max(Freq_TVD)
    Freq_find=max(Freq_TVD);
end
kt(1)=(Freq_find-Freq_TVD(Freq_pos+1))*(Kt_sil(Freq_pos)-Kt_sil(Freq_pos+1))/(Freq_TVD(Freq_pos)-Freq_TVD(Freq_pos+1))+Kt_sil(Freq_pos+1);

%Damping Interpolation
for k=1:length(Temp_TVD)
    if abs(T_find-Temp_TVD(k)) <= (Temp_TVD(2)-Temp_TVD(1))/2+1
        Temp_pos=k;
        break
    end
end
if Temp_pos==length(Temp_TVD)
    Temp_pos=Temp_pos-1;
end
for j=1:length(Freq_TVD)
    Cr_sil(j)=(T_find-Temp_TVD(Temp_pos+1))*(Damping(j,Temp_pos)-Damping(j,Temp_pos+1))/(Temp_TVD(Temp_pos)-Temp_TVD(Temp_pos+1))+Damping(j,Temp_pos+1);
end
for k=1:length(Freq_TVD)
    if abs(Freq_find-Freq_TVD(k)) <= (Freq_TVD(2)-Freq_TVD(1))/2+1
        Freq_pos=k;
        break
    end
    if k==length(Freq_TVD)
        Freq_pos=k-1;
    end
end
if Freq_pos==length(Freq_TVD)
    Freq_pos=Freq_pos-1;
end
c_rel(1)=(Freq_find-Freq_TVD(Freq_pos+1))*(Cr_sil(Freq_pos)-Cr_sil(Freq_pos+1))/(Freq_TVD(Freq_pos)-Freq_TVD(Freq_pos+1))+Cr_sil(Freq_pos+1);

%Heat Dissipation
Q=f*105*am*Ad^1.3*(2*pi*rotacao/60)^0.8*(T0-Tamb); %Iwamoto Equation
%Q=112.1*am*Ad^1.3*(2*pi*rotacao/60)^0.8*(T0-Tamb)*exp(-0.00176*T0); %Hartmann Equation
Q_linha(index_rotacao)=Q;