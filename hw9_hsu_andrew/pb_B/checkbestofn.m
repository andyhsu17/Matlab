function checkbestofn()
f3 = bestofn(3);
f5 = bestofn(5);
f7 = bestofn(7);
p = linspace(0,1,1000);
plot((p), f3(p), p, f5(p),p, f7(p));
print('bestofn.pdf', '-dpdf');

assert(all(abs((f5(p) + f5(1-p) - 1)) < 1e-12));

end