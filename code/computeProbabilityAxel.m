function ptot = computeProbabilityAxel(grid, N, F, Q, x, y)
neighbours = getNeighbours(grid, N, F, Q, x, y);
me = squeeze(grid(x,y,:));
neighbourCount = size(neighbours, 2);
%n = zeros(1, neighbourCount);
meMatrix = repmat(me, 1, neighbourCount);
matrixComparison = meMatrix - neighbours;
count = numel(matrixComparison(matrixComparison == 0));
ptot = count / (neighbourCount * F);
end