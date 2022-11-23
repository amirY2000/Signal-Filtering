clear;clc;close all;

[yD,FsD] = processor('Drum.wav', 'Drum1.wav');
[yDcopy,FsDcopy] = audioread("Drum.wav");
sound(yDcopy)

%plotting the absolute value of the signal
subplot(2,1,1)
absyDcopy = abs(yDcopy);
plot(absyDcopy)

%plotting the filtered absolute value of the signal
subplot(2,1,2)
absFilteryDcopy = meanFilter(5, absyDcopy);
plot(absFilteryDcopy)

%gets the peaks using the findpeaks function
[pks, indices] = findpeaks(absFilteryDcopy, MinPeakHeight=0.05);
size(pks)
size(indices)

%The following is a loop which will remove any peaks that are not the
%maxima within the +/- 4000 range. This range is used because it is the
%range which works for this audio to acquire the beats. A smaller range
%does not isolate the beats enough.
%It leaves a peak array containing only the maxima within the window

for i=1:1:size(indices) 
    lowerbound = indices(i)-4000;    
    if(lowerbound < 1)
        lowerbound = 1; %ensures that the index is not negative
    end
    upperbound = indices(i)+4000; 
    if(upperbound > size(absFilteryDcopy))
        upperbound = size(absFilteryDcopy); %ensures that the index is not
    end                                     %too large
    nearbyValues = absFilteryDcopy(lowerbound:upperbound); 
    if (max(nearbyValues) ~= pks(i))    %if the maximum in the nearby
        pks(i) = 0;                     %values is not the peak then set
                                        %that peak to zero
    end
end


finalPks = nonzeros(pks);    %%remove the zeros (non peaks)
numBeats = size(finalPks);    
fprintf('%s %d', "Number of beats:", numBeats);

%since the audio file is approximately 5 seconds long, multiply beats by 
%60/5 = 12 and cast to remove decimals.
bpm = cast((numBeats * 12), "int8");
fprintf('%s %d', "Beats Per Minute", bpm);
