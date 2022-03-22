%%PROBLEM2
clear all
x = [1 1 1 1 zeros(1,508)];
%x=[ones(1,8) zeros(1,504)];
%x=[ones(1,16) zeros(1,32-16)];
w = 0:(2.*pi)/512:(2.*pi)-(2.*pi)/512 ;
N=512;
n=0:511 ;
for l=1:512
dtft_x(l)=sum(x.*exp(-j*w(l).*n));
end
%f=0:0.00614:2.*pi-0.00614;
figure
subplot(2,1,1)
plot(w,abs(dtft_x));
subplot(2,1,2)
plot(w,phase(dtft_x));
figure
plot(abs(fft(x)));
figure
xn=DFT(x,N);
plot(abs(DFT(x,N)));