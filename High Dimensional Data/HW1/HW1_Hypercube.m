function HW1_Hypercube()
%randomly generate 400 points inside unit hypercube and plots distances
%between points and angle between vectors from the origin to the points

x = (rand(400,100) - 1/2);
D = pdist(x);
histogram(D.^2)
xlabel('Distance')
ylabel('Frequency')
title('Histogram of Distances Between Points')
F = [];
for i = 1:100
    u = x(i, :);
    v = x(i + 1, :);
    CosTheta = dot(u,v)/(norm(u)*norm(v));
    angle = acosd(CosTheta);
    F = [F, angle]
end

    histogram(F);
    xlabel('Angle (Degrees)');
    ylabel('Frequency');
    title('Histogram of Angles Between Vectors');
end

