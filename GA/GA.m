%主程序：本程序采用遗传算法接力进化，
%将上次进化结束后得到的最终种群作为下次输入的初始种群
clc;
close all;
clear all;
%进化的代数
T=100;
optionsOrigin=gaoptimset('Generations',T/2);
%第一次优化只需得到最终状态，其他结果不需要使用~代替
[~,~,~,~,finnal_pop]=ga(@ch14_2f,2,optionsOrigin);
%进行第二次接力进化
options1=gaoptimset('Generations',T/2,'InitialPopulation',finnal_pop,...
    'PlotFcns',@gaplotbestf);
[x,fval,reason,output,finnal_pop]=ga(@ch14_2f,2,options1);
Bestx=x
BestFval=fval

%ga使用说明

%ga(@fitnessfun,nvars,options) @fitnessfun fitnessfun最小化目标函数 nvars 变量个数
%options 算法属性 由gaoptimset函数设置

% gaoptimset函数 参数 使用方法('参数名',参数值)
%     
%     PopulationType      - The type of Population being entered
%                         [ 'bitstring' | 'custom' | {'doubleVector'} ]
%     PopInitRange        - Initial range of values a population may have
%                         [ Matrix  | {[-10;10]} ]
%     PopulationSize      - Positive scalar indicating the number of individuals
%                         [ positive scalar ] 种群规模
%     EliteCount          - Number of best individuals that survive to next 
%                           generation without any change
%                         [ positive scalar | 0.05*PopulationSize ]
%     CrossoverFraction   - The fraction of genes swapped between individuals
%                         [ positive scalar | {0.8} ] 交配概率
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
%                         [ positive scalar | {0.2} ] 变异概率
%     Generations         - Maximum number of generations allowed
%                         [ positive scalar ] 迭代次数
%     TimeLimit           - Maximum time (in seconds) allowed  
%                         [ positive scalar | {Inf} ] 最长时间
%     FitnessLimit        - Minimum fitness function value desired 
%                         [ scalar | {-Inf} ] 最小值达到什么程度可以停止
%     StallGenLimit       - Number of generations over which cumulative
%                           change in fitness function value is less than TolFun
%                         [ positive scalar ] 超过多少代不进化就停止
%     StallTest           - Measure used to check for stalling
%                         [ 'geometricWeighted' | {'averageChange'} ] 
%     StallTimeLimit      - Maximum time over which change in fitness function
%                           value is less than zero
%                         [ positive scalar | {Inf} ] 超过多长时间不进化就停止
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
%                           during simulation 绘图函数
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


