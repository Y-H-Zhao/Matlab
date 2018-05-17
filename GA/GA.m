%�����򣺱���������Ŵ��㷨����������
%���ϴν���������õ���������Ⱥ��Ϊ�´�����ĳ�ʼ��Ⱥ
clc;
close all;
clear all;
%�����Ĵ���
T=100;
optionsOrigin=gaoptimset('Generations',T/2);
%��һ���Ż�ֻ��õ�����״̬�������������Ҫʹ��~����
[~,~,~,~,finnal_pop]=ga(@ch14_2f,2,optionsOrigin);
%���еڶ��ν�������
options1=gaoptimset('Generations',T/2,'InitialPopulation',finnal_pop,...
    'PlotFcns',@gaplotbestf);
[x,fval,reason,output,finnal_pop]=ga(@ch14_2f,2,options1);
Bestx=x
BestFval=fval

%gaʹ��˵��

%ga(@fitnessfun,nvars,options) @fitnessfun fitnessfun��С��Ŀ�꺯�� nvars ��������
%options �㷨���� ��gaoptimset��������

% gaoptimset���� ���� ʹ�÷���('������',����ֵ)
%     
%     PopulationType      - The type of Population being entered
%                         [ 'bitstring' | 'custom' | {'doubleVector'} ]
%     PopInitRange        - Initial range of values a population may have
%                         [ Matrix  | {[-10;10]} ]
%     PopulationSize      - Positive scalar indicating the number of individuals
%                         [ positive scalar ] ��Ⱥ��ģ
%     EliteCount          - Number of best individuals that survive to next 
%                           generation without any change
%                         [ positive scalar | 0.05*PopulationSize ]
%     CrossoverFraction   - The fraction of genes swapped between individuals
%                         [ positive scalar | {0.8} ] �������
%     ParetoFraction      - The fraction of population on non-dominated front
%                         [ positive scalar | {0.35} ]
%     MigrationDirection  - Direction that fittest individuals from the various
%                           sub-populations may migrate to other sub-populations
%                         ['both' | {'forward'}]  
%     MigrationInterval   - The number of generations between the migration of
%                           the fittest individuals to other sub-populations
%                         [ positive scalar | {20} ]
%     MigrationFraction   - Fraction of those individuals scoring the best
%                           that will migrate
%                         [ positive scalar | {0.2} ] �������
%     Generations         - Maximum number of generations allowed
%                         [ positive scalar ] ��������
%     TimeLimit           - Maximum time (in seconds) allowed  
%                         [ positive scalar | {Inf} ] �ʱ��
%     FitnessLimit        - Minimum fitness function value desired 
%                         [ scalar | {-Inf} ] ��Сֵ�ﵽʲô�̶ȿ���ֹͣ
%     StallGenLimit       - Number of generations over which cumulative
%                           change in fitness function value is less than TolFun
%                         [ positive scalar ] �������ٴ���������ֹͣ
%     StallTest           - Measure used to check for stalling
%                         [ 'geometricWeighted' | {'averageChange'} ] 
%     StallTimeLimit      - Maximum time over which change in fitness function
%                           value is less than zero
%                         [ positive scalar | {Inf} ] �����೤ʱ�䲻������ֹͣ
%     TolFun              - Termination tolerance on fitness function value
%                         [ positive scalar ] 
%     TolCon              - Termination tolerance on constraints
%                         [ positive scalar | {1e-6} ]
%     InitialPopulation   - The initial population used in seeding the GA
%                           algorithm; can be partial
%                         [ Matrix | {[]} ]
%     InitialScores       - The initial scores used to determine fitness; used
%                           in seeding the GA algorithm; can be partial
%                         [ column vector | {[]} ]
%     NonlinConAlgorithm  - The algorithm used to handle nonlinear constraints
%                           within the GA algorithm
%                            [ 'penalty' | {'auglag'} ]
%     InitialPenalty      - Initial value of penalty parameter
%                            [ positive scalar | {10} ]
%     PenaltyFactor       - Penalty update parameter
%                            [ positive scalar | {100} ]
%     CreationFcn         - Function used to generate initial population
%                         [ @gacreationlinearfeasible | @gacreationuniform ]
%     FitnessScalingFcn   - Function used to scale fitness scores.
%                         [ @fitscalingshiftlinear | @fitscalingprop | @fitscalingtop |
%                           {@fitscalingrank} ]
%     SelectionFcn        - Function used in selecting parents for next generation
%                         [ @selectionremainder | @selectionuniform | 
%                           @selectionroulette  |  @selectiontournament | 
%                           @selectionstochunif ]
%     CrossoverFcn        - Function used to do crossover
%                         [ @crossoverheuristic | @crossoverintermediate | 
%                           @crossoversinglepoint | @crossovertwopoint | 
%                           @crossoverarithmetic | @crossoverscattered ]
%     MutationFcn         - Function used in mutating genes
%                         [ @mutationuniform | @mutationadaptfeasible |
%                           @mutationgaussian ]
%     DistanceMeasureFcn  - Function used to measure average distance of
%                           individuals from their neighbors
%                         [ {@distancecrowding} ]
%     HybridFcn           - Another optimization function to be used once GA 
%                           has normally terminated (for whatever reason)
%                         [ @fminsearch | @patternsearch | @fminunc | @fmincon | {[]} ]
%     Display              - Level of display 
%                         [ 'off' | 'iter' | 'diagnose' | {'final'} ]
%     OutputFcns          - Function(s) called in every generation. This is more   
%                           general than PlotFcns.
%  
%     PlotFcns            - Function(s) used in plotting various quantities 
%                           during simulation ��ͼ����
%                         [ @gaplotbestf | @gaplotbestindiv | @gaplotdistance | 
%                           @gaplotexpectation | @gaplotgenealogy | @gaplotselection |
%                           @gaplotrange | @gaplotscorediversity  | @gaplotscores | 
%                           @gaplotstopping | @gaplotmaxconstr | @gaplotrankhist |
%                           @gaplotpareto | @gaplotspread | @gaplotparetodistance | 
%                           {[]} ]
%     PlotInterval        - The number of generations between plotting results
%                         [ positive scalar | {1} ]
%     Vectorized           - Objective function is vectorized and it can evaluate
%                           more than one point in one call 
%                         [ 'on' | {'off'} ]
%     UseParallel         - Use PARFOR to evaluate objective and nonlinear 
%                           constraint functions.
%                         [ logical scalar | true | {false} ]


