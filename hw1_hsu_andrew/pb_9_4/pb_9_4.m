t = 0:pi/100:10*pi;
plot(exp(-t/3) .* cos(3*t), exp(-t/10) .* sin(t) + 1);
