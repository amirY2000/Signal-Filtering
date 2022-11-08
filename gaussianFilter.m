function y = gaussianFilter(windowSize, inputSignal)
    %gets the gaussian distribution for 'window' points
    gaussDistr = gausswin(windowSize);
    %normalizing the weights by dividing by the sum of the gaussian distr
    b = gaussDistr/(sum(gaussDistr));
    %filtering the input signal
    y = filter(b, 1, inputSignal);
    plot(y)
end

