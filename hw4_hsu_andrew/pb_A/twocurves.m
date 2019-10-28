%first graph
theta = linspace(0, 2*pi);
r = sin(2 * theta);
polarplot(theta, r)

%second graph in new window with equal axes
t = linspace(-1000, 1000,100000);
x = (1-(t.^2)) ./ (1+(t.^2));
y = (2*t) ./ (1+(t.^2));
figure
plot(x,y)
axis equal
