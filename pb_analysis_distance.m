%判别分析
%--------------------------------------------------------------------------
% 读取disc中数据
%disc数据分类指标三个类别：group-1代表上升，group-2代表稳定，group-3代表下降
%其他指标：企业规模（is）、服务(se)、雇员工资比例(sa)、利润增长(prr)、市场份额(ms)、市场份额增长(msr)、流动资金比例(cp)、资金周转速度(cs)
%--------------------------------------------------------------------------
clc
clear
load disc
%10折交叉验证,距离判别
indices=crossvalind('Kfold',disc(:,1),10);%随机分包
err_rate=[];
pre_result=[];
err_pre=[];
for k=1:10
    test=(indices==k);%第k个包编号
    train=~test;%非test编号
    train_data=disc(train,2:9);
    train_target=disc(train,1);
    test_data=disc(test,2:9);
    test_target=disc(test,1);
    [pre_result(:,k),err_rate(k)] = classify(test_data,train_data,train_target,'mahalanobis');
    err_pre(:,k)=pre_result(:,k)-test_target;
end
err_num=sum(sum(err_pre~=0));
distance_err_pre_rate=err_num/90
distance_A_err_rate=mean(err_rate)