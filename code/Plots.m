%% 

clc;
close all;
clear all;

figure(1)

load('data/plotcorrelation.mat');

plot(data175(:,2),data175(:,3),'m-o',data275(:,2),data275(:,3),'b-o',data375(:,2),data375(:,3),'r-o',data475(:,2),data475(:,3),'g-o');
hold on
plot(data185(:,2),data185(:,3),'m--s',data285(:,2),data285(:,3),'b--s',data385(:,2),data385(:,3),'r--s',data485(:,2),data485(:,3),'g--s');
xlabel('t_{low}')
ylabel('Happy agents [%]')
ylim([0 100])
title('Satisfied agents as function of t_{low} after 100 timesteps','FontSize',22)
legend('vacancies = 0.1, t_{up}=0.75','vacancies = 0.2, t_{up}=0.75', 'vacancies = 0.3, t_{up}=0.75', 'vacancies = 0.4, t_{up}=0.75', ...
    'vacancies = 0.1, t_{up}=0.85','vacancies = 0.2, t_{up}=0.85', 'vacancies = 0.3, t_{up}=0.85', ...
    'vacancies = 0.4, t_{up}=0.85','location','southwest')
set(figure(1), 'PaperPosition', [0 0 45 25])
set(gca,'FontSize',20)
name = strcat('/figures/correlation');
saveas(gca,[pwd name],'png')