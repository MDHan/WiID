function [test_data] = RemoveInf(x)
    z = isinf(x);
    [inf_r, inf_c] = find(z==1);
    x(inf_r,:) = [100];
    test_data = hampel(x,4);%包数 X 维度数
end

