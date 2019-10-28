t = linspace(0,10,1000);
f1 = sin(pi*t);
f2 = cos(2*pi*t) .* exp(-t);
g = 20*t.^(1/2);
yyaxis left
plot(t, f1)
hold
yyaxis left
plot(t, f2)
hold

yyaxis right
plot(t, g)

yyaxis left
title('Dual - axis plot')
xlabel('t')
ylabel('f_1(t), f_2(t)')

yyaxis right
ylabel('g(t)')