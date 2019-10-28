
%5a
func1 = [1, 10, 35, 50, 24];
syms s
func2 = (s-1)^8;
expand(func2);
func2 = [1 -8 28 -56 70 -56 28 -8 1];
roots(func1)
roots(func2)

%5b
a = (s^2 + 2*s + 1)*(s^2+4*s+3);
expand(a)
b = [1 6 12 10 3];
c = roots(b)

%5c 
%PFX
a = [2 1];
b = [1 1.5 13/16 5/16];
[r, p, k] = residue(a, b)

%5c ILT
sym ('s')
H = (2*s + 1) / (s^3 + (1.5)*(s^2) + 13 * s / 16 +  (5/16));
h = ilaplace(H)

%5d
[b, a] = butter(6, 2*pi*75, 's');
sys = tf(b, a);
pzplot(sys)


