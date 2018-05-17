%判别分析
%--------------------------------------------------------------------------
% 读取disc中数据
%disc数据分类指标三个类别：group-1代表上升，group-2代表稳定，group-3代表下降
%其他指标：企业规模（is）、服务(se)、雇员工资比例(sa)、利润增长(prr)、市场份额(ms)、市场份额增长(msr)、流动资金比例(cp)、资金周转速度(cs)
%--------------------------------------------------------------------------
clc
clear
load disc
disc=[disc(:,1),zscore(disc(:,2:9))];
%10折交叉验证,fisher
indices=crossvalind('Kfold',disc(:,1),10);%随机分包
pre_result=[];
err_pre=[];
for k=1:10
    test=(indices==k);%第k个包编号
    train=~test;%非test编号
    train_data=disc(train,2:9);
    train_target=disc(train,1);
    test_data=disc(test,2:9);
    test_target=disc(test,1);
    [outclass,TabCan,TabL,TabCon,TabM,TabG,ts] = fisher(test_data,train_data,train_target);
    pre_result(:,k)= outclass;
    err_pre(:,k)=pre_result(:,k)-test_target;
end
err_num=sum(sum(err_pre~=0));
fisher_err_pre_rate=err_num/90
[CLMat,order] =confusionmat(test_target, pre_result(:,10));
pass1=[num2cell(order), num2cell(CLMat)];
pass2=[{'From/To'},1,2,3];
disp('fisher判别混淆矩阵')
[pass2;pass1]

TabL  %特征值，贡献率。累积贡献率
TabCon  %训练集混淆矩阵
TabM  %错判目标

% 提取各类的判别式得分
score1 = ts(ts(:,1) == 1,:);
score2 = ts(ts(:,1) == 2,:);
score3 = ts(ts(:,1) == 3,:);
plot(score1(:,2),score1(:,3),'ko')
hold on
plot(score2(:,2),score2(:,3),'k*')
plot(score3(:,2),score3(:,3),'kp')
legend('1类','2类','3类');
xlabel('第一判别式得分');
ylabel('第二判别式得分');
