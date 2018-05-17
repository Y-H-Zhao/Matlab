%�б����
%--------------------------------------------------------------------------
% ��ȡdisc������
%disc���ݷ���ָ���������group-1����������group-2�����ȶ���group-3�����½�
%����ָ�꣺��ҵ��ģ��is��������(se)����Ա���ʱ���(sa)����������(prr)���г��ݶ�(ms)���г��ݶ�����(msr)�������ʽ����(cp)���ʽ���ת�ٶ�(cs)
%--------------------------------------------------------------------------
clc
clear
load disc
%10�۽�����֤,�����б�
indices=crossvalind('Kfold',disc(:,1),10);%����ְ�
err_rate=[];
pre_result=[];
err_pre=[];
for k=1:10
    test=(indices==k);%��k�������
    train=~test;%��test���
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