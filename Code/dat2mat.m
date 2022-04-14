%% Raw data extraction, save the raw data to .mat format

clc; clear; close all;
streamNumber = 9;
packetNumber = 8000;
filePath = 'F:\14P\train\';
savePath = 'F:\14P\trainMat\';
di = [filePath,'\*.dat'];
D = dir(di);
saveMat(D, streamNumber, packetNumber, filePath, savePath);