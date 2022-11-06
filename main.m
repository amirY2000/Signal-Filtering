clear;clc;
% [yB,FsB] = processor('Birds.wav', 'Birds1.wav');
% [yBcopy,FsBcopy] = audioread("Birds1.wav");
% plot(yBcopy)

[yD,FsD] = processor('Drum.wav', 'Drum1.wav');
[yDcopy,FsDcopy] = audioread("Drum1.wav");

subplot(2,1,1)
plot(yDcopy)
subplot(2,1,2)
plot(medianFunction(yDcopy, 10))
%sound(meanFilter(20,yDcopy), FsDcopy)


%[y3,Fs3] = processor('Speech.wav');
% audiowrite("Speech1.wav", y3, Fs3);
