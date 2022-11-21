% %This fucntion calculated the number of syllables for an input signal
% function numSyllables = SyllableFinder(signal, range)
%     absSignal = abs(signal);
%     %plotting the absolute value of the signal
%     subplot(2,1,1)
%     plot(absSignal)
% 
%     %plotting the filtered absolute value of the signal
%     subplot(2,1,2)
%     plot(meanFilter(20, absSignal))
% 
%     %gets the peaks using the findpeaks function
%     [pks, indices] = findpeaks(absSignal);
%     size(pks) %gives 6551 for this signal
%     size(indices) %6551
% 
%     %The following is a loop which will remove any peaks that are not the
%     %maxima within the +/- 1700 range. This range is used because it is the
%     %range which works for this audio. That is, it is best for detecting
%     %syllable peaks in this audio. It leaves a peak array containing only the
%     %maxima within the window
%     
%     for i=1:1:size(indices) 
%         
%         lowerbound = indices(i) - range;    
%         if (lowerbound < 1)
%             %ensures that the index is not negative
%             lowerbound = 1; 
%         end
%         
%         upperbound = indices(i) + range; 
%         if (upperbound > size(absSignal))
%              %ensures that the index is not
%             upperbound = size(absSignal);
%         end
%   
%         nearbyValues = absSingal(lowerbound : upperbound); 
%         if (max(nearbyValues) ~= pks(i)) 
%             %if the maximum in the nearby values is not the peak then set that peak to zero
%             pks(i) = 0;                     
%         end
%     end
%     finalPks = nonzeros(pks);    %%remove the zeros (non peaks)
%     numSyllables = size(finalPks);    
%     fprintf('%s %d', "Number of syllables:", numSyllables);
% end

%This fucntion is used to calculate the number of syllables in the speech signal
function numSyllables = SyllableFinder(inputSignal)
    signal = SilentRegion(inputSignal);
    numSyllables = 0; %number of syllables
    silent = 0; %The size of silent region
    for i = 1:1:size(signal)
      if (signal(i) == 0)
          silent = silent + 1;
      end
      if (signal(i) ~= 0)
          silent = 0;
      end
      if (silent == 1150)
           numSyllables = numSyllables + 1;
           silent = 0;
      end
    end
end