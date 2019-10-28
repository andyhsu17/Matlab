function fh = bestofn(n)
if (n < 1)
    error('Number of games played must be greater than 0')
end
flag = mod(n,2);
if(~flag)
    error('Number of games played must be even');
end
%sum = 0;
%sum2 = 0;
coeff = zeros(1, n+1);
%index = @(k) (n+1)/2 - k;
for k = 0 : (n - 1) / 2
    sum = 0;
    for j = 0 : k
      %coeff =  nchoosek(n, ((n + 1) / 2) + k) * (-1)^j .* nchoosek(((n+1)/2 + k), j) .* p^(((n+1)/2) + k)
      sum = sum + (-1)^j .* nchoosek(((n+1)/2 + k), j);
    end
    coeff((n+1) / 2 - k) = nchoosek(n, (n+1) / 2 + k) * sum;
%     sum = sum * nchoosek(n, ((n + 1) / 2) + k);
%     sum2 = sum2 + sum;
end


fh = @(p) polyval(coeff, p);

end