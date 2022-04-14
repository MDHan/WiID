
% load all .mat data, and save them for pre-processing
% csi1 - csin : Each file contains a set of data for all n individuals
clc;clear;close all;

D = dir('F:\14P\trainMat\*.mat'); 
for i = 1 : length(D)
    load(['F:\14P\trainMat\' D(i).name]);
end

csi1 = [Env2_P1__1 Env2_P2__1 Env2_P3__1 Env2_P4__1 Env2_P5__1 Env2_P6__1 Env2_P7__1 Env2_P8__1 Env2_P9__1 Env2_10__1 Env2_11__1 Env2_12__1 Env2_13__1 Env2_14__1]';
csi2 = [Env2_P1__2 Env2_P2__2 Env2_P3__2 Env2_P4__2 Env2_P5__2 Env2_P6__2 Env2_P7__2 Env2_P8__2 Env2_P9__2 Env2_10__2 Env2_11__2 Env2_12__2 Env2_13__2 Env2_14__2]';
csi3 = [Env2_P1__3 Env2_P2__3 Env2_P3__3 Env2_P4__3 Env2_P5__3 Env2_P6__3 Env2_P7__3 Env2_P8__3 Env2_P9__3 Env2_10__3 Env2_11__3 Env2_12__3 Env2_13__3 Env2_14__3]';
csi4 = [Env2_P1__4 Env2_P2__4 Env2_P3__4 Env2_P4__4 Env2_P5__4 Env2_P6__4 Env2_P7__4 Env2_P8__4 Env2_P9__4 Env2_10__4 Env2_11__4 Env2_12__4 Env2_13__4 Env2_14__4]';
csi5 = [Env2_P1__5 Env2_P2__5 Env2_P3__5 Env2_P4__5 Env2_P5__5 Env2_P6__5 Env2_P7__5 Env2_P8__5 Env2_P9__5 Env2_10__5 Env2_11__5 Env2_12__5 Env2_13__5 Env2_14__5]';
csi6 = [Env2_P1__6 Env2_P2__6 Env2_P3__6 Env2_P4__6 Env2_P5__6 Env2_P6__6 Env2_P7__6 Env2_P8__6 Env2_P9__6 Env2_10__6 Env2_11__6 Env2_12__6 Env2_13__6 Env2_14__6]';
csi7 = [Env2_P1__7 Env2_P2__7 Env2_P3__7 Env2_P4__7 Env2_P5__7 Env2_P6__7 Env2_P7__7 Env2_P8__7 Env2_P9__7 Env2_10__7 Env2_11__7 Env2_12__7 Env2_13__7 Env2_14__7]';
csi8 = [Env2_P1__8 Env2_P2__8 Env2_P3__8 Env2_P4__8 Env2_P5__8 Env2_P6__8 Env2_P7__8 Env2_P8__8 Env2_P9__8 Env2_10__8 Env2_11__8 Env2_12__8 Env2_13__8 Env2_14__8]';

save('F:\14P\Env2_train_data_14p.mat');