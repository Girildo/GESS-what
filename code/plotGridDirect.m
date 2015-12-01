function [] = plotGridDirect (grid, N, F, Q, w, satisfactionMatrix, t, featureCountHistory, graphVisualization)

gridPlot = plotCriterion1(grid, N, F, Q, w);


% Define title
ti = strcat('Step: ',num2str(t-1));

if (t == 1)
    f1 = subplot(2,3,1); % time zero
    image(gridPlot)
    title(ti,'FontSize', 16)
    
    f2 = subplot(2,3,2); % time zero
    imagesc(satisfactionMatrix)
    title(ti,'FontSize', 16)
    colormap(f2, [1 1 1; 1 0 0; 0 0 1; 0 1 0])
    caxis([0 3])
    %colorbar(f2)
    pause(0.01)
else
    f3 = subplot(2,3,4);
    image(gridPlot)
    title(ti,'FontSize', 16)
    
    f4 = subplot(2,3,5);
    imagesc(satisfactionMatrix)
    title(ti,'FontSize', 16)
    colormap(f4, [1 1 1; 1 0 0; 0 0 1; 0 1 0])
    caxis([0 3])
    %colorbar(f4)
    pause(0.01)
    
    f5 = subplot(2,3,[3,6]);
    x = [(1:t)', (1:t)', (1:t)'];
    y = [graphVisualization(1,2:end)',graphVisualization(2,2:end)', graphVisualization(3,2:end)'];
    [ha, l1, l2] = plotyy((1:t)', featureCountHistory',x,y);
    set(ha(1),'ylim',[0 1000],'ytick',[250 500 750 1000])
    set(ha(2),'ylim',[0 100],'ytick',[25 50 75 100])
    set(ha, 'xlim', [1 floor(t/20)*20+20])
    xlabel('Timesteps')
    ylabel(ha(1),'Number of unique feature vectors')
    ylabel(ha(2),'Percentage of agents')
    ha(1).YColor = [0 0 0];
    ha(2).YColor = [0 0 0];
    l1.Color = 'black';
    if(numel(l2) > 1)
        l2(1).Color = [0 0.8 0.2];
        l2(2).Color = 'blue';
        l2(3).Color = 'red';
        legend('Number of unique feature vectors', 'Happy agents (%)', 'Interacting agents (%)', 'Unhappy agents (%)','location','southoutside');
    end
end
end


