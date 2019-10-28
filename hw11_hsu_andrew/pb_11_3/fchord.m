function f = fchord(freq)

if nargin ~= 1
    freq = [370 440 587 740];
end

[~, n] = size(freq); % get size of row vector and initialize ssas variable
ssas = zeros(1, 4096);
freq = freq + 1; %increment by 1 because of matlab indexing

%frequency domain set up
for i = 1:n
ssas(freq(i)) = 1/n;
end

%plot frequency domain
plot(0:4095, ssas);
pause


%inverse fft setup
F = [ssas(1), ssas(2:2096) / 2, 0, ssas(4096:-1:2) / 2] * 8192;
f = real(ifft(F));
t = linspace(0, 1, 6192);

f = f ./ max(max(f)); % ensure that all amplitudes are less than 1
plot(t,f)  

sound(f);

end