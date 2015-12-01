function grid = main(time, N, F, Q, w, vacancies, tolInterval)

if(nargin() == 0)
    run parameters
end

data = 1;                            % if data = 1: data analyis                                      
print = 1;                           % if data = 1: data analyis
Cmap = customColormap(4);            % Define color map


% Initialize grid with initial (random) values
grid = initializeGrid(N, F, Q, vacancies);    
grid = initialCondition(grid, 'circle', N, F, Q, radius);

featureCountHistory = [calculateUniqueVectorsCount(grid, N, F, Q)];
graphVisualization = zeros(3,1);

% Zero Time
t = 1;

% Data analysis
if (data == 1)
    satisfactionIndex = dataAnalysis(grid, N, F, Q, w, t);
    [satisfactionPlot, graphVisualization] = satisfactionMatrix(grid, satisfactionIndex, N, t, tolInterval, graphVisualization);
end

figure(1);
plotGridDirect(grid, N, F, Q, w, satisfactionPlot, t, featureCountHistory, graphVisualization)

for t = 2:time+1
    indexesx = randperm(N);
    indexesy = randperm(N);
    
    % Choose agent
    for i=1:N % Iteration for the x-coordinate
        %x = indexesx(i);
        for j=1:N % Iteration for the y-coordinate
            x = indexesx(mod(i+j,N)+1);
            y = indexesy(j);
            
            if (~isEmpty(grid, x, y))
                % Compute satisfaction factor
                p = computeProbabilityAxel(grid, N, F, Q, w, x, y);
                %p = computeProbability(grid, N, F, Q, w, x, y);
                
                if (p < tolInterval(1))
                    %grid = moverandom(grid, N, F, x, y);
                    grid = moveCheck(grid, N, F, Q, w, x, y, tolInterval);
                elseif (p < tolInterval(2))
                    grid = interact(grid, N, F, Q, p, x, y);
                end
            end
        end
    end
    
    % Data analysis
    if (data == 1)
        satisfactionIndex = dataAnalysis(grid, N, F, Q, w, t);
        [satisfactionPlot, graphVisualization] = satisfactionMatrix(grid, satisfactionIndex, N, t, tolInterval, graphVisualization);
        featureCountHistory = [featureCountHistory calculateUniqueVectorsCount(grid, N, F, Q)];
    end
    
    figure(1);
    plotGridDirect(grid, N, F, Q, w, satisfactionPlot, t, featureCountHistory, graphVisualization)
    %set(gca,'fontsize',16);
        
    if all(satisfactionPlot == 0 | satisfactionPlot == 3) % break if nothing happens
        break;
    end
end 

if print == 1
    set(figure(1), 'PaperPosition', [0 0 40 18])
    saveas(figure(1),[pwd strcat('/figures/tol1=',num2str(tolInterval(1)),...
        ', tol2=', num2str(tolInterval(2)),', vac=',num2str(vacancies),'.png')],'png')
end

end 