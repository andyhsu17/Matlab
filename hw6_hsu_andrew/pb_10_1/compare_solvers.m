function compare_solvers(y0, T, s, solve)
%y0: initial state of satellite
%T: max time to solve to
%s: step size (delta t)
%solve: a function to a solver
%
%Plots the orbit and the velocity vs time for the satellite system using
%the provided solver

sol = solve(@orbit, y0, 0:s:T);

%clear plot window
clf;

%plot the orbit and the velocity 
%plot 1: the orbit
subplot(2,1,1);
hold on;
title('Position');
xlabel('X');
ylabel('Y');

%central mass
plot([0], [0], 'or');

%orbit
plot(sol(1,:), sol(2,:), '-b');
axis('equal');

%plot 2: the velocity w.r.t time
v = velocity(sol);
subplot(2,1,2);
hold on;
title('Velocity');
xlabel('Time');
ylabel('Absolute velocity');
plot(0:s:T, v, '-b');
end

function ydot = orbit(t,y)
%returns the vector of the derivative of y at time t
r = sqrt(y(1:2)' * y(1:2));
ydot = [y(3);...
    y(4); ...
    -1/r^3 * y(1); ...
    -1/r^3 * y(2)];
end

function V = velocity(sol)
%returns the vector of the velocities of the satellite at the timesteps
V = sqrt(sol(3,:).*sol(3,:) + sol(4,:).*sol(4,:));
end
    