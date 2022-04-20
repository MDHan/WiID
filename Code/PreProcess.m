function [csi_filter] = PreProcess(csi, fk, packetNumber)
% Hampel & Butterworth LPF
    csi_filter = zeros(packetNumber,30);
    for i = 1:30
        x = hampel(csi(:,i),4);
        fp = 20;
        fs = 30;
        wp = fp*2*pi/fk;
        ws = fs*2*pi/fk;
        [N1,wc1]=buttord(wp,ws,1,30);
        [b,a]=butter(N1,wc1);
        Butter_Filter=filter(b,a,x);
        csi_filter(:,i) = Butter_Filter;
    end
%     figure;
%     plot(csi_filter)
%     title('Preprocessed CSI')
end
