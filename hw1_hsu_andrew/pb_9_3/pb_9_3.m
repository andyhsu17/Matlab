%(d)
A = zeros(5);
A = diag(0:2.5:10);
A(1:4,5) = 1;

%(e)
A = 2 .^ (0:4);

%(g)
A(A<0) = A(A<0) * 2;

%(h)
B = A';
if B == A
    disp('symmetric');
else disp('not symmetric');
end


