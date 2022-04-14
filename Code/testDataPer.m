close all;
clear;
clc;
addpath('..');
load F:\14P\coeff.mat;
load F:\14P\mu.mat;
load F:\14P\NumOfPC.mat;
NumOfWindow = 10; % LSTM input size of one sample
idList = [10, 11, 12, 13, 14, 1, 2, 3, 4, 5, 6, 7, 8, 9];
D1 = dir('F:\14P\test');

for f = 3:length(D1)
    file = ['F:\14P\test\',D1(f).name];
    matFile = [file,'\*.mat'];
    D2 = dir(matFile);
    Zdata = cell(1,2);
    for i = 1:length(D2)
        fullName = [D2(i).folder,'\',D2(i).name];
        load(fullName)
        t = D2(i).name(1:end-4);
        test_data = evalin('base',t);
        Pca_Test = Pca_testdata(mu, coeff, NumOfPC, test_data);
        packetNumber = length(test_data);
        NumOfCell = fix(packetNumber/NumOfWindow);
        XTest = mat2cell(Pca_Test,NumOfWindow*ones(NumOfCell,1),[NumOfPC]);
        t = length(XTest);
        testGroup = idList(f-2) * ones(t,1);
        %   YTest = categorical(testGroup); 
        XTest(:,2) = num2cell(testGroup);
        Zdata = [Zdata;XTest];
        L = length(Zdata);
        Zdata = Zdata(2:L,:);
    end
    person = D2(1).name(6:7);
    savePath = ['F:\14P\',person,'_Testdata.mat'];
    save(savePath,'Zdata');
end
