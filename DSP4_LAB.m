[x,fs]=audioread('C:\Users\Copy Center\Downloads\a.wav')
t=1/fs;
n=-(length(x)-1)/2:1:(length(x)-1)/2;
%%Phase1
xf=abs(fft(x));
figure(1)
subplot(4,1,1)
plot(n.*t,x);
title('samples in time domain in t')
subplot(4,1,2)
plot(n.*2*pi*fs,xf);
title('samples in frequency domain in W')
subplot(4,1,3)
plot(n,x);
title('samples in time domain in n')
subplot(4,1,4)
plot(n,xf);
title('samples in frequency domain in w')
M=[4,8,16,32]
Sampled_x=downsample(x,M(:,3));
figure(2)
plot(Sampled_x);
%% phase 2
count=0;
C=1;
Recieved=[];
for  i=1:160:length(x)-1
     
 X=x(i:160+i-1);
 H0=[1/2 1/2];
 H1=[1/2 -1/2];
 G0=2*H0;
 G1=-2*H1;
 x_conv0=conv(X,H0);
 V0=downsample(x_conv0,2);
 P0=sum((V0.^2));
 x_conv1=conv(X,H1);
 V1=downsample(x_conv1,2);
 P1=sum((V1.^2));
 p=P0/P1;
if (P0<10*P1)
      V0(1:length(V0))=0;
      count=count+1;
 elseif (P0>10*P1)
      V1(1:length(V1))=0;
      count=count+1;
 end
  upsampled0=upsample(V0,2);
  upsampled1=upsample(V1,2);
  Y0=conv(upsampled0,G0);
  Y1=conv(upsampled1,G1);
  Recieved(C:length(Y1)+C-1,1)= Y0+Y1;
  C=C+length(Y1);
end 
%% phase 3
figure(3)
subplot(2,2,1)
plot(abs(fft(x)))
title('original in frequency domain')
subplot(2,2,2)
plot(x)
title('original in time domain')
subplot(2,2,3)
plot(abs(fft(y)))
title('original in frequency domain')
subplot(2,2,4)
plot(y)
title('Recieved in time domain')
sound(Recieved)
Commpression_ratio=((length(x)-1)-count*80)/(length(x)-1);
Commpression_ratio