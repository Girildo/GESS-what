function grid = initializeGrid(N, F, Q, vacancies)
% Initialize a grid with random agents

% Random initial positioning
indexesx = randperm(N);
indexesy = randperm(N);

% Initialize grid
grid = zeros(N,N,F);

for i=1:N % Iteration for the x-coordinate
    x = indexesx(i);
    for j=1:N % Iteration for the y-coordinate
        y = indexesy(j);
        if (rand(1) > vacancies) % If someone is there
            for k=1:F
                grid(x,y,k) = round(0.5 + Q * rand(1,1));
            end
        end
    end
end
end

