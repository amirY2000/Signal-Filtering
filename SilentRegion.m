clear;clc;close all;

[yD,FsD] = processor('Birds.wav', 'Birds.wav');
[yDcopy,FsDcopy] = audioread("Birds.wav");

%plotting the absolute value of the signal
subplot(4,1,1)
absyDcopy = abs(yDcopy);
plot(absyDcopy)

%plotting the filtered absolute value of the signal
subplot(4,1,2)
absFilteryDcopy = meanFilter(50, absyDcopy);
plot(absFilteryDcopy)

%gets all of the peaks that are greater than 0.015 (anything less than this
%will be part of a silent region
[peaks, indexes] = findpeaks(absFilteryDcopy, MinPeakHeight=0.015)
%loop through the peaks and sets all values where there is a peak to 1
for i = 1:1:size(indexes)
   absFilteryDcopy(indexes(i)) = 1;
end
%plotting this
subplot(4,1,3)
plot(absFilteryDcopy)
%loop through this signal and set all non-one values to 0 to help clarity
for i = 1:1:size(absFilteryDcopy)
    if(absFilteryDcopy(i) ~= 1)
        absFilteryDcopy(i) = 0;
    end
end

%plotting the final signal with all silent parts set to 0 and all others
%oscillating between 0 and 1
subplot(4,1,4)
plot(absFilteryDcopy)
