function BPM = beatPerMinute(signal, range)
    [pks, indices] = findpeaks(abs(signal));

    for i=1:1:size(indices) 
        lowerbound = indices(i)-range    
        if(lowerbound < 1)
            lowerbound = 1; %ensures that the index is not negative
        end
        upperbound = indices(i)+range 
        if(upperbound > size(abs(signal)))
            upperbound = size(abs(signal)); %ensures that the index is not
        end                                     %too large
        nearbyValues = absFilteryDcopy(lowerbound:upperbound); 
        if (max(nearbyValues) ~= pks(i))    %if the maximum in the nearby
            pks(i) = 0;                     %values is not the peak then set
        end
    end
end