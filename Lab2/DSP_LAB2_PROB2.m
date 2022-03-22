%% PROBLEM2

N=1000;
x=(randn(N,1));
Ns=1:1000;
figure(1)
X=abs(fft(x));
stem(Ns,X);
title('FFT of Gaussian Noise');
a = [1  -0.99 0.9801];
b = [1  -0.1 0.56];
FILTER=filter(b,a,x);
FFT_FILTER=abs(fft(FILTER));
figure(2)
stem(Ns,FFT_FILTER);
title('FFT of Filtered Gaussian Noise');
FS=44100;
sound(FILTER , FS );
figure(3)
freqz(b,a);
title('Frequency Response of Filter');
figure(4)
zplane(b,a)
title('Zeros and Poles of Transfer function')

X=[1 zeros(1,999)];
Y(1)= 1;
Y(2)= 0.89;
for i=3:N
    Y(i)=0.99.*Y(i-1)-0.9801.*Y(i-2)+X(i)-0.1.*X(i-1)+0.56.*X(i-2);
end
figure(5)
H=Y;
subplot(2,1,1)
stem(Ns,H);
title('Frequency Impulse Response')
subplot(2,1,2)
plot(Ns,abs(fft(H)));
title('FFT of Frequency Impulse Response')
