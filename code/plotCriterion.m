function gridPlot = plotCriterion(grid, N, F, Q, w)

gridPlot = zeros(N,N);
for x=1:N
    for y=1:N
        similarity = 0.8;
        if(~isEmpty(grid, x, y))
            similarity = colorModel(grid, N, F, Q, w, x, y);
        end
        gridPlot(x, y) = similarity;
    end
end

end

