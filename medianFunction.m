function y = medianFunction(signal, windowSize)    
    y = medfilt1(signal, windowSize);
end