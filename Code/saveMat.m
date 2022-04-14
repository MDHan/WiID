function [] = saveMat(D, streamNumber, packetNumber,path1, path2)
    % streamNumber: spatial stram number
    % path1：.dat file path
    % path2：.mat file path
    for i = 1:length(D)
        nam = D(i,1).name;
        filePath1 = [path1,nam];
        csi_trace = read_bf_file(filePath1);
        csi = getAllStreamMat(csi_trace, packetNumber, streamNumber);
        t1 = nam(1:8);
        t2 = nam(end-5:end-4);
        saveName = [t1,t2]
        eval([saveName '=csi']);
        savePath = [path2,'\',saveName,'.mat'];
        save(savePath,saveName);
    end
end
