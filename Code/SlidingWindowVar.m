function [MSV] = SlidingWindowVar(csi_filter, packetNumber, winSize, threshold)
    n = fix(packetNumber/winSize);
    result = zeros(n, 30);
    for i = 1:30
        for j = 1:n
            result(j,i) = var(csi_filter((winSize*(j-1)+1:j*winSize),i));
        end
    end
    VarMatrix = result(2:n,:);%
    flag = zeros(n-1,30);
    for i = 1:30
        for j = 1:n-1
            if VarMatrix(j,i) > threshold
                flag(j,i) = 1; 
            end
        end
    end 
%     figure;
%     subplot(3,1,1)
%     plot(csi_filter)
%     subplot(3,1,2)
%     plot(VarMatrix)
%     subplot(3,1,3)
%     plot(flag(:,1))
    MSV = sum(flag,2);
end
