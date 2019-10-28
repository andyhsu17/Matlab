function HW2_Gaussian()
%Gaussian: Plots histogram of points for n = 4, 25, 100, 225, 400
%   Detailed explanation goes here
i = 4;
R = randn(10000,i);
norm = [];

for j = 1:10000
    temp = 0;
    for k = 1:i
    temp = temp + R(j, k)^(2);
    end
    temp = sqrt(temp);
    norm(j) = temp;
end

figure
histogram(norm)
mean1 = mean(norm);
var1 = var(norm);
xlabel('Norm of Samples')
ylabel('Frequency')
title('Histogram of Gaussian Distribution n = 4')


%%%%%
i = 25;
R = randn(10000,i);
norm = [];

for j = 1:10000
    temp = 0;
    for k = 1:i
    temp = temp + R(j, k)^(2);
    end
    temp = sqrt(temp);
    norm(j) = temp;
end
figure(2);
histogram(norm);
mean2 = mean(norm);
var2 = var(norm);
xlabel('Norm of Samples')
ylabel('Frequency')
title('Histogram of Gaussian Distribution n = 25')


%%%%%
i = 100;
R = randn(10000,i);
norm = [];

for j = 1:10000
    temp = 0;
    for k = 1:i
    temp = temp + R(j, k)^(2);
    end
    temp = sqrt(temp);
    norm(j) = temp;
end
figure(3);
histogram(norm);
mean3 = mean(norm);
var3 = var(norm);
xlabel('Norm of Samples')
ylabel('Frequency')
title('Histogram of Gaussian Distribution n = 100')


%%%%%
i = 225;
R = randn(10000,i);
norm = [];

for j = 1:10000
    temp = 0;
    for k = 1:i
    temp = temp + R(j, k)^(2);
    end
    temp = sqrt(temp);
    norm(j) = temp;
end
figure(4);
histogram(norm);
mean4 = mean(norm);
var4 = var(norm);
xlabel('Norm of Samples')
ylabel('Frequency')
title('Histogram of Gaussian Distribution n = 225')


%%%%%
i = 400;
R = randn(10000,i);
norm = [];

for j = 1:10000
    temp = 0;
    for k = 1:i
    temp = temp + R(j, k)^(2);
    end
    temp = sqrt(temp);
    norm(j) = temp;
end
figure(5)
histogram(norm)
mean5 = mean(norm);
var5 = var(norm);
xlabel('Norm of Samples')
ylabel('Frequency')
title('Histogram of Gaussian Distribution n = 400')


means = [mean1 mean2 mean3 mean4 mean5];
vars = [var1 var2 var3 var4 var5];
dim = [4 25 100 225 400];

figure(6)
scatter(dim, means)
xlabel('n Dimensions')
ylabel('Mean Norm of Distribution')
title('Mean of Norms vs n Dimensions')

figure(7)
scatter(dim, vars)
ylim([.41 .57])
xlabel('n Dimensions')
ylabel('Variance of Norm Distribution')
title('Variance of Norms vs n Dimensions')




end

