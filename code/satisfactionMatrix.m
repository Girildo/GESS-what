function satisfactionMatrix = satisfactionMatrix(grid, satisfactionIndex, N, t, tolInterval)

satisfactionMatrix = zeros(N,N);
for x = 1:N
    for y = 1:N
        if (~isEmpty(grid, x, y))
            if (satisfactionIndex(t,x,y) < tolInterval(1)) % go away
                satisfactionMatrix(x,y) = 1;
            elseif (satisfactionIndex(t,x,y) < tolInterval(2)) % interaction
                satisfactionMatrix(x,y) = 2;
            else % satisfaction, nothing happens
                satisfactionMatrix(x,y) = 3;
            end
        end
    end
end

