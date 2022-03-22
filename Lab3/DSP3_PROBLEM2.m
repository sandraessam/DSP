rng(1611)
clear all
clc
%% Specify specs
N=10; %Order Number
m=[0 0 1 1 0 0 1 1 0 0];
f=[0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 1];
Wc=1/4; %Cutoff Frequency
[B,A]=yulewalk(N,f,m);
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
%% (d) Test the filter 
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
