function [y, Fs] = processor(filename, copyfile)
    [y, Fs] = audioread(filename);
    info = audioinfo(filename);

    disp("sample rate:");
    info.SampleRate %display sample rate
    
     if size(y,2) == 2
          y = sum(y(:,1:2),2); %convert stereo to mono
     end
     
     %resample to 16KHz
     %y = resample(y, 16000, Fs);
     %writing audio to a new file
     audiowrite(copyfile, y, 16000);
     %plotting the new file
     plot(y)
     
end
