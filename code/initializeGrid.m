function grid = initializeGrid(N, F, Q, vacancies)
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
                    % Rand trait
%                     if ((x-30)^2 + (y-30)^2 < 200) 
%                     grid(x,y,k) = 10;
%                     else grid(x,y,k) = 1;
%                     end
                      grid(x,y,k) = round(0.5 + Q * rand(1,1));
                end
            end 
        end
    end
end

