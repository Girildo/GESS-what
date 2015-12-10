close all;
clear;
clc;

time = 1000;                         % Simulation time
N = 50;                              % Spatial grid size
F = 3;                               % Grid depth = number of features
Q = 10;                              % # of possible traits pro feature
vacancies = 0.10;                    % Blank spaces
tolInterval = [0.20 0.85];           % Tolerance interval for interaction
radius = 10;                         % Radius for the circles (initial conditions)                                  
print = false;                       % if print = true: save figure
video = false;                       % if print = true: save video