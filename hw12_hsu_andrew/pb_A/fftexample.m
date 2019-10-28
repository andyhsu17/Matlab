function [F, S] = fftexample
t = (0:7) / 8;
x = -.1 + .2*sin(2*pi*t) -.4*cos(2*pi*t) + .3*sin(2*pi*3*t);
F = fft(x);
S = abs([F(1) 2*F(2:length(F) / 2)]) / length(F);

end