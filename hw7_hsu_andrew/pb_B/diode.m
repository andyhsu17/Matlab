function diode()

%given constants
I0 = 10^-12;
n = 1;
Vt = (1.3806488 * 10^-23 * 300) / (1.602176565 * 10^-19);
R = 10^3;
Vs = 3;
% Given two equations:
%  diode = I0 * (exp(V1 / (n * Vt)) - 1);
% resistor = (Vs - V1) / R;

%Initial condition
x0 = .5;

%a and b: Check for errors, then solve for V1, V2, and I, and prints
[V1, ~, exitflag] = fsolve(@(V1) (I0 * (exp(V1 / (n * Vt)) - 1)) - ((Vs - V1) / R), x0); 
if exitflag ~= 1
    error('no solution found');
else 
V2 = Vs - V1;
I = I0 * (exp(V1 / (n * Vt)) - 1);
fprintf('Diode Voltage: %f V \nResistor Voltage: %f V \nCurrent through Circuit: %f A\n', V1, V2, I);
end

%c: plot intersection of two IV curves (only intersection is at (0,0))
v = linspace(0, 20, 100);
diode = I0 * (exp(v / (n * Vt)) - 1);
resistor = (v) / R;
plot(v, diode);
hold on
plot(v, resistor);

%f: Power dissipated
pd = V1 * I;
pr = V2 * I;
fprintf('Power dissipated is %f W through diode and %f W through the resistor\n', pd, pr);

%g: power if only one component
pd1 = Vs * I0 * (exp(Vs / (n * Vt)) - 1);
pr1 = Vs * (Vs) / R;
fprintf('Power dissipated in circuit with singular component is %f W through the diode and %f W through the resistor\n', pd1, pr1);

end