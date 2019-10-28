
midA = sin(2*pi*440*(0:8191) / 8192);
sampleTimes = (0:(8192 - 1)) / 8192;
plot(sampleTimes, midA);
pause(5)
plot(sampleTimes(1:ceil(8192/440)),midA(1:ceil(8192 / 440)))
pause(5)
plot(sampleTimes(1:ceil(8192/440)),midA(1:ceil(8192 / 440)), '-o')
pause(5)
plot(sampleTimes(1:ceil(10 * 8192 / 440)),midA(1:ceil(10* 8192 / 440)))
