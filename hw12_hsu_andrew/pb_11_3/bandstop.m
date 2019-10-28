function rv = bandstop(F, band)
[m, n] = size(band);
if (m ~= 1 || n ~= 2)
    error('please enter a 1 by 2 vector')
end

if any(rem(band,1) ~= 0)
    error('please enter an integer')
end

if any(band <= 0)
    error('please enter positive frequencies')
end

if band(1) > band(2)
    error('threshold frequencies out of order')
end

 rate = size(F, 1);
 if any(band > rate / 2)
     error('frequencies must be below the nyquist frequency')
 end

 rv = [F(1:band(1), :);
     zeros(rate - 2*size(band,1) + 1, size(F,2));
     F(band(2):end, :)];

end