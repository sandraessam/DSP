clear all
n=0:10;
x=cos(0.48.*pi.*n)+cos(0.52.*pi.*n);
figure
subplot(3,1,1)
plot(n,x);
title('x[n]')
subplot(3,1,2)
plot(n,abs(DFT(x,11)));
title('DFT of x[n]')
subplot(3,1,3)
xn=DFT(x,11);
plot(n,real(IDFT(xn,11)));
title('IDFT of X[k]')


n=0:100;
x=[x zeros(1,90)];
figure
subplot(3,1,1)
plot(n,x);
title('x[n]')
subplot(3,1,2)
plot(n,abs(DFT(x,101)));
title('DFT of x[n]')
subplot(3,1,3)
xn=DFT(x,101);
plot(n,real(IDFT(xn,101)));
title('IDFT of X[k]')


