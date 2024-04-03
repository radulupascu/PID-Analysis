
data = out.simout.Data;
time = out.simout.Time;

[~, sigmaIdx] = max(data);

[xtt_, ytt] = tt(data, time);
[xtc_, y10tc, y90tc] = tc(data, time);

disp(['tt= ', num2str(xtt_), 's'])
disp(['tc= ', num2str(xtc_), 's'])

refValue = 1; % Adjust this to the level of your step input

yst = mean(data(1 :end));
epsilon_st = refValue - yst;
disp(['Stationary Error: ', num2str(epsilon_st)]);
disp(['Overshoot:', num2str((data(sigmaIdx) - refValue) / refValue * 100), '%'])

% Plotting the system response
% plot(time, data, 'LineWidth', 2, 'DisplayName', 'System Response');
% hold on;

% Plotting the step reference (assuming it starts at time(1))
% stepTime = [time(1), time(end)]; % Time range for the step
% stepLevel = [refValue, refValue]; % Level of the step
% plot(stepTime, stepLevel, '--r', 'LineWidth', 2, 'DisplayName', 'Step Reference');

% Plotting the points at tc and tt
% plot(time(y10tc), data(y10tc), 'ko', 'MarkerFaceColor', 'k'); % Dot for y10tc
% plot(time(y90tc), data(y90tc), 'ko', 'MarkerFaceColor', 'k'); % Dot for y90tc


% plot(time(ytt), data(ytt), 'rx', 'MarkerSize', 8); % Dot for y10tc

% hold off;
% grid on;
