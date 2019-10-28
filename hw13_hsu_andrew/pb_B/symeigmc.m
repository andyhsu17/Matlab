
% toeplitz matrix
%V = eigenvectors, D = eigenvalues
P = toeplitz([0, ones(1,5) / 5]);
A = sym(P);
[V, D] = eig(A);