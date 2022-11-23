%This funciton converts stereo signal to mono and changes the sample rate
%then eventually writes the modified signal into a new wav file
function [y, Fs] = processor(filename, newFile)
    [y, Fs] = audioread(filename);
    info = audioinfo(filename);
    info.SampleRate
    
    temp = y; %saving the original signal
     if size(y,2) == 2
          y = sum(y(:,1:2),2); %convert stereo to mono
     end
     
     %writing audio to a new file
     audiowrite(newFile, y, 16000); %making another file with mono and resampled signal and changed frequency
     %convert back the original signal
     y = temp;
end