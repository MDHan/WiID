clc; clear; close all;
load F:\14P\LSTMnet14p.mat
Test = cell(1,2);

%% Test set building
load p1_Testdata.mat
n_p1 = length(Zdata);
Test = [Test;Zdata];

load p2_Testdata.mat
Test = [Test;Zdata];
n_p2 = length(Zdata);

load p3_Testdata.mat
Test = [Test;Zdata];
n_p3 = length(Zdata);

load p4_Testdata.mat
Test = [Test;Zdata];
n_p4 = length(Zdata);

load p5_Testdata.mat
Test = [Test;Zdata];
n_p5 = length(Zdata);

load p6_Testdata.mat
Test = [Test;Zdata];
n_p6 = length(Zdata);


load p7_Testdata.mat
Test = [Test;Zdata];
n_p7 = length(Zdata);

load p8_Testdata.mat
Test = [Test;Zdata];
n_p8 = length(Zdata);

load p9_Testdata.mat
Test = [Test;Zdata];
n_p9 = length(Zdata);

load 10_Testdata.mat
Test = [Test;Zdata];
n_10 = length(Zdata);

load 11_Testdata.mat
Test = [Test;Zdata];
n_11 = length(Zdata);

load 12_Testdata.mat
Test = [Test;Zdata];
n_12 = length(Zdata);

load 13_Testdata.mat
Test = [Test;Zdata];
n_13 = length(Zdata);

load 14_Testdata.mat
Test = [Test;Zdata];
n_14 = length(Zdata);

% Test label
testGroup1 = 1 * ones(n_p1,1);
YTest1 = categorical(testGroup1);

testGroup2 = 2 * ones(n_p2,1);
YTest2 = categorical(testGroup2);

testGroup3 = 3 * ones(n_p3,1);
YTest3 = categorical(testGroup3);

testGroup4 = 4 * ones(n_p4,1);
YTest4 = categorical(testGroup4);

testGroup5 = 5 * ones(n_p5,1);
YTest5 = categorical(testGroup5);

testGroup6 = 6 * ones(n_p6,1);
YTest6 = categorical(testGroup6);

testGroup7 = 7 * ones(n_p7,1);
YTest7 = categorical(testGroup7);


testGroup8 = 8 * ones(n_p8,1);
YTest8 = categorical(testGroup8);

testGroup9 = 9 * ones(n_p9,1);
YTest9 = categorical(testGroup9);

testGroup10 = 10 * ones(n_10,1);
YTest10 = categorical(testGroup10);

testGroup11 = 11 * ones(n_11,1);
YTest11 = categorical(testGroup11);

testGroup12 = 12 * ones(n_12,1);
YTest12 = categorical(testGroup12);

testGroup13 = 13 * ones(n_13,1);
YTest13 = categorical(testGroup13);

testGroup14 = 14 * ones(n_14,1);
YTest14 = categorical(testGroup14);

T_label = [YTest1;YTest2;YTest3;YTest4;YTest5;YTest6;YTest7;YTest8;YTest9;YTest10;YTest11;YTest12;YTest13;YTest14];

XTest = Test(2:length(Test),1);

for i = 1 : length(XTest)
    XTest{i} = XTest{i}';
end

%% Prediction
miniBatchSize = 32;
p_label = classify(net,XTest, ...
    'MiniBatchSize',miniBatchSize, ...
    'SequenceLength','longest');
acc = sum(p_label == T_label)./numel(T_label);

%% Confusion Matrix
figure;
cm = confusionchart(T_label,p_label);
cm.ColumnSummary = 'column-normalized';
cm.RowSummary = 'row-normalized';
cm.Title = 'ENV2-14 person Confusion Matrix';