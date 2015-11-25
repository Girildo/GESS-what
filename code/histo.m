function [] = histo(b)
figure
for i=1:9
    subplot(3,3,i)
    if (i<5)
        hist(b(i,:))
        xlim([0 1])
        ylim([0 2000])
        title(num2str(i))
    else 
        hist(b(end-(9-i),:))
        xlim([0 1])
        ylim([0 2000])
        title(num2str(size(b,1)-(9-i)))
    end 
end 


end

