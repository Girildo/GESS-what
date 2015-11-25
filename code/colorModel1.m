function  similarity = colorModel1(grid, N, F, Q, w, x, y)

modelMiddle = Q/2 * ones(F, 1);
modelExtreme1 = ones(F, 1);
modelExtreme2 = Q*ones(F, 1);
currentElement = squeeze(grid(x, y, :));

partialSumMiddle   = w .* abs(currentElement - modelMiddle);
partialSumExtreme1 = w .* abs(currentElement - modelExtreme1);
partialSumExtreme2 = w .* abs(currentElement - modelExtreme2);

similarity = (sum(partialSumMiddle));

if sum(partialSumExtreme1) > sum(partialSumExtreme2)
   similarity =  + similarity;
else similarity =  - similarity;

%similarity = similarity + 0.5;

end

