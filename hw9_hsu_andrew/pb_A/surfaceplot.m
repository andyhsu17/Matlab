function surfaceplot()

x = 0:.05:1;%initialize variables
y = 0:.05:1;

[X, Y] = meshgrid(x, y);%create grids for X and Y, and input into Z
Z = X + Y - (X.^2 + Y.^2);

surf(X,Y,Z);%plot with jet
colormap('jet')

%include colorbar and LaTeX title
colorbar
title('$x + y - (x^2 + y^2)$', ('interpreter'), ('LaTeX'))
end
