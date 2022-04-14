function [csi_ALL] = getAllStreamMat(csi_trace, packetNumber, streamNumber)
    switch streamNumber
        case 1
            csi_Tx1_Rx1 = readRawData(csi_trace,packetNumber,1,1);
            csi_ALL = csi_Tx1_Rx1;
        case 2
            csi_Tx1_Rx1 = readRawData(csi_trace,packetNumber,1,1);
            csi_Tx1_Rx2 = readRawData(csi_trace,packetNumber,1,2);
            csi_ALL = [csi_Tx1_Rx1;csi_Tx1_Rx2];
        case 3
            csi_Tx1_Rx1 = readRawData(csi_trace,packetNumber,1,1);
            csi_Tx1_Rx2 = readRawData(csi_trace,packetNumber,1,2);
            csi_Tx1_Rx3 = readRawData(csi_trace,packetNumber,1,3);
            csi_ALL = [csi_Tx1_Rx1;csi_Tx1_Rx2;csi_Tx1_Rx3];
        case 4
            csi_Tx1_Rx1 = readRawData(csi_trace,packetNumber,1,1);
            csi_Tx1_Rx2 = readRawData(csi_trace,packetNumber,1,2);
            csi_Tx1_Rx3 = readRawData(csi_trace,packetNumber,1,3);

            csi_Tx2_Rx1 = readRawData(csi_trace,packetNumber,2,1);
            csi_ALL = [csi_Tx1_Rx1;csi_Tx1_Rx2;csi_Tx1_Rx3;  csi_Tx2_Rx1];
        case 5
            csi_Tx1_Rx1 = readRawData(csi_trace,packetNumber,1,1);
            csi_Tx1_Rx2 = readRawData(csi_trace,packetNumber,1,2);
            csi_Tx1_Rx3 = readRawData(csi_trace,packetNumber,1,3);

            csi_Tx2_Rx1 = readRawData(csi_trace,packetNumber,2,1);
            csi_Tx2_Rx2 = readRawData(csi_trace,packetNumber,2,2);
            csi_ALL = [csi_Tx1_Rx1;csi_Tx1_Rx2;csi_Tx1_Rx3;  csi_Tx2_Rx1;csi_Tx2_Rx2];
        case 6
            csi_Tx1_Rx1 = readRawData(csi_trace,packetNumber,1,1);
            csi_Tx1_Rx2 = readRawData(csi_trace,packetNumber,1,2);
            csi_Tx1_Rx3 = readRawData(csi_trace,packetNumber,1,3);

            csi_Tx2_Rx1 = readRawData(csi_trace,packetNumber,2,1);
            csi_Tx2_Rx2 = readRawData(csi_trace,packetNumber,2,2);
            csi_Tx2_Rx3 = readRawData(csi_trace,packetNumber,2,3);
            csi_ALL = [csi_Tx1_Rx1;csi_Tx1_Rx2;csi_Tx1_Rx3;  csi_Tx2_Rx1;csi_Tx2_Rx2;csi_Tx2_Rx3];
        case 7
            csi_Tx1_Rx1 = readRawData(csi_trace,packetNumber,1,1);
            csi_Tx1_Rx2 = readRawData(csi_trace,packetNumber,1,2);
            csi_Tx1_Rx3 = readRawData(csi_trace,packetNumber,1,3);

            csi_Tx2_Rx1 = readRawData(csi_trace,packetNumber,2,1);
            csi_Tx2_Rx2 = readRawData(csi_trace,packetNumber,2,2);
            csi_Tx2_Rx3 = readRawData(csi_trace,packetNumber,2,3);

            csi_Tx3_Rx1 = readRawData(csi_trace,packetNumber,3,1);
            csi_ALL = [csi_Tx1_Rx1;csi_Tx1_Rx2;csi_Tx1_Rx3;  csi_Tx2_Rx1;csi_Tx2_Rx2;csi_Tx2_Rx3;  csi_Tx3_Rx1];
        case 8
            csi_Tx1_Rx1 = readRawData(csi_trace,packetNumber,1,1);
            csi_Tx1_Rx2 = readRawData(csi_trace,packetNumber,1,2);
            csi_Tx1_Rx3 = readRawData(csi_trace,packetNumber,1,3);

            csi_Tx2_Rx1 = readRawData(csi_trace,packetNumber,2,1);
            csi_Tx2_Rx2 = readRawData(csi_trace,packetNumber,2,2);
            csi_Tx2_Rx3 = readRawData(csi_trace,packetNumber,2,3);

            csi_Tx3_Rx1 = readRawData(csi_trace,packetNumber,3,1);
            csi_Tx3_Rx2 = readRawData(csi_trace,packetNumber,3,2);
            csi_ALL = [csi_Tx1_Rx1;csi_Tx1_Rx2;csi_Tx1_Rx3;  csi_Tx2_Rx1;csi_Tx2_Rx2;csi_Tx2_Rx3;  csi_Tx3_Rx1;csi_Tx3_Rx2];
        otherwise
            csi_Tx1_Rx1 = readRawData(csi_trace,packetNumber,1,1);
            csi_Tx1_Rx2 = readRawData(csi_trace,packetNumber,1,2);
            csi_Tx1_Rx3 = readRawData(csi_trace,packetNumber,1,3);

            csi_Tx2_Rx1 = readRawData(csi_trace,packetNumber,2,1);
            csi_Tx2_Rx2 = readRawData(csi_trace,packetNumber,2,2);
            csi_Tx2_Rx3 = readRawData(csi_trace,packetNumber,2,3);

            csi_Tx3_Rx1 = readRawData(csi_trace,packetNumber,3,1);
            csi_Tx3_Rx2 = readRawData(csi_trace,packetNumber,3,2);
            csi_Tx3_Rx3 = readRawData(csi_trace,packetNumber,3,3);
            csi_ALL = [csi_Tx1_Rx1;csi_Tx1_Rx2;csi_Tx1_Rx3;  csi_Tx2_Rx1;csi_Tx2_Rx2;csi_Tx2_Rx3;  csi_Tx3_Rx1;csi_Tx3_Rx2;csi_Tx3_Rx3];
    end
end