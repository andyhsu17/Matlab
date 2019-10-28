function contourplot()
[a, b] = meshgrid(0:.001:1);
A = a + b - (a.^3 + b.^3);
contourf(a,b,A);
colorbar;
[C,h] = contourf(a,b,A);
clabel(C,h);
colorbar
test = find(A == max(max(A)));
maxa = a(test);
maxb = b(test);
maxz = A(test);
text(maxa, maxb, ['\bullet', num2str(maxz)])

title('$ \alpha + \beta - (\alpha^3 + \beta^3)$', ('interpreter'), ('LaTeX'))
xlabel('$ \alpha$', 'interpreter', 'LaTeX')
ylabel('$ \beta $', 'interpreter', 'LaTeX')
end