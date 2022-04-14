function [StaticData, Start_Point, Stop_Point, n] = GetStaticData(x, winSize, csi_trace)
    % Get the csi_trace at stationary state, the start and end points, and
    % the packet number
    [Start_Point, Stop_Point] = Segmention(x, winSize); % Splitting out the stationary part of the raw test data
    
    n = Stop_Point - Start_Point + 1;% Length of stationary state signal
    
    temp = cell(1,n);
    
    for i = Start_Point : Stop_Point
        index = i-Start_Point+1;
        temp(index) = csi_trace(i);
    end
    
    StaticData = temp;
end

