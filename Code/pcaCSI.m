% raw data pre-processing　for raw training data
% Outlier Removal && PCA

clc;clear;close all;
load xxx.mat; % load .mat data

A_csi = [csi1;csi2;csi3;csi4;csi5;csi6;csi7;csi8];

% Outlier Removal
z=isinf(A_csi);
[inf_r, inf_c]=find(z==1);
A_csi(inf_r,:)=[100];

A_csi = hampel(A_csi,4);

% PCA
[coeff,score,latent,~,explained,mu] = pca(A_csi);
figure;
x=(1:1:270);
bar(x,explained');
grid on;
title('Contribution of each component');
sum_explained = 0;
NumOfPC = 0;
while sum_explained < 99
    NumOfPC = NumOfPC + 1;
    sum_explained = sum_explained + explained(NumOfPC);
end
A_csi = score(:,1:NumOfPC);
Pca_Train = A_csi;
save('F:\14P\Pca_Train.mat','Pca_Train');
save('F:\14P\NumOfPC.mat','NumOfPC');
save('F:\14P\mu.mat','mu');
save('F:\14P\coeff.mat','coeff');


