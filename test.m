function x = test

image = checkerboard;
points = detectHarrisFeatures(image);
plot(points.selectStrongest(50))
end
