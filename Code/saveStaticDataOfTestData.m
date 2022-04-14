close all;
clear;
clc;
addpath('..');

fs = 1000;
threshold = 0.1; % Threshold value in Equation (4)
winSize = 10;
D1 = dir('F:\14P\test');
n = length(D1)-2;

for f = 3 : n
    file = ['F:\14P\test\',D1(f).name]; % The 'test' folder contains the following folders：P1,P2,...,P9,10,11,...
    D2 = dir(file);
    for i = 3 : length(D2) 
        datName = D2(i).name;
        fullName = [D2(i).folder,'\',datName];
        %% read raw data
        csi_trace = read_bf_file(fullName);
        packetNumber = length(csi_trace);

        %% get MSV of the test data

        % For Tx1-Rx1
        csi11 = GetOnePairCsi(csi_trace, packetNumber, 1, 1);
        csi11_filter = preProcess(csi11,fs,packetNumber); % pre-processing
        VarMatrix1 = SlidingWindowVar(csi11_filter, packetNumber, winSize, threshold);%此处去除了所有30个维度第一个窗口的方差，因为该方差过大
        % For Tx1-Rx2
        csi12 = GetOnePairCsi(csi_trace, packetNumber, 1, 2);
        csi12_filter = preProcess(csi12,fs,packetNumber); 
        VarMatrix2 = SlidingWindowVar(csi12_filter, packetNumber, winSize, threshold);
        % For Tx1-Rx3
        csi13 = GetOnePairCsi(csi_trace, packetNumber, 1, 3);
        csi13_filter = preProcess(csi13,fs,packetNumber); 
        VarMatrix3 = SlidingWindowVar(csi13_filter, packetNumber, winSize, threshold);
        % Combine, and get the MSV of Tx1-Rx1,2,3
        VarSum = VarMatrix1 +  VarMatrix2 + VarMatrix3 ;
        VarSum = hampel(VarSum,5);

        %% Segmentation to obtain stationary state data
        [Static_Trace1, Start_Point, Stop_Point, packetNumber] = GetStaticData(VarSum,winSize,csi_trace);
       

        %% save to .mat file
        NumOfWindow = 10; %LSTM分块的大小
        NumOfCell = fix(packetNumber/NumOfWindow);%训练数据分块后的实际长度
        test_data = SaveAllMat(Static_Trace1, NumOfCell*NumOfWindow)';
        test_data = RemoveInf(test_data);
        ind = num2str(i-2);
        saveName = [datName(1:7),'_',ind];
        eval([saveName '=test_data']);
        savePath = [file,'\',saveName,'.mat'];
        save(savePath,saveName);
    end
end