function [y, Fs] = processor(filename, copyfile)
    [y, Fs] = audioread(filename);
    info = audioinfo(filename);

    disp("sample rate:");
    info.SampleRate %display sample rate
    temp = y; %saving the original signal
     if size(y,2) == 2
          y = sum(y(:,1:2),2); %convert stereo to mono
     end
     %resample to 16KHz
     %y = resample(y, 16000, Fs);
     %writing audio to a new file
     audiowrite(copyfile, y, 16000); %making another file with mono and resampled signal and changed frequency
     %plotting the new file
     y = temp;
end
