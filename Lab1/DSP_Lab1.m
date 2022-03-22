rng(1611);
%% PROBLEM 1:

n = - 20: 1: 20;
x = sin(n.*(pi/4));
figure(1)
x1=sin((n-5).*(pi/4));
subplot(2,1,1);
stem(n,x);
title('x[n]');
subplot(2,1,2);
stem(n,x1);
title('x[n-5]');


