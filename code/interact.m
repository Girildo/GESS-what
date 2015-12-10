function newGrid = interact(grid, N, F, Q, x, y)
% Returns the grid after two agents have interacted

neighbours = getNeighbours(grid, N, F, Q, x, y);

randomNeighbour = randperm(size(neighbours,2));
randomFeature = randperm(F);

grid(x, y, randomFeature(1)) = neighbours(randomFeature(1), randomNeighbour(1));

newGrid = grid;
end

