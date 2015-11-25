%% 
tic
main();
toc


%%
a = initializeGrid(30, 10, 10, 0.1);
for x = 1:30
    for y = 1:30
        if isEmpty(a,x,y)
            A(x,y) = -1;
        else 
            A(x,y) = colorModel(a, 100, 10, 10, ones(10,1), x, y);
        end 
    end 
end 

figure(1)
for i = 1:9
    subplot(3,3,i)
    if (i<5)
        hist(A(i,:),30)
        %xlim([0 1])
    else
        hist(A(end-(9-i),:),30)
        %xlim([0 1])
    end
end 

 



%%
for i=1:1000
    b(i) = round(0.5 + rand(1,1) * 5);
end

hist(b)