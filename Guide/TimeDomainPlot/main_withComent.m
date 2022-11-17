%% clear
close all
clear all

%% read csv
rodAnglePD = readmatrix('rodAnglePD.csv');
rodAngleLQR = readmatrix('rodAngleLQR.csv');

%% cut data size
end_num = 150;
rodAnglePD = rodAnglePD(1:end_num);
rodAngleLQR = rodAngleLQR(1:end_num);

%% generate t (x axis)
t = linspace(0,end_num * 0.001,end_num); %1000 Hz == 1 ms

%% figure
f1 = figure;

%% size and position
f1.Position = [170 670 600 260]; 
% [display x position, display y position, figure x size, figure y size]

%% values
plot(t,rodAngleLQR,t ,rodAnglePD, 'LineWidth', 1);

%% axis tick size * the location is important
set(gca, 'FontSize', 12);

%% other font
title(['\fontname{times new roman}' 'rod angle'], 'fontsize', 16);
xlabel(['\fontname{times new roman}' 'time (sec)'], 'fontsize', 16);
ylabel(['\fontname{times new roman}' 'angular (rad)'], 'fontsize', 16);
h_legend = legend({'LQR','PD'});
set(h_legend, 'fontname', 'times new roman', 'fontsize', 12);

%% asix limit
xlim([0 0.15]);
ylim([-0.1 0.2])