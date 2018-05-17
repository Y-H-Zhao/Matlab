%判别分析
%--------------------------------------------------------------------------
% 读取disc中数据
%disc数据分类指标三个类别：group-1代表上升，group-2代表稳定，group-3代表下降
%其他指标：企业规模（is）、服务(se)、雇员工资比例(sa)、利润增长(prr)、市场份额(ms)、市场份额增长(msr)、流动资金比例(cp)、资金周转速度(cs)
%--------------------------------------------------------------------------
%首先进行判别分析是否有价值的F检验
load disc
sample1=disc(disc(:,1)==1,:);
sample2=disc(disc(:,1)==2,:);
sample3=disc(disc(:,1)==3,:);
x_num=8;
l1=length(sample1(:,1));
l2=length(sample2(:,1));
l3=length(sample3(:,1));
mean1=mean(sample1(:,2:9))';
mean2=mean(sample2(:,2:9))';
mean3=mean(sample3(:,2:9))';
A1=cov(sample1(:,2:9))*(l1-1);
A2=cov(sample2(:,2:9))*(l2-1);
A3=cov(sample3(:,2:9))*(l3-1);
S12=(A1+A2)/(l1+l2-2);%合并的样本协方差阵，并不等于cov(x)
S13=(A1+A3)/(l1+l3-2);
S23=(A2+A3)/(l2+l3-2);
d12=(mean1-mean2)'*inv(S12)*(mean1-mean2);%一种距离，类似于马氏距离
d13=(mean1-mean3)'*inv(S13)*(mean1-mean3);
d23=(mean2-mean3)'*inv(S23)*(mean2-mean3);
f12=(l1+l2-x_num-1)*l1*l2*d12/(x_num*(l1+l2)*(l1+l2-2));%F分布的值
f13=(l1+l3-x_num-1)*l1*l3*d13/(x_num*(l1+l3)*(l1+l3-2));
f23=(l2+l3-x_num-1)*l2*l3*d23/(x_num*(l2+l3)*(l2+l3-2));
p12=1-fcdf(f12,x_num,l1+l2-x_num-1);%根据分为点，算P值
p13=1-fcdf(f13,x_num,l1+l3-x_num-1);
p23=1-fcdf(f23,x_num,l2+l3-x_num-1);

if p12<0.05 & p13<0.05 & p23<0.05
    disp('F检验的p值分别为：')
    p=[p12 p13 p23]
    disp('拒绝原假设,有显著差异，判别分析有意义')
else
    disp('接受原假设，无差异,判别分析没有意义')
end
