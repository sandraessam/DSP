%% PROBLEM3
clear all;
N=30;
Ns=1:30;
X=[1 zeros(1,29)];
Y(1)= 0.0181;
Y(2)= 0.086156;
Y(3)=0.1845
for i=4:N
    Y(i)=0.0181.*X(i)+0.0543.*X(i-1)+0.0543.*X(i-2)+0.0181.*X(i-3)+1.76.*Y(i-1)-1.1829.*Y(i-2)+0.2781.*Y(i-3);
end
figure(1)
H=Y;
subplot(2,1,1)
stem(Ns,H);
title('Frequency Impulse Response')
subplot(2,1,2)
stem(Ns,abs(fft(H)));
title('FFT of Frequency Impulse Response')
a=[1,-1.76,1.1829,-0.2781];
b=[0.0181,0.0543,0.0543,0.0181];
figure(2)
zplane(b,a);
title('Zeros and Poles of Transfer Function')
figure(3)
freqz(b,a);
title('Magntitude and Phase of Transfer Function')
%% it's causal and stable system
x=cos(0.2.*pi.*Ns);
y=conv(x,H);
figure(4)
stem(y);
title('Steady State Response')
Z=roots(b);
P=roots(a);
figure(5)
plot(real(Z),imag(Z),'O');
hold on
plot(real(P),imag(P),'x');
r=1;
angl=0:0.01:2*pi; 
xp=r*cos(angl);
yp=r*sin(angl);
hold on
plot(0+xp,0+yp,'b--');
title('Zeros and Poles of Transfer Function')
ang=0:pi/1023:pi;
for i=1:length(ang)
    hh(i)=(0.0181+0.0543.*exp(-1.*j.*ang(i))+0.0543.*exp(-2.*1.j.*ang(i))+0.0181.*(exp(-3.*1.j.*ang(i))))./(1-1.76.*exp(-1.*1.j.*ang(i))+1.1829.*exp(-2.*1.j.*ang(i))-0.2781.*exp(-3.*1.j.*ang(i)));
end

figure(6)
subplot(2,1,1)
ang=ang./pi;
plot(ang,20.*log10(abs(hh)));
title('Magnitude and phase Of Transfer Function')
[h_f, w_f] = freqz(b,a);
subplot(2,1,2)
plot(ang,rad2deg(angle(hh)));
title(' phase Of Transfer Function')
figure(7)
plot(ang,abs(hh),'b-o')
hold on
plot(w_f./pi,abs(h_f))
legend('my freqz','Matlab frez','r-*')
title('Magnitude of Frequency Impulse Response')


figure(8)
subplot(2,1,1)
stem(abs(fft(H))) 
subplot(2,1,2)
stem(angle(fft(H)))
title('The magnitude and phase frequency response of this filter (using fft.m)')
