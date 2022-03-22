%% PROBLEM5
n=0:10
y=[1 1 zeros(1,9)];
x=4*cos((pi.*n )./ 8);

for i=3:10
    y(i) = y(i-1)+ 2.*y(i-2)+ x(i-2);
end 

figure()
stem(n,y);
title('The unit Pulse Response');