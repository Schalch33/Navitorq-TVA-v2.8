%Stiffness Matrix
%Main diagonal
Kt(1,1)=kt(1);
Kt(length(I),length(I))=kt(length(I)-1);
for j=2:length(I)-1
    Kt(j,j)=kt(j-1)+kt(j);
end
%Side diagonals
for j=1:length(I)-1
    Kt(j,1+j)=-kt(j);
    Kt(1+j,j)=-kt(j);
end
%Branch matrix
if brch~=0
    for k=1:length(brch)
        Kt(brch(k),brch(k))=kt(brch(k)-1)+kt(brch(k))+kt(brch(k)+1);
        Kt(brch(k),brch(k)+1)=-kt(brch(k));
        Kt(brch(k),brch(k)+2)=-kt(brch(k)+1);
        Kt(brch(k)+1,brch(k))=-kt(brch(k));
        Kt(brch(k)+1,brch(k)+1)=kt(brch(k))+kt(Free_inertia(k));
        Kt(brch(k)+1,brch(k)+2)=0;
        Kt(brch(k)+2,brch(k))=-kt(brch(k)+1);
        Kt(brch(k)+2,brch(k)+1)=0;
        Kt(brch(k)+2,brch(k)+2)=kt(brch(k)+1)+kt(brch(k)+2);
        Kt(brch(k)+1,Free_inertia(k)+1)=-kt(Free_inertia(k));
        Kt(Free_inertia(k)+1,brch(k)+1)=-kt(Free_inertia(k));
        Kt(Free_inertia(k),Free_inertia(k))=kt(Free_inertia(k)-1);
        Kt(Free_inertia(k)+1,Free_inertia(k))=0;
        Kt(Free_inertia(k),Free_inertia(k)+1)=0;
    end
end

%Damping Matrix
for j=1:length(I)-1
    c_rel(j)=d_f(j)*kt(j)/(2*pi*((w-1)/2)*rotacao/60);
end
if Tipo_damper==2
    c_rel(1)=d_f(1)*kt(1)/(2*pi*((w-1)/2)*rotacao/60);
elseif Tipo_damper==3
    c_rel(1)=d_f(1)*kt(1)/(2*pi*((w-1)/2)*rotacao/60);
    c_rel(3)=d_f(3)*kt(3)/(2*pi*((w-1)/2)*rotacao/60);
elseif Tipo_damper==4
    if Viscous_TVD_Calc==1
        Damper_Viscoso
    elseif Viscous_TVD_Calc==2
        Damper_Viscoso_Table
    end
elseif Tipo_damper==5
    if Viscous_TVD_Calc==1
        Damper_Viscoso
    elseif Viscous_TVD_Calc==2
        Damper_Viscoso_Table
    end
    c_rel(3)=d_f(3)*kt(3)/(2*pi*((w-1)/2)*rotacao/60);
end

%Main diagonal
Cr(1,1)=c_rel(1);
Cr(length(I),length(I))=c_rel(length(I)-1);
for j=2:length(I)-1
    Cr(j,j)=c_rel(j-1)+c_rel(j);
end
%Side diagonals
for j=1:length(I)-1
    Cr(j,1+j)=-c_rel(j);
    Cr(1+j,j)=-c_rel(j);
end
%Branch matrix
if brch~=0
    for k=1:length(brch)
        Cr(brch(k),brch(k))=c_rel(brch(k)-1)+c_rel(brch(k))+c_rel(brch(k)+1);
        Cr(brch(k),brch(k)+1)=-c_rel(brch(k));
        Cr(brch(k),brch(k)+2)=-c_rel(brch(k)+1);
        Cr(brch(k)+1,brch(k))=-c_rel(brch(k));
        Cr(brch(k)+1,brch(k)+1)=c_rel(brch(k))+c_rel(Free_inertia(k));
        Cr(brch(k)+1,brch(k)+2)=0;
        Cr(brch(k)+2,brch(k))=-c_rel(brch(k)+1);
        Cr(brch(k)+2,brch(k)+1)=0;
        Cr(brch(k)+2,brch(k)+2)=c_rel(brch(k)+1)+c_rel(brch(k)+2);
        Cr(brch(k)+1,Free_inertia(k)+1)=-c_rel(Free_inertia(k));
        Cr(Free_inertia(k)+1,brch(k)+1)=-c_rel(Free_inertia(k));
        Cr(Free_inertia(k),Free_inertia(k))=c_rel(Free_inertia(k)-1);
        Cr(Free_inertia(k)+1,Free_inertia(k))=0;
        Cr(Free_inertia(k),Free_inertia(k)+1)=0;
    end
end

%Absolute Damping Matrix
Ca=diag(c_abs);

%Damping Matrix
C=Ca+Cr;

%State Equation Matrix
A1=zeros(length(I),length(I));
A2=eye(length(I));
A3=-inv(I)*Kt;
A4=-inv(I)*C;
A=[A1 A2;A3 A4];