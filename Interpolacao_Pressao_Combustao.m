if rpm_max > rpm_input(length(rpm_input))
    p(length(p(:,1))+1,:)=p(length(p(:,1)),:);
    rpm_input(length(rpm_input)+1)=rpm_max;
end

%Finding the angle of PCP and starting all pressure traces with PCP at 0 degrees
for h=1:length(p(:,1))
    Ang=1;
    for k=1:length(p(1,:))
        PCP(h)=max(p(h,:));
        if p(h,k)==PCP(h)
            Ang_PCP(h)=Ang;
        end
        Ang=Ang+720/length(p(1,:));
    end
end
for h=1:length(p(:,1))
    shift=Ang_PCP(h);
    if shift==720
        shift=1;
    end
    for k=1:length(p(1,:))
        p_zero(h,k)=p(h,shift);
        shift=shift+1;
        if shift==length(p(1,:))+1
            shift=1;
        end
    end
end

%Interpolation for intermediate engine speeds
%Pressure trace matrix
rpm_calc=(rpm_min:int_rpm:rpm_max);
for h=1:length(rpm_input)
    for k=1:length(rpm_calc)
        if rpm_input(h)==rpm_calc(k)
            p_zero_matrix(k,:)=p_zero(h,:);
        end
    end
end
for h=1:length(p(1,:))
    w=1;
    for k=2:length(rpm_calc)-1
        p_zero_matrix(k,h)=((p_zero(w,h)-p_zero(w+1,h))*(rpm_calc(k)-rpm_input(w+1)))/(rpm_input(w)-rpm_input(w+1))+p_zero(w+1,h);
        if rpm_input(w+1)==rpm_calc(k)
            w=w+1;
        end
    end
end

%Interpolation of the shift angles for intermediate engine speeds
%Angles of PCP for every calculated engine speed
for h=1:length(Ang_PCP)
    if Ang_PCP(h)>700
        Ang_PCP(h)=Ang_PCP(h)-721; %Correction for PCP angles BTDC
    end
    for k=1:length(rpm_calc)
        if rpm_input(h)==rpm_calc(k)
            Ang_PCP_out(k)=Ang_PCP(h);
        end
    end
end
w=1;
for k=2:length(Ang_PCP_out)-1
    Ang_PCP_out(k)=round(((Ang_PCP(w)-Ang_PCP(w+1))*(rpm_calc(k)-rpm_input(w+1)))/(rpm_input(w)-rpm_input(w+1))+Ang_PCP(w+1));
    if rpm_input(w+1)==rpm_calc(k)
        w=w+1;
    end
end

%Shifting back the pressure traces to original position (advancing the angle)
for h=1:length(p_zero_matrix(:,1))
    shift=722-Ang_PCP_out(h); %Actually: p=0..719 deg
    if Ang_PCP_out(h)==1
        shift=1; %Correction for PCP angles at TDC
    end
    if Ang_PCP_out(h)==0
        Ang_PCP_out(h)=-1; %Correction for PCP angles at TDC
    end
    if Ang_PCP_out(h)<0
        shift=-1*Ang_PCP_out(h); %Correction for PCP angles BTDC
    end
    for k=1:length(p(1,:))
        p_out(h,k)=p_zero_matrix(h,shift);
        shift=shift+1;
        if shift==length(p(1,:))+1
            shift=1;
        end
    end
end

%Final correction for actual engine speeds input (redundancy)
for h=1:length(rpm_input)
    for k=1:length(rpm_calc)
        if rpm_input(h)==rpm_calc(k)
            p_out(k,:)=p(h,:);
        end
    end
end

%Torsional vibration calculations
Step=(rpm_max-rpm_min)/int_rpm+1;
index_rotacao=1;
for rotacao=rpm_min:int_rpm:rpm_max
    p(index_rotacao,:)=p_out(index_rotacao,:);
    Calculo_Torque_Excitacao
    Serie_de_Fourier_Cilindros
    Calculo_Vibracoes_Torcionais
    index_rotacao=index_rotacao+1;
    clc
    Step=Step-1
end