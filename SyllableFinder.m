%This fucntion is used to calculate the number of syllables in the speech signal
function numSyllables = SyllableFinder(inputSignal)
    signal = SilentRegion(inputSignal);
    numSyllables = 0; %number of syllables
    silent = 0; %The size of silent region
    for i = 1:1:size(signal)
          if (signal(i) == 0)
              silent = silent + 1;
          end
          if (signal(i) ~= 0 && silent < 330) %330 is the minimum range of silent that we let pass
              silent = 0;
          end
          if (signal(i) ~= 0 && silent >= 330)
               numSyllables = numSyllables + 1;
               silent = 0;
          end
    end
end
