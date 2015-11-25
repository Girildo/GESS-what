function ptot = computeProbabilityAxel(grid, N, F, Q, w, x, y)

neighbours = getNeighbours(grid, N, F, Q, x, y);
me = squeeze(grid(x,y,:));
neighbourCount = size(neighbours, 2);
%p = zeros(1,size(neighbours, 2));
n = zeros(1, neighbourCount);
meMatrix = repmat(me, 1, neighbourCount);
% for i = 1:size(neighbours, 2)
%     n(i) = size(((me - neighbours(:, i)) == 0)==1, 2);
% end
matrixComparison = meMatrix - neighbours;
count = size(matrixComparison(matrixComparison == 0), 1);
%ptot = min(1, 4.5 * count / (neighbourCount * F));
ptot = count / (neighbourCount * F);
end

