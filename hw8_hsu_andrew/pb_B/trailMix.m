function trailMix()
c = -[6; 4.5; 3]; % minimize the negative values to get max
A = [3 -1 -1; % inequality constraints
    2 2 -3;
    1 1 1];
b = [0; 0; 100];
lb = zeros(3,1); % lower bounds
ub = [40; 25; 20]; % upper bounds

[x, ~, exitflag] = linprog(c, A, b, [], [], lb, ub);
%check for failure
if(exitflag) ~= 1
    error('unsuccessful');
else

profit = (x(1) * 6) + (x(2) * 4.5) + (x(3) * 3); %plug in values to profit equation

fprintf('Optimum peanuts is %2.1f pounds\nOptimum almonds is %2.1f pounds\nOptimum cashews is %2.0f pounds\n', x(1), x(2), x(3));
fprintf('\nProfit is $%3.2f\n', profit);

end

end

