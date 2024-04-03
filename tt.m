function [xtt, ytt] = tt(data, time)
    % Initial value and steady-state value
    y0 = data(1);
    yst = data(end);
    
    % Calculate the growth value for the specified percentage
    y95procent = y0 + 0.95 * (yst - y0);
    y105procent = y0 + 1.05 * (yst - y0);
    
     for i = length(data):-1:1
         if data(i) <= y95procent || data(i) >= y105procent
                 targetIdx = i;
             % If both conditions are to be met before breaking, consider redesigning this logic
             % Break the loop once the first intersecting value for either condition is found
                break;
         end
     end

    % Find the index where the data first reaches or exceeds the specified growth value
%     targetIdx = find(data >= y95procent, 1, 'first');
    % target105 = find(data >= y105procent, 1, 'first');

    % Check if the target index is found
    xtt = time(targetIdx);
    ytt = targetIdx;
end


