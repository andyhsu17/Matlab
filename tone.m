function rv = tone(duration, freq)
sampleTimes = ((1:8192-1) * duration) / 8192;
rv = sin(2*pi*freq*sampleTimes);
end
