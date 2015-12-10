function [] = plotGridDirect (gridMatrix, N, F, Q, tolInterval, vacancies, satisfactionMatrix, t, featureCountHistory, graphVisualization)
% Plots of all grid and satisfaction grid

gridPlot = generateGridPlot(gridMatrix, N, F, Q);

% Define title
ti = strcat('t=',num2str(t-1));

fonttitle = 18;
fontplot = 16;

if (t == 1)
    f1 = subplot(2,3,1); % time zero
    image(gridPlot)
    title({'Grid plot';ti},'FontSize', fonttitle)
    set(f1,'xticklabel',[],'yticklabel',[])
    
    f2 = subplot(2,3,2); % time zero
    imagesc(satisfactionMatrix)
    title({'Satisfaction plot';ti},'FontSize', fonttitle)
    set(f2,'xticklabel',[],'yticklabel',[])
    colormap(f2, [1 1 1; 1 0 0; 0 0 1; 0 1 0])
    caxis([0 3])
    %colorbar(f2)
    pause(0.01)
else
    f3 = subplot(2,3,4);
    image(gridPlot)
    title({'Grid plot';ti},'FontSize', fonttitle)
    set(f3,'xticklabel',[],'yticklabel',[])
    
    f4 = subplot(2,3,5);
    imagesc(satisfactionMatrix)
    title({'Satisfaction plot';ti},'FontSize', fonttitle)
    set(f4,'xticklabel',[],'yticklabel',[])
    colormap(f4, [1 1 1; 1 0 0; 0 0 1; 0 1 0])
    caxis([0 3])
    %colorbar(f4)
    pause(0.01)
    
    f5 = subplot(2,3,[3 6]);
    plot((1:t), featureCountHistory, 'black', ...
        (1:t), graphVisualization(1,2:end), 'green', ...
        (1:t), graphVisualization(2,2:end), 'blue', ...
        (1:t), graphVisualization(3,2:end), 'red')
    legend('Unique feature vectors [%]', 'Happy agents [%]', 'Interacting agents [%]', 'Unhappy agents [%]','location','southoutside')
    xlim([1 floor(t/20)*20+20])
    ylim([0 100])
    xlabel('Time')
    ylabel('Percentage [%]')
    grid on
    set(f5,'FontSize',fontplot)
    t1 = strcat('t_{low}=',num2str(tolInterval(1)),...
        ',t_{up}=',num2str(tolInterval(2)),...
        ',vacancies=',num2str(vacancies));
    title({'Parameters:';t1},'FontSize', fontplot)
end
end


