clear all
N = 100;
F = 3;
Q = 10;
w = ones(F, 1);
grid = initializeGrid(N, F, Q, .1);

pTot = -1 * ones(N, N);

for x = 1:N;
    for y = 1:N
        if(~isEmpty(grid, x, y)) 
            pTot(x, y) = computeProbabilityAxel(grid, N, F, Q, w, x, y);
        end
    end
end
a = reshape(pTot, N*N, 1);
%a = 1/(max(max(a))) * a;
hist(a, 100);
xlim([0, 1]);