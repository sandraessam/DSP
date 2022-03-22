%% PROBLEM4

[ Y , Fs , Nbits , Opts ] = wavread( 'C:\Users\Copy Center\Downloads\blue-tango-scloudtomp3downloader.com.wav' ) ;
%sound(Y , Fs )


%sound(Y , 40000 )

%% sampling
t = 0:1000/Fs:length(Y)
plot(t,Y);