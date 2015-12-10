function [grid] = main(time, N, F, Q, vacancies, tolInterval, radius, print, video)
% Main simulation function: the final grid is returned

if(nargin() == 0)
    run parameters
end

% Initialize grid with initial (random) values
grid = initializeGrid(N, F, Q, vacancies);
grid = initialCondition(grid, 'a', N, F, Q, radius);

featureCountHistory = [calculateUniqueVectorsCount(grid, N, F, Q)];
graphVisualization = zeros(3,1);

% Zero Time
t = 1;

% Data analysis
satisfactionIndex = dataAnalysis(grid, N, F, Q, t);
[satisfactionPlot, graphVisualization] = satisfactionMatrix(grid, satisfactionIndex, N, t, tolInterval, graphVisualization);

h = figure(1);
set(h, 'Position', [100, 100, 1700, 1200]);
if video == 1
    % Prepare the new file.
    vidObj = VideoWriter('figures/video.avi');
    open(vidObj);
end
plotGridDirect(grid, N, F, Q, tolInterval, vacancies, satisfactionPlot, t, featureCountHistory, graphVisualization)


for t = 2:time+1
    indexesx = randperm(N);
    indexesy = randperm(N);
    
    % Choose agent
    for i=1:N % Iteration for the x-coordinate
        for j=1:N % Iteration for the y-coordinate
            x = indexesx(mod(i+j,N)+1);
            y = indexesy(j);
            
            if (~isEmpty(grid, x, y))
                % Compute satisfaction factor
                p = computeProbabilityAxel(grid, N, F, Q, x, y);
                
                if (p < tolInterval(1))
                    grid = moveCheck(grid, N, F, Q, x, y, tolInterval);
                elseif (p < tolInterval(2))
                    grid = interact(grid, N, F, Q, x, y);
                end
            end
        end
    end
    
    % Data analysis
    satisfactionIndex = dataAnalysis(grid, N, F, Q, t);
    [satisfactionPlot, graphVisualization] = satisfactionMatrix(grid, satisfactionIndex, N, t, tolInterval, graphVisualization);
    featureCountHistory = [featureCountHistory calculateUniqueVectorsCount(grid, N, F, Q)];
    
    plotGridDirect(grid, N, F, Q, tolInterval, vacancies, satisfactionPlot, t, featureCountHistory, graphVisualization)
    %set(h, 'Position', [100, 100, 1049, 895]);
    if video == 1
        % Get the very last frame
        currFrame = getframe(h);
        writeVideo(vidObj,currFrame);
    end
    
    if all(satisfactionPlot == 0 | satisfactionPlot == 3) % break if nothing happens
        break;
    end
end

if video == 1
    close(vidObj);
end 

if print == 1
    set(figure(1), 'PaperPosition', [0 0 45 25])
    name = strcat('/figures/tol1=', num2str(tolInterval(1)),',tol2=',...
        num2str(tolInterval(2)),',vac =',num2str(vacancies),'.png');
    saveas(figure(1),[pwd name],'png')
end
end