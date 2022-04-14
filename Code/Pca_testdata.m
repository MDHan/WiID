function [Pca_Test] = Pca_testdata(mu, coeff, NumOfPC, test_data)
    Pca_Test = (test_data-mu)*coeff(:,1:NumOfPC);
end

