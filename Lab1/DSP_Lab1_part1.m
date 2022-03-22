rng(1611);
%% PROBLEM2

n=-10:10;
x=exp(-(0.1+1i.*0.3).*n);

figure()
subplot(2,2,1)
stem(n,abs(x));
title('Magnitude of x[n]');
subplot(2,2,2)
stem(n,angle(x));
title('Angle of x[n]');
subplot(2,2,3)
stem(n,real(x));
title('Real Part of x[n]');
subplot(2,2,4)
stem(n,imag(x));
title('Imag Part of x[n]');
