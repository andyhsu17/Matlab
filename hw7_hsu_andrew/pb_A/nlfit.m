function rv = nlfit()
 % Part a: get values from table
T = readtable('nlfit.csv');
v = T{:,1}; % store as vectors
a = T{:,2};

%Part b: store polynomial to find linear fit
pf = polyfit(v, a, 1); 

 % part c: print linear equation
fprintf('A = %1.4fV + %1.4f\n', pf(1), pf(2));

%Part d: plot real data points in top left, line of best fit in top right
subplot(2,2,1);
plot(v,a, 'o'); 
title('Current vs Voltage from Table');
xlabel('Voltage');
ylabel('Current');

y = polyval(pf, v);
subplot(2,2,2);
plot(v, y);
title('Line of Best Fit');
xlabel('Voltage');
ylabel('Current');

%Part e: correlation coefficient
[R, p] = corrcoef(v, a);
fprintf('R = %d and p = %d\n', R(1,2), p(1,2));

%part f: linear fit of logarithm
V = log(v(2:end));
A = log(a(2:end));
newpf = polyfit(V, A, 1);
y1 = polyval(newpf, V);
c = newpf(2); a = newpf(1); % find c and a values

%Part g: print power law
fprintf('Power law: I = e^%d * V^%d\n', c, a);

%Part h: plotting power law
subplot(2,2,3:4)
y2 = exp(c) * v.^(a);
plot(v, y2);
title('Power Law');
xlabel('Voltage');
ylabel('Current');


%Part i: Correlation Coefficient
[R1, p1] = corrcoef(v, y2); 
fprintf('R = %d and p = %d\n', R1(1,2), p1(1,2));

saveas(gcf, 'nlfit.pdf'); % save plot as nlfit.pdf

%The power law is a better representation of the data from the table
%because:
% 1) it has a higher r value
% 2) it looks better when compared to the linear line of best fit

end
