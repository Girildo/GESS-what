function s = dataAnalysis(grid, N, F, Q, t)
% updates the matrix containing all the computed satisfaction index
% s(t,x,y) = -1 if a cell is empty

for x = 1:N
    for y = 1:N
        s(t,x,y) = -1;
        if (~isEmpty(grid, x, y))
            p = computeProbabilityAxel(grid, N, F, Q, x, y);
            s(t,x,y) = p;
        end
    end
end
end

