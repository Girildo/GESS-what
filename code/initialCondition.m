function grid = initialCondition(grid, string, N, F, Q, radius)

if strcmp(string, 'leopard')
    xc = round(rand(10,1)*N);
    yc = round(rand(10,1)*N);
    
    for x=1:N % Iteration for the x-coordinate
        for y=1:N % Iteration for the y-coordinate
            for k=1:size(xc,1)
                if (~isEmpty(grid,x,y) && (x-xc(k))^2+(y-yc(k))^2 < radius^2)
                    grid(x,y,:) =  Q * ones(F,1);
                end
            end
        end
    end
    
elseif strcmp(string, 'circle')
    
    xc = round(rand(1,1)*N);
    yc = round(rand(1,1)*N);
    
    for x=1:N % Iteration for the x-coordinate
        for y=1:N % Iteration for the y-coordinate
            if (~isEmpty(grid,x,y) && (x-xc)^2+(y-yc)^2 < radius^2 && (x-xc)^2+(y-yc)^2 > radius^2/4)
                grid(x,y,:) =  Q * ones(F,1);
            end
        end
    end
end
end

