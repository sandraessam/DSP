%% Problem1

b=[1,1.655,1.655,1];
a=[1,-1.57,1.264,-0.4];

figure(1)
zplane(b,a);
title('Zeros and Poles of Transfer function')
figure(2)
freqz(b,a);



