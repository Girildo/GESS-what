function [satisfactionMatrix, graphVisualization] = satisfactionMatrix(grid, satisfactionIndex, N, t, tolInterval, graphVisualization)
% Returns the satisfaction matrix and the number of satisfied, interacting
% and unhappy agents

happy = 0;          % happy people in the grid
middle = 0;         % people who interact
unhappy = 0;        % people in the grid who want to move
tot = 0;            % people in the grid

satisfactionMatrix = zeros(N,N);
for x = 1:N
    for y = 1:N
        if (~isEmpty(grid, x, y))
            if (satisfactionIndex(t,x,y) < tolInterval(1)) % go away
                satisfactionMatrix(x,y) = 1;
                unhappy = unhappy + 1;
            elseif (satisfactionIndex(t,x,y) < tolInterval(2)) % interaction
                satisfactionMatrix(x,y) = 2;
                middle = middle + 1;
            else % satisfaction, nothing happens
                satisfactionMatrix(x,y) = 3;
                happy = happy + 1;
            end
            tot = tot + 1;
        end
    end
end 

graphVisualization = [graphVisualization [happy/tot*100; middle/tot*100; unhappy/tot*100]];

end

