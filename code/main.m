function grid = main()

close all;
clear;
clc;

time = 200;                           % Simulation time
N = 75;                              % Spatial grid size
F = 3;                               % Grid depth = number of features
Q = 10;                              % # of possible traits pro feature
w = ones(F, 1);                      % Weights for the features
vacancies = 0.1;                     % Blank spaces
tolInterval = [0.15 0.60];           % Tolerance interval for interaction
data = 1;                            % if data = 1: data analyis                                      
print = 0;                           % if data = 1: data analyis
%Cmap = [colormap('hot'); [1 1 1]];  % Define color map
Cmap = customColormap(4);
% Initialize grid with initial (random) values
grid = initializeGrid(N, F, Q, vacancies);
featureCountHistory = [calculateUniqueVectorsCount(grid, N, F, Q)];

for t = 1:time+1
    indexesx = randperm(N);
    indexesy = randperm(N);
    
    % Data analysis
    if (data == 1)
        satisfactionIndex = dataAnalysis(grid, N, F, Q, w, t);
        satisfactionPlot = satisfactionMatrix(grid, satisfactionIndex, N, t, tolInterval);
    end
    
    % Choose agent
    for i=1:N % Iteration for the x-coordinate
        %x = indexesx(i);
        for j=1:N % Iteration for the y-coordinate
            x = indexesx(mod(i+j,N)+1);
            y = indexesy(j);
            
            if (~isEmpty(grid, x, y))
                % Compute satisfaction factor
%                 p = computeProbability(grid, N, F, Q, w, x, y);
%                 
%                 p = p > 0.65;
%                 pCount = p(p ~= 0); % Neighbours you agree with
%                 
%                 % Check
%                 if ((size(pCount, 2)/size(p, 2)) < tolInterval(1))
%                     grid = moverandom(grid, N, F, x, y);
%                 elseif ((size(pCount, 2)/size(p, 2)) < tolInterval(2))
%                     grid = interact(grid, N, F, Q, p, x, y);
%                 end

                p = computeProbabilityAxel(grid, N, F, Q, w, x, y);
               
                if (p < tolInterval(1))
                    grid = moverandom(grid, N, F, x, y);
                    %grid = moveCheck(grid, N, F, Q, w, x, y, tolInterval);
                elseif (p < tolInterval(2))
                    grid = interact(grid, N, F, Q, p, x, y);
                end
            end
        end
    end
    
last = figure(1);
plotGridDirect(grid, N, F, Q, w, satisfactionPlot, t, data, tolInterval, Cmap)
if print == 1
    set(last, 'PaperPosition', [0 0 40 18])
    saveas(figure(1),[pwd strcat('/figures/tol1=',num2str(a),', tol2=', num2str(b),', Last.png')],'png')
end

featureCountHistory = [featureCountHistory calculateUniqueVectorsCount(grid, N, F, Q)];
figure(2);
plot(1:t+1, featureCountHistory);
ylim([0 1000]);
title('Unique feature vectors');
if all(satisfactionPlot == 0 | satisfactionPlot == 3) % break if nothing happens
    break;
end


end 