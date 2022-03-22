%% A)

[x,fs]=audioread('C:/Users/Copy Center/Downloads/6.wav')
[pxx,f]=pwelch(x,[],[],[],fs);
plot(f,10*log10(pxx));
xlabel('Frequency(HZ)')
ylabel('Magnitude (dB)')
%% b)
[pxx1,index]=max(pxx);
F(1,1) = f(index);
pxx(index) = -inf;
[pxx1,index1]=max(pxx);
F(2,1) = f(index1);
Digit=GetDigit(F);
%% C)
[x,fs]=audioread('C:/Users/Copy Center/Downloads/num.wav')
DIGITS =[];
for i = 1:1600:length(x)
    
[pxx,f]=pwelch(x(i:1600+i-1),[],[],[],fs);
plot(f,10*log10(pxx));
xlabel('Frequency(HZ)')
ylabel('Magnitude (dB)')

[pxx1,index]=max(pxx);
F(1,1) = f(index);
pxx(index) = -inf;
[pxx1,index1]=max(pxx);
F(2,1) = f(index1);
digit=GetDigit(F);
DIGITS =[DIGITS digit];
end
Digit
DIGITS