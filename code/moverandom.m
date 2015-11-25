function grid = moverandom(grid, N, F, xstart, ystart)
xnew = xstart;
ynew = ystart;

indexesx = randperm(N);
indexesy = randperm(N);
found = 0; % interrupt loop

for i=1:N
    x = indexesx(i);
    for j=1:N
        y = indexesy(j);
        if (grid(x,y,1) == 0) % cell is empty
            xnew = x; 
            ynew = y;
            found = 1;
        end 
        
        if (found == 1)
            break
        end
    end
    if (found == 1)
        break
    end
end 

% update the grid
grid(xnew,ynew,:) = grid(xstart,ystart,:);
grid(xstart,ystart,:) = zeros(1,F);
end

