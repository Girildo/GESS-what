function gridPlot = generateGridPlot(grid, N, F, Q)
% generates a matrix gridPlot containing the RGB triplets for data
% visualisation

gridPlot = zeros(N,N,3);
for x=1:N
    for y=1:N
        if(F == 3) % visualization with RGB
            gridPlot(x,y,1) = 1 - 1/Q * grid(x,y,1);
            gridPlot(x,y,2) = 1 - 1/Q * grid(x,y,2);
            gridPlot(x,y,3) = 1 - 1/Q * grid(x,y,3);
        else
            if(grid(x, y, 1) == 1) % Schelling
                gridPlot(x, y, :) = [1; 0 ;0];
            else if(grid(x, y, 1) == 2) % Schelling
                    gridPlot(x, y, :) = [0; 0; 1];
                else if(grid(x, y, 1) == 0) % Schelling (empty)
                        gridPlot(x, y, :) = [1; 1 ;1];
                    end
                end
            end
        end
    end
end
end

