function [] = plotGridDirect (grid, N, F, Q, w, satisfactionMatrix, t, data, tolInterval, Cmap)

    gridPlot = plotCriterion1(grid, N, F, Q, w);
    
    % Define title
    tit = strcat('Step: ',num2str(t-1));
    
    if (t == 1)
        f1 = subplot(2,2,1); % time zero 
        image(gridPlot)
        title(tit)
        
        f2 = subplot(2,2,2); % time zero
        imagesc(satisfactionMatrix)
        title(tit)
        colormap(f2, [1 1 1; 1 0 0; 0 0 1; 0 1 0])
        caxis([0 3])
        %colorbar(f2)
        pause(0.01)       
    end
        f3 = subplot(2,2,3);
        image(gridPlot)
        title(tit)
        
        f4 = subplot(2,2,4);
        imagesc(satisfactionMatrix)
        title(tit)
        colormap(f4, [1 1 1; 1 0 0; 0 0 1; 0 1 0])
        caxis([0 3])
        %colorbar(f4)
        pause(0.01)
end

