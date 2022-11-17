
close all
clear all

rodAnglePD = readmatrix('rodAnglePD.csv');
rodAngleLQR = readmatrix('rodAngleLQR.csv');

end_num = 150;
rodAnglePD = rodAnglePD(1:end_num);
rodAngleLQR = rodAngleLQR(1:end_num);

t = linspace(0,end_num * 0.001,end_num); %1000 Hz == 1 ms

f1 = figure;
f1.Position = [170 670 600 260]; 
plot(t,rodAngleLQR,t ,rodAnglePD, 'LineWidth', 1);
set(gca, 'FontSize', 12);
title(['\fontname{times new roman}' 'rod angle'], 'fontsize', 16);
xlabel(['\fontname{times new roman}' 'time (sec)'], 'fontsize', 16);
ylabel(['\fontname{times new roman}' 'angular (rad)'], 'fontsize', 16);
h_legend = legend({'LQR','PD'});
set(h_legend, 'fontname', 'times new roman', 'fontsize', 12);
xlim([0 0.15]);
ylim([-0.1 0.2])