clear all;
close all;
clc;

run parameters

n = 10;
res = 1/n;

tolInterval = zeros(n*n,2);

for vacancies = 0.05:0.05:0.3
    for i = 1:n
        for j = 1:i
            a = i*res; % greatest value (max tolerance)
            b = j*res; % smallest value (min tolerance)
            tolInterval((i-1)*n+j,:) = [b, a];
            main(time, N, F, Q, w, vacancies, [b a]);
        end
    end
end

