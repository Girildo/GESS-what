function gridPlot = plotCriterion1(grid, N, F, Q, w)

gridPlot = zeros(N,N,3);
for x=1:N
    for y=1:N
        gridPlot(x,y,1) = 1 - 1/Q * grid(x,y,1);
        gridPlot(x,y,2) = 1 - 1/Q * grid(x,y,2);
        gridPlot(x,y,3) = 1 - 1/Q * grid(x,y,3);
    end
end
end

