function [Start_Point,Stop_Point] = Segmention(x, winSize)
 % Adaptive threshold segmentation algorithm
    y = smoothdata(x,'gaussian','SmoothingFactor',0.5); % Gaussian-weighted moving average filter
    a = 1; % Threshold value in Equation (5) 
    mini = min(y); 
    T = 2*mini + a;
    L = length(y);

    f = zeros(L,1);
    for i = 1:L
        if y(i,1) < T
            f(i,1) = 1;
        end
    end

    f2 = hampel(f,50); % Abnormal value removing
    
%% Get the starting and ending points of the stationary state
    for i = 1:L
        if f2(i,1) == 1
            Start_Point = i;
            break;
        end
    end

    for i = Start_Point:L
        if f2(i,1) == 0
            Stop_Point = i;
            break;
        end
    end
    
    Start_Point = Start_Point*winSize + winSize/2;
    Stop_Point  = Stop_Point*winSize - winSize/2; 
%     figure;
%     subplot(2,1,1)
%     plot(y)
%     title('Data After Gaussian Smooth Filter')
%     subplot(2,1,2)
%     plot(f);
%     ylim([-0.5 1.5])
%     title('Without Hampel Filter')
%     
%     figure;
%     subplot(3,1,1)
%     plot(csi11)
%     title('Raw Data')
%     subplot(3,1,2)
%     plot(VarSum)
%     title('Preprocessed Data')
%     subplot(3,1,3)
%     plot(f)
%     ylim([-0.5 1.5])
%     title('Segmented Point')
end

