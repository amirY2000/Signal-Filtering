clear;clc;
% [yBirds,FsBirds] = processor('Birds.wav', 'BirdsModified.wav');
% [yBirdsModified,FsBirdsModified] = audioread("BirdsModified.wav");
% subplot(2,1,1)
% plot(yBirdsModified)
% subplot(2,1,2)
% plot(meanFilter(20, yBirdsModified))
% sound(meanFilter(20,yBirdsModified), FsBirdsModified)

[yDrum,FsDrum] = processor('Drum.wav', 'DrumModified.wav');
[yDrumModified,FsDrumModified] = audioread("DrumModified.wav");

subplot(2,1,1)
plot(yDrumModified)
subplot(2,1,2)
plot(meanFilter(20, yDrumModified))
sound(meanFilter(20,yDrumModified), FsDrumModified)


%[y3,Fs3] = processor('Speech.wav', 'SpeechModified.wav');
% [ySpeechModified,FsSpeechModified] = audioread("SpeechModified.wav");
% 
% subplot(2,1,1)
% plot(ySpeechModified)
% subplot(2,1,2)
% plot(meanFilter(20, ySpeechModified))
% sound(meanFilter(20,ySpeechModified), FsSpeechModified)

