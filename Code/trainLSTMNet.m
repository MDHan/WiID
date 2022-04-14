clear;
clc;
close all;
load F:\14P\Pca_Train.mat
load F:\14P\NumOfPC.mat
NumOfPerson = 14;
NumOfWindow = 10;
NumOfTrain = 8000; % packets number
NumOfCell = NumOfPerson * NumOfTrain / NumOfWindow;
NumOfFeature = NumOfPC;
% 
% Train = [Pca_csi1' Pca_csi2' Pca_csi3' Pca_csi6' Pca_csi7' Pca_csi8']';
XTrain = mat2cell(Pca_Train,NumOfWindow*ones(1,NumOfCell * 8),[NumOfFeature]);
for i = 1 : NumOfCell * 8
    XTrain{i}=XTrain{i}';
end

trainGroup = ones(1,NumOfTrain/NumOfWindow);
for i = 2:NumOfPerson 
    trainGroup = [trainGroup ,i*ones(1,NumOfTrain/NumOfWindow)]; 
end
YTrain = trainGroup';
YTrain = [YTrain;YTrain;YTrain;YTrain;YTrain;YTrain;YTrain;YTrain];
YTrain=categorical(YTrain);

%% creat LSTM net
inputSize = NumOfFeature;
numHiddenUnits = 120;     % Number of hidden cells
NumOfClass = NumOfPerson; % Number of labels (number of people)

layers = [ ...
    sequenceInputLayer(inputSize)
    lstmLayer(numHiddenUnits,'OutputMode','last')
    fullyConnectedLayer(NumOfClass)
    softmaxLayer
    classificationLayer];

maxEpochs = 50;     % Maximum number of training cycles
miniBatchSize = 32; % Batch size

options = trainingOptions('adam', ...
    'ExecutionEnvironment','gpu', ...
    'MaxEpochs',maxEpochs, ...
    'MiniBatchSize',miniBatchSize, ...
    'GradientThreshold',1, ...
    'Verbose',1, ...
    'ValidationFrequency',30, ...
    'Plots','training-progress');

%% training
net=trainNetwork(XTrain,YTrain,layers,options);

save('F:\14P\LSTMnet14p.mat','net');
