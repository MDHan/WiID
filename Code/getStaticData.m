function [StaticData, Start_Point, Stop_Point, n] = GetStaticData(x, winSize, csi_trace)
    % Get the csi_trace at stationary state, the start and end points, and the packet number
    % x: Motion Sensitivity Vector (MSV)
    % winSize: Window size
    % csi_trace: Raw test data
    [Start_Point, Stop_Point] = Segmention(x, winSize); % Splitting out the stationary part of the raw test data using MSV we get
    
    n = Stop_Point - Start_Point + 1;% Length of stationary state signal
    
    temp = cell(1,n);
    
    for i = Start_Point : Stop_Point
        index = i-Start_Point+1;
        temp(index) = csi_trace(i);
    end
    
    StaticData = temp;
end

