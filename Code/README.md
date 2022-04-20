# Environment: 
    * Windows 11, Matlab R2021b
    * Require the functions in linux-80211n-csitool-supplementary (https://github.com/dhalperi/linux-80211n-csitool-supplementary/tree/master/matlab)
  
# Scripts:
## 'dat2mat.m': 
    Extract the CSI amplitude from the raw .dat file and save them as the .mat file.
    * Parameters: You can define the number of spatial streams and packets to be extracted.
    * The corresponding file path need to be modified according to the raw data path and saved data path.   
## 'creatTrainRawSet.m': 
    Combine the saved .mat files into the raw data set.
    * File path and names needs to be customized.
## 'pcaCSI.m': 
    Apply PCA to the raw data set.
    * File path and names needs to be customized.
    * Outliers need to be removed prior to PCA.     
## 'trianLSTM.m': 
    Dataset construction and LSTM network training.
## 'saveStaticDataOfTestData.m': 
    Perform MSV operations on all test data and extract the stationary state data and save them as .mat file.
    * The 'test' folder contains the following folders：P1,P2,...,P9,10,11,...
    * The threshold value in Equation (4) can be adjusted according to the your data.    
## 'testDataPer.m': 
    Process the saved test .mat data and combine all data belonging to a person into one file.
    * File path and names needs to be customized.
    * The numbers in the idList represent the labels of different people, which need to be defined according to the order of your folders.    
## 'prediction.m': 
    Construct the test set and use the trained network to make predictions and output the accuracy and confusion matrix.    
    
# Functions: 
## 'getAllStreamMat.m':
    * Extracting CSI magnitude from the raw data
    * Input Arguments: 
        csi_trace: raw CSI data 
        packetNumber: Packets number
        streamNumber： Spatial stream number
    * Output Arguments:  
        csi_ALL: CSI magnitude        
## 'saveMat.m':
    * Save .dat files as .mat files
    * Input Arguments: 
        streamNumber: spatial stram number
        path1：.dat file path
        path2：.mat file path      
## 'RemoveInf.m':
    * Removing infinite values of input data.
## 'PreProcess.m':
    * Raw data pre-processing (low-pass filtering and outlier removal)
    * Input Arguments:
        csi: Raw CSI data
        fk: Sampling rate
        packetNumber: Packets number
    * Output Arguments:
        csi_filter: CSI data after preprocessing        
## 'Pca_testdata.m':
    * Perform PCA on test data.
    * Input Arguments: 
        mu: Estimated means of training data
        coeff: Principal component coefficients of training data
        NumOfPC: Number of principal components of training data
        test_data: Test data for applying PCA
    * Output Arguments:
        Pca_Test: Test data after PCA processing
## 'SlidingWindowVar.m'
    * Get the Motion Sensitivity Vector (MSV) of input data
    * Input Arguments:
        csi_filter: CSI data after preprocessing
        packetNumber: Packets number
        winSize: Size of the sliding window
        threshold: Threshold in Equation (4)
    * Output Argumrnts: 
        MSV: Motion Sensitivity Vector of the input data        
## 'GetStaticData.m':
    * Get data containing only stationary states.
    * Input Arguments:
        x: Motion Sensitivity Vector (MSV)
        winSize: Window size
        csi_trace: Raw test data
    * Output Argumrnts:    
        StaticData: The stationary data we obtained
        Start_Point: Start packet index for stationary state
        Stop_Point: End packet index for stationary state
        n: The packets number of the Static Data    
## 'Segmention.m':
    * Adaptive threshold segmentation algorithm.
    * Input Arguments:
        x: Motion Sensitivity Vector (MSV)
        winsize: Window size
    * Output Argumrnts:
        Start_Point: Start packet index for stationary state
        Stop_Point: End packet index for stationary state
    
