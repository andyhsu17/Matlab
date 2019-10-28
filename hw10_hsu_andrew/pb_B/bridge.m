function rv = bridge(R, Vs)
if nargin < 1
    disp('Resistors should be 1k and Vs should be 2V')
    Vs = 2;
    R = [2000, 2000, 2000, 2000, 2000];
end
if (size(R) ~= 5)
    disp('Please input 5 resistor values')
    R = [2000, 2000, 2000, 2000, 2000];
end

A = [1/R(1) + 1/R(3) + 1/R(4), -1/R(3);
    -1/R(3), 1/R(2) + 1/R(3) + 1/R(5)];
B = [(1/R(1))*Vs; (1/R(2))*Vs];
x = A \ B;
rv = x;
end