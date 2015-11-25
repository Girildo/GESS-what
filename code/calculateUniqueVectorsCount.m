function k = calculateUniqueVectorsCount(grid, N, F, Q)
mat = zeros(F, N*N); %Matrix containing all the feature vectors as columns
for x = 1:N
    for y = 1:N
        mat(:, (x-1)*N + y) = squeeze(grid(x, y, :)); %%create such matrix
    end
end
mat = mat'; % transpose it 'cause dumb working of unique
mat = unique(mat, 'rows'); %remove repeated entries
k = size(mat, 1) -1; % returns # of rows (cause everything was transposed) in unique matrix
                     % -1 because [0 0 0] is not to be counted but surely
                     % present

end

