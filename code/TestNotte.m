clear all;
close all;
clc;

N = 20;
res = 1/N;

tolInterval = zeros(N*N,2);

for i = 1:20
    for j = 1:i
        a = i*res; % greatest value (max tolerance)
        b = j*res; % smallest value (min tolerance)
        tolInterval((i-1)*N+j,:) = [b, a];
        main(b, a);
    end
end 

