function [y, Fs] = processor(filename, copyfile)
    [y, Fs] = audioread(filename);
    info = audioinfo(filename);

    disp("sample rate:");
    info.SampleRate %display sample rate

     if size(y,2) == 2
          y = sum(y(:,1:2),2); %convert stereo to mono
     end

     %writing audio to a new file
     audiowrite(copyfile, y, Fs);
     
     %resample to 16KHz

     %plotting the new file
     t = (0:length(y)-1)/Fs;
     plot(t,y)
     
end
