function [] = plotGrid (grid, N, F, Q, w, satisfactionMatrix, t, data, tolInterval, Cmap)

    gridPlot = plotCriterion(grid, N, F, Q, w);
        
    if (data == 1)
        f1 = subplot(1,2,1);
        imagesc(gridPlot)
        title(num2str(t))
        f2 = subplot(1,2,2);
        imagesc(satisfactionMatrix)
        title(num2str(t))
        colormap(f1, Cmap)
        caxis(f1,[-0.5 0.8])
        colorbar(f1)
        colormap(f2, [1 1 1; 1 0 0; 0 0 1; 0 1 0])
%         colorbar
%         f3 = subplot(2,2,[3,4]);
%         bar3h(grid(:,:,1)+grid(:,:,2)+grid(:,:,3))
        pause(0.01)
    else
        f1 = subplot(1,2,1);
        imagesc(gridPlot)
        title(num2str(t))
        colormap(f1, Cmap)
        caxis(f1,[-0.6 0.8])
        colorbar(f1)
%         f3 = subplot(1,2,2);
%         bar3h(grid(:,:,1)+grid(:,:,2)+grid(:,:,3))
        pause(0.01)
    end 
end

