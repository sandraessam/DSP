%% problem3

n=-9:15
X=ones(1,20);
H=[1,1,1,1,-2,-2];

Y=Convolution(X,H);
Y_Matlab=conv(X,H);

figure()
subplot(2,1,1)
stem(n,Y);
title('Convolution Function')
subplot(2,1,2)
stem(n,Y_Matlab);
title('conv Matlab Built-in Function');
