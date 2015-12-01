function s = dataAnalysis(grid, N, F, Q, w, t)

for x = 1:N
    for y = 1:N
        s(t,x,y) = -1;
        
        if (~isEmpty(grid, x, y))
            p = computeProbabilityAxel(grid, N, F, Q, w, x, y);
            %p = computeProbability(grid, N, F, Q, w, x, y);
            
            s(t,x,y) = p;
        end
    end
end
end

