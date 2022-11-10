%This function removes the silent regions in the signal
function SilentRegion(signal)
    %plotting the absolute value of the signal
    subplot(4,1,1)
    absSignal = abs(signal);
    plot(absSignal)

    %plotting the filtered absolute value of the signal
    subplot(4,1,2)
    absFilteredSignal = meanFilter(50, absSignal);
    plot(absFilteredSignal)

    %gets all of the peaks that are greater than 0.015 (anything less than this
    %will be part of a silent region
    [peaks, indexes] = findpeaks(absFilteredSignal, minPeakHeight = 0.015);
    %loop through the peaks and sets all values where there is a peak to 1
    for i = 1:1:size(indexes)
       absFilteredSignal(indexes(i)) = 1;
    end
    %plotting this
    subplot(4,1,3)
    plot(absFilteredSignal)
    %loop through this signal and set all non-one values to 0 to help clarity
    for i = 1:1:size(absFilteredSignal)
        if (absFilteredSignal(i) ~= 1)
            absFilteredSignal(i) = 0;
        end
    end

    %plotting the final signal with all silent parts set to 0 and all others
    %oscillating between 0 and 1
    subplot(4,1,4)
    plot(absFilteredSignal)
end

