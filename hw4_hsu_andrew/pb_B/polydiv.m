P = [1, -3, 5, -3, 0, 5];
D = [1, -3, 3];

[Q, R] = deconv(P, D);

%assert that deconvolution is successful
if (conv(D,Q) + R ~= P)
    error('unsuccessful');
end

%initialize variable to count the number of nonzero terms in remainder
nonzero = 0;

%look through remainder vector and increment every time a nonzero value is
%found
for i = 1:length(R)
    if R(i) ~= 0
        nonzero = nonzero + 1;
    end
end

%if number of nonzero terms exceeds terms of D, the remainder is
%equal or higher in degree than D and there is an error
if nonzero >= length(D)
    error('Remainder is a higher degree');
end
