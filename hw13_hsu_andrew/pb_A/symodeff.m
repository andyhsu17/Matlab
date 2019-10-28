syms x(t);
syms g positive;
xdot = diff(x);
ode = diff(xdot) == -g;
gen = dsolve(ode);
particular = dsolve(ode, x(0) == 10, xdot(0) == 0);
particular2 = subs(particular, g, 9.81);
fplot(particular2, [0 2]);

