clear all;
clc;
format long;
%------给定初始化条件----------------------------------------------
c1=2;             %学习因子1
c2=2;             %学习因子2
w=0.7;            %惯性权重
MaxDT=1000;       %最大迭代次数
D=8;             %搜索空间维数（未知数个数）
M=40;             %初始化群体个体数目
eps=10^(-6);      %设置精度(在已知最小值时候用)
a=[0 0.5e-5 9e-9 1e-8 1e6 4e5 3e-12 4e-8];
b=[1 1.5e-5 1e-8 2e-8 2e6 5.5e5 4e-12 5e-8];

%------初始化种群的个体(可以在这里限定位置和速度的范围)------------
for i=1:M
    for j=1:D
        x(i,j)=rand*(b(j)-a(j))+a(j); %随机初始化位置
        v(i,j)=randn; %随机初始化速度
    end
end

%------先计算各个粒子的适应度，并初始化p(i)和gbest--------------------
for i=1:M
    p(i)=SSE(x(i,:));
    y(i,:)=x(i,:);
end
[p1,Q]=sort(p);
gbest=x(Q(1),:);             %gbest为全局最优

%for i=2:M
    %if fitness(x(i,M),D) < fitness(gbest,D)
        %gbest=x(i,:);
    %end
%end
%------进入主要循环，按照公式依次迭代，直到满足精度要求------------
for t=1:MaxDT
    for i=1:M
        v(i,:)=w*v(i,:)+c1*rand*(y(i,:)-x(i,:))+c2*rand*(gbest-x(i,:));
        x(i,:)=x(i,:)+v(i,:);
        if SSE(x(i,:))<p(i)
            p(i)=SSE(x(i,:));
            y(i,:)=x(i,:);
        end
        if p(i)<SSE(gbest)
            gbest=y(i,:);
        end
    end
    if SSE(gbest)<100
        break;
    end
end

%------显示计算结果
disp('*************************************************************')
disp('函数的全局最优位置为：')
Solution=gbest'
disp('最后得到的优化极值为：')
Result=SSE(gbest)
disp('*************************************************************')