clear Cn
if length(ord_ign)==3
	Cn(Crankpin(1),:)=1/length(Mt)*fft(Mt(1,:)); %Cylinder 1
	Cn(Crankpin(2),:)=1/length(Mt)*fft(Mt(3,:)); %Cylinder 2
	Cn(Crankpin(3),:)=1/length(Mt)*fft(Mt(2,:)); %Cylinder 3
	Cn(length(I),:)=0;
end

if length(ord_ign)==4
	Cn(Crankpin(1),:)=1/length(Mt)*fft(Mt(1,:)); %Cylinder 1
	Cn(Crankpin(2),:)=1/length(Mt)*fft(Mt(4,:)); %Cylinder 2
	Cn(Crankpin(3),:)=1/length(Mt)*fft(Mt(2,:)); %Cylinder 3
	Cn(Crankpin(4),:)=1/length(Mt)*fft(Mt(3,:)); %Cylinder 4
	Cn(length(I),:)=0;
end

if length(ord_ign)==6
  	Cn(Crankpin(1),:)=1/length(Mt)*fft(Mt(1,:)); %Cylinder 1
  	Cn(Crankpin(2),:)=1/length(Mt)*fft(Mt(5,:)); %Cylinder 2
	Cn(Crankpin(3),:)=1/length(Mt)*fft(Mt(3,:)); %Cylinder 3
	Cn(Crankpin(4),:)=1/length(Mt)*fft(Mt(6,:)); %Cylinder 4
	Cn(Crankpin(5),:)=1/length(Mt)*fft(Mt(2,:)); %Cylinder 5
	Cn(Crankpin(6),:)=1/length(Mt)*fft(Mt(4,:)); %Cylinder 6
	Cn(length(I),:)=0;
end

if length(ord_ign)==8
  	Cn(Crankpin(1),:)=1/length(Mt)*fft(Mt(1,:)); %Cylinder 1
  	Cn(Crankpin(2),:)=1/length(Mt)*fft(Mt(2,:)); %Cylinder 2
	Cn(Crankpin(3),:)=1/length(Mt)*fft(Mt(4,:)); %Cylinder 3
	Cn(Crankpin(4),:)=1/length(Mt)*fft(Mt(5,:)); %Cylinder 4
	Cn(Crankpin(5),:)=1/length(Mt)*fft(Mt(6,:)); %Cylinder 5
	Cn(Crankpin(6),:)=1/length(Mt)*fft(Mt(7,:)); %Cylinder 6
    Cn(Crankpin(7),:)=1/length(Mt)*fft(Mt(3,:)); %Cylinder 7
    Cn(Crankpin(8),:)=1/length(Mt)*fft(Mt(8,:)); %Cylinder 8
	Cn(length(I),:)=0;
end