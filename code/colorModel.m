function  similarity = colorModel(grid, N, F, Q, w, x, y)

modelMiddle = (Q+1)/2 * ones(F, 1);
modelExtreme = (Q) * ones(F, 1);
currentElement = squeeze(grid(x, y, :));

partialSumMiddle = w .* abs(currentElement - modelMiddle);
partialSumExtreme = w .* abs(currentElement - modelExtreme);

similarity = 1/((Q-1)*sum(w))*sum(partialSumMiddle);

if sum(partialSumExtreme) > .5 * (Q-1) * F
    similarity = - similarity;
end    


end

