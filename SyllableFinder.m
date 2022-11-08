clear;clc;close all;

[yD,FsD] = processor('Speech.wav', 'Speech.wav');
[yDcopy,FsDcopy] = audioread("Speech.wav");

%plotting the absolute value of the signal
subplot(2,1,1)
absyDcopy = abs(yDcopy);
plot(absyDcopy)

%plotting the filtered absolute value of the signal
subplot(2,1,2)
absFilteryDcopy = meanFilter(20, absyDcopy);
plot(absFilteryDcopy)

%gets the peaks using the findpeaks function
[pks, indices] = findpeaks(absFilteryDcopy);
size(pks) %gives 6551 for this signal
size(indices) %6551

%The following is a loop which will remove any peaks that are not the
%maxima within the +/- 1700 range. This range is used because it is the
%range which works for this audio. That is, it is best for detecting
%syllable peaks in this audio. It leaves a peak array containing only the
%maxima within the window
for i=1:1:size(indices) 
    lowerbound = indices(i)-1700    
    if(lowerbound < 1)
        lowerbound = 1; %ensures that the index is not negative
    end
    upperbound = indices(i)+1700 
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
numSyllables = size(finalPks);    
fprintf('%s %d', "Number of syllables:", numSyllables);
