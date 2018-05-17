%�б����
%--------------------------------------------------------------------------
% ��ȡdisc������
%disc���ݷ���ָ���������group-1����������group-2�����ȶ���group-3�����½�
%����ָ�꣺��ҵ��ģ��is��������(se)����Ա���ʱ���(sa)����������(prr)���г��ݶ�(ms)���г��ݶ�����(msr)�������ʽ����(cp)���ʽ���ת�ٶ�(cs)
%--------------------------------------------------------------------------
clc
clear
load disc
%10�۽�����֤,bayes
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
    ObjBayes = NaiveBayes.fit(train_data, train_target);
    pre_result(:,k)= ObjBayes.predict(test_data);
    err_pre(:,k)=pre_result(:,k)-test_target;
end
err_num=sum(sum(err_pre~=0));
beyes_err_pre_rate=err_num/90
posterior_probability=ObjBayes.posterior(test_data)
[CLMat,order] =confusionmat(test_target, pre_result(:,10));
pass1=[num2cell(order), num2cell(CLMat)];
pass2=[{'From/To'},1,2,3];
disp('byes�б��������')
[pass2;pass1]