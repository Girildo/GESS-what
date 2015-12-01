close all;
clear;
clc;

time = 1000;                         % Simulation time
N = 75;                              % Spatial grid size
F = 3;                               % Grid depth = number of features
Q = 10;                              % # of possible traits pro feature
w = ones(F, 1);                      % Weights for the features
vacancies = 0.20;                    % Blank spaces
%tolInterval = [0.00 0.85];           % Tolerance interval for interaction
tolInterval = [0.25 0.85];           % Tolerance interval for interaction
%tolInterval = [0.50 0.90];          % Tolerance interval for interaction
radius = 20;                         % Radius for the circles (initial conditions)