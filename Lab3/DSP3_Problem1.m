rng(1611)
clear all
clc
%% Specify specs
N=5; %Order Number
Wc=1/4; %Cutoff Frequency

%Order 5 and frequency 0.25*pi radians/sample
[B,A]=butter(N,Wc,'Low');
%[B,A]=cheby1(N,0.5,Wc,'Low');
%[B,A]=cheby2(N,20,Wc,'Low');
%[B,A]=ellip(N,0.5,20,Wc,'Low');
%% (a) plot zeros and poles,frequency Response
figure(1)
zplane(B,A);
title('Poles and Zeroes')
figure(2)
freqz(B,A)
%% (b) plot unit pulse response of this filter
h=dimpulse(B,A);
figure(3)
stem(h);
title('unit pulse response of this filter')
%% (c) test the filter with random input signal
x=randn(1,1000)+j.*randn(1,1000);
figure(4)
subplot(2,2,1)
stem(x);
title('Noise in Time Domain')
subplot(2,2,2)
stem(abs(fft(x)));
title('Noise in Frequency Domain')
subplot(2,2,3)
y=filter(B,A,x);
stem(y);
title('Filtered Noise in Time Domain')
subplot(2,2,4)
stem(abs(fft(y)));
title('Filtered Noise in Frequency Domain')
