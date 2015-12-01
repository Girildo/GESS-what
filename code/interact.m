function newGrid = interact(grid, N, F, Q, p, x, y)
neighbours = getNeighbours(grid, N, F, Q, x, y);

%randomNeighbour = randperm(max(size(p)));
randomNeighbour = randperm(size(neighbours,2));
randomFeature = randperm(F);


nb = min(round(0.5 * (size(neighbours,2))*rand(1,1)),F);
nb = 1;

for i=1:nb
    grid(x, y, randomFeature(i)) = neighbours(randomFeature(i), randomNeighbour(i));
end 

newGrid = grid;

% grid(x, y, randomFeature(1)) = neighbours(randomFeature(1), randomNeighbour(1));
% grid(x, y, randomFeature(1)) = neighbours(randomFeature(1), randomNeighbour(2));
% grid(x, y, randomFeature(1)) = neighbours(randomFeature(1), randomNeighbour(3));
% newGrid = grid;
end

