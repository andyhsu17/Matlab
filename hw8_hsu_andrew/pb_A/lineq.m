function rv = lineq()
A = [2 -4 4; 1 -2 1; 1 -4 6]; %initialize matrix
b = [3; 5; 10];
x = A \ b;

error = all(((A * x) - b) < 10^-9); % assert Ax = b, make sure error is less than 10^-9
if error ~= 1
    error('not true')
else
    fprintf('success\n');
end


end
