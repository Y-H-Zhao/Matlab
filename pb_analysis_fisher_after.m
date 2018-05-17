%�б����
%--------------------------------------------------------------------------
% ��ȡdisc������
%disc���ݷ���ָ���������group-1����������group-2�����ȶ���group-3�����½�
%����ָ�꣺��ҵ��ģ��is��������(se)����Ա���ʱ���(sa)����������(prr)���г��ݶ�(ms)���г��ݶ�����(msr)�������ʽ����(cp)���ʽ���ת�ٶ�(cs)
%--------------------------------------------------------------------------
clc
clear
load disc
disc=[disc(:,1),zscore(disc(:,2:9))];
%10�۽�����֤,fisher
indices=crossvalind('Kfold',disc(:,1),10);%����ְ�
pre_result=[];
err_pre=[];
for k=1:10
    test=(indices==k);%��k�������
    train=~test;%��test���
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
disp('fisher�б��������')
[pass2;pass1]

TabL  %����ֵ�������ʡ��ۻ�������
TabCon  %ѵ������������
TabM  %����Ŀ��

% ��ȡ������б�ʽ�÷�
score1 = ts(ts(:,1) == 1,:);
score2 = ts(ts(:,1) == 2,:);
score3 = ts(ts(:,1) == 3,:);
plot(score1(:,2),score1(:,3),'ko')
hold on
plot(score2(:,2),score2(:,3),'k*')
plot(score3(:,2),score3(:,3),'kp')
legend('1��','2��','3��');
xlabel('��һ�б�ʽ�÷�');
ylabel('�ڶ��б�ʽ�÷�');
