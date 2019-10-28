
%initialize sampling indexes and frequency of middle A
sampleTimes = (0: 8192 - 1) / 8192;
midA = sin(2 * pi * 440 * sampleTimes);

%half the volume / amplitude
 sound(.5 * midA) 
 pause(2)
 
 %twice the volume / amplitude
 sound(3 * midA) 
 pause(2)

%generate tone that gets quieter
%plot this graph
sound(exp(-3 * sampleTimes) .* midA);
plot(sampleTimes, exp(-3 * sampleTimes) .* midA)
pause(2)


%generate tone that pulses in volume
%plot this graph
sound(cos(10 * sampleTimes) .* midA);
plot(cos(10 * sampleTimes) .* midA);
pause(2)


%plays A one octave higher
sound(midA .* midA);
pause(2)

%generate tone with increasing volume
%save to file "midA.wav"
%plot the frequency
sound(exp(2*sampleTimes) .* midA)
audiowrite('midA.wav', exp(2 * sampleTimes) .* midA, 8192);
plot(sampleTimes, exp(2 * sampleTimes) .* midA);