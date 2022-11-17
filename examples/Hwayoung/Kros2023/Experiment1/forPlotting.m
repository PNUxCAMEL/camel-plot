close all
clear all

end_num = 1822;
end_num2 = 300;
t = linspace(0,end_num * 0.001,end_num); %1000 Hz == 1 ms
t2 = linspace(0,end_num2 * 0.001,end_num2); %1000 Hz == 1 ms

PlanarBHPosition = readmatrix('Planar_BHPosition.csv');
PlanarBHVelocity = readmatrix('Planar_BHVelocity.csv');
PlanarBHTorque = readmatrix('Planar_BHTorque.csv');
PlanarBHDesiredPosition = readmatrix('Planar_BHDesiredPosition.csv');
PlanarBHDesiredVelocity = zeros(1, end_num2);
PlanarBHDesiredTorque = readmatrix('Planar_BHDesiredTorque.csv');
TwoLegBHPosition = readmatrix('TwoLeg_BHPosition.csv');
TwoLegBHVelocity = readmatrix('Ice_BHVelocity.csv');
TwoLegBHTorque = readmatrix('Ice_BHTorque.csv');

TwoLegBHPosition = TwoLegBHPosition(1:end_num);
TwoLegBHVelocity = TwoLegBHVelocity(1:end_num2);
TwoLegBHTorque = TwoLegBHTorque(1:end_num2);
PlanarBHPosition = PlanarBHPosition(1:end_num);
PlanarBHVelocity = PlanarBHVelocity(1:end_num2);
PlanarBHTorque = PlanarBHTorque(1:end_num2);
PlanarBHDesiredPosition = PlanarBHDesiredPosition(1:end_num);
PlanarBHDesiredTorque = PlanarBHDesiredTorque(1:end_num2);

TwoLegBHPosition(1480:end_num) = -10;


f1 = figure;
f1.Position = [170 670 600 260];
plot(t,PlanarBHPosition,t ,TwoLegBHPosition, t, PlanarBHDesiredPosition, 'LineWidth', 1);
set(gca, 'FontSize', 12);
title(['\fontname{times new roman}' 'Back Hip Position'], 'fontsize', 16);
xlabel(['\fontname{times new roman}' 'Time (sec)'], 'fontsize', 16);
ylabel(['\fontname{times new roman}' 'Angular Position (rad)'], 'fontsize', 16);
h_legend = legend({'Proposed','Simplified', 'Desired'});
set(h_legend, 'fontname', 'times new roman', 'fontsize', 10);
xlim([0 1.78]);
ylim([-3 -1])
% a = get(gca,'XTickLabel');
% set(a,'FontName','Times','fontsize',18)

f2 = figure;
f2.Position = [470 670 300 200];
plot(t2,PlanarBHVelocity,t2 ,TwoLegBHVelocity, t2, PlanarBHDesiredVelocity, 'LineWidth', 1);
set(gca, 'FontSize', 12);
title(['\fontname{times new roman}' 'Back Hip Velocity'], 'fontsize', 14);
xlabel(['\fontname{times new roman}' 'Time (sec)'], 'fontsize', 14);
ylabel(['\fontname{times new roman}' 'Angular Velocity (rad/s)'], 'fontsize', 14);
ylim([-2 6])

f3 = figure;
f3.Position = [770 670 300 200];
plot(t2,PlanarBHTorque,t2 ,TwoLegBHTorque, t2, PlanarBHDesiredTorque, 'LineWidth', 1);
set(gca, 'FontSize', 12);
title(['\fontname{times new roman}' 'Back Hip Torque'], 'fontsize', 14);
xlabel(['\fontname{times new roman}' 'Time (sec)'], 'fontsize', 14);
ylabel(['\fontname{times new roman}' 'Torque (Nm)'], 'fontsize', 14);
% ylim([-110 150])

% f4 = figure;
% f4.Position = [800 570 280 420];
% plot(t,torqueLQR,t ,torquePD, 'LineWidth', 1);
% title(['\fontname{times new roman}' 'motor torque'], 'fontsize', 14);
% xlabel(['\fontname{times new roman}' 'time (sec)'], 'fontsize', 14);
% ylabel(['\fontname{times new roman}' 'torque (N*m)'], 'fontsize', 14);
% h_legend = legend({'LQR','PD'});
% set(h_legend, 'fontname', 'times new roman', 'fontsize', 12);
% 
% powerPD = zeros(size(t));
% sumPowerPD = 0;
% 
% powerLQR = zeros(size(t));
% sumPowerLQR = 0;
% 
% for i = 1:1:152
%     sumPowerPD = sumPowerPD + torquePD(i)*torquePD(i);
%     powerPD(i) = sumPowerPD;
%     sumPowerLQR = sumPowerLQR + torqueLQR(i)*torqueLQR(i);
%     powerLQR(i) = sumPowerLQR;
% end
% 
% f5 = figure;
% f5.Position = [800 50 280 420];
% plot(t,powerLQR,t ,powerPD, 'LineWidth', 1);
% title(['\fontname{times new roman}' 'used power'], 'fontsize', 14);
% xlabel(['\fontname{times new roman}' 'time (sec)'], 'fontsize', 14);
% ylabel(['\fontname{times new roman}' 'power (W)'], 'fontsize', 14);
% h_legend = legend({'LQR','PD'});
% set(h_legend, 'fontname', 'times new roman', 'fontsize', 12);