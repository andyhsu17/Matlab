i = [.1, .0686];
v = [9.652, 12];

plot(i, v, 'rx'); hold on;
x = [.1, .1];
y = [0, 12.5];
plot(x, y, 'k:');
w = [0, .11];
z = [12, 12];
plot(w, z, 'k:');
hold on;
axis([0 .11 0 12.5]);
xlabel('Current (A)');
ylabel('Voltage (V)');
title('Voltage vs Current for R1 and R2');

s = [0, .1];
t = [0, 9.652];
plot(s, t);
hold on;
m = [0, .0686];
l = [0, 12];
plot(m,l);