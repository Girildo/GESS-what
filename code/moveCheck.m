function grid = moveCheck(grid, N, F, Q, w, xstart, ystart, tolInterval)
xnew = xstart;
ynew = ystart;

found = 0; % interrupt loop
finish = 1;

while (finish ~= 0 && finish < 100)
    
    indexesx = randperm(N);
    indexesy = randperm(N);
    
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
    
    if (xnew ~= xstart || ynew ~=ystart)
        grid(xnew,ynew,:) = grid(xstart,ystart,:);
        grid(xstart,ystart,:) = zeros(1,F);
        
        xstart = xnew;
        ystart = ynew;
    end 
    
    finish = finish + 1;
    
    if computeProbabilityAxel(grid, N, F, Q, w, xstart, ystart) > tolInterval(1)
        finish = 0;
    end
end
end

