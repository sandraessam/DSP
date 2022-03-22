clear all
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
stem(Ns,abs(DFT(H,N)));
title('DFT of Frequency Impulse Response')
subplot(2,1,2)
stem(Ns,abs(fft(H)));
title('FFT of Frequency Impulse Response')
figure(2)
subplot(2,1,1)
stem(Ns,H);
title('Frequency Impulse Response')
subplot(2,1,2)
xk=fft(H,N);
stem(Ns,real(IDFT(xk,N)));
title('IDFT of Frequency Impulse Response')