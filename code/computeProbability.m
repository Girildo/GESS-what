function ptot = computeProbability(grid, N, F, Q, w, x, y)

neighbours = getNeighbours(grid, N, F, Q, x, y);

% Allocate space
p = zeros(1,size(neighbours, 2));

% Current Element
current = squeeze(grid(x, y, :));

for i = 1:size(neighbours, 2)
    % Actual equation
    % partialSum(j) = w(j) * abs(current(j) - neighbours(j,i)
    partialSum = w .* abs(current - neighbours(:,i));
    p(i) = 1 - 1/((Q-1)*sum(w))*sum(partialSum);
end 

p = p > 0.65;
pCount = p(p ~= 0); % Neighbours you agree with

% Check
ptot = size(pCount, 2)/size(p, 2);

end

