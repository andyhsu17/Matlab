clc;
close all;
clear all;

t = linspace(0, 1, 1000);
y = sin(2*pi*30*t) + sin(2*pi*50*t);     % frequency of 30 Hz
plot(t,y)
Fs = 1000; % Lung High band sampling frequency
L = 1000; % length of signal in ms

Y = fft(y);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(L/2))/L;

figure
plot(f,P1) 
xlim([0,100])
z = (abs(fft(y)));
[maxValue,indexMax] = max(abs(fft(y-mean(y))));
frequency = indexMax * Fs / L

