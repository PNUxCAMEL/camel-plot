% This code is not working.
% This is just for examples of other options.

% for boldic font
title(['\fontname{times new roman}' 'rod angle'],'fontweight','bold', 'fontsize', 16);

%change legend position
h_legend = legend({'LQR','PD'},'Location','northwest');

%edit legend columns
h_legend = legend({'LQR','PD'},'NumColumns',2);
