clear;clc;
X=[63029 5186.03 25.7 73.2 72.5 84.9 0.364
    55473 2383.56 60.1 37.9 44 77.23 0.344
    23239 853.68 54.2 33.2 26.5 41.9 0.223
    20398 770.16 61.5 34.2 33 45.11 0.2583
    32214 1184.36 55 33.3 32.7 51.71 0.2713
    31259 1192.02 55.8 34.5 41.2 60.05 0.255
    23514 986.40 47.7 38 35.4 53.21 0.2545
    21727 823.053 52.5 34.4 33 55.4 0.336
    73124 4361.24 45.5 53.7 55.2 88.6 0.374
    39622 1669.67 55 38.1 34.7 54.3 0.199
    42214 1919.64 53.9 41 35.3 57.6 0.261
    14485 597.99 46.6 37.4 28.3 40.5 0.248
    30123 1308.21 50 39.3 33.3 49.9 0.336
    14781 506.04 52.7 30.9 31.9 41.6 0.254
    33083 1220.10 57 33.4 31 47.6 0.254
    19593 620.81 56.9 28.6 24.4 36.03 0.201
    19860 887.24 43.8 40.5 40.1 45.2 0.343
    17521 731.36 44.2 37.8 30.4 42.15 0.317
    37589 1787.76 51.6 42.9 38.2 63.37 0.295
    14966 619.61 42.4 37.4 24.8 38.16 0.324
    17175 766.11 29.8 40.2 34.9 48 0.484
    18025 817.38 47.7 41 36.3 49.99 0.321
    15378 590.05 46.3 34.8 33.1 37.4 0.307
    8824 403.46 42.3 41.3 36.3 29.11 0.315
    12587 544.14 43 39.1 25.1 33 0.348
    13861 852.64 29.2 55.5 33.9 22.61 0.541
    18246 663.41 56.1 32.9 32.5 42.1 0.407
    12110 523.051 46.3 39.1 32.8 32.15 0.299
    17389 652.19 55.1 34 34.2 40.86 0.330
    17892 718.00 52.9 36.2 30.1 44.98 0.233
    19893 750.14 49.6 33.9 34.7 39.64 0.273];
[lambda,psi,T,stats,F] = factoran(X,2);
Contribut = 100*sum(lambda.^2)/7;%计算贡献率
CumCont = cumsum(Contribut); %计算累积贡献率
disp('载荷lambda，贡献率contribut和cumcont');
lambda,Contribut,CumCont %得到选取2个因子载荷合理
obsnum=[1:31]';
obsF=[obsnum,F];
disp('按因子Z1排序【第一列为城市序号】');
F1=sortrows(obsF,-2)
disp('按因子Z2排序【第一列为城市序号】');
F2=sortrows(obsF,-3)

% obsF =
%     number   factor1   factor2
%     1.0000    3.0048    3.0163
%     2.0000    1.6345   -1.4503
%     3.0000   -0.1731   -0.7215
%     4.0000   -0.2314   -0.6999
%     5.0000    0.2748   -1.0122
%     6.0000    0.3005   -0.9146
%     7.0000   -0.1459   -0.0770
%     8.0000   -0.2023   -0.5165
%     9.0000    3.0644    0.0471
%    10.0000    0.6990   -0.7743
%    11.0000    0.8733   -0.5028
%    12.0000   -0.6522    0.2160
%    13.0000    0.1662   -0.1280
%    14.0000   -0.5438   -0.6348
%    15.0000    0.3100   -1.0649
%    16.0000   -0.3310   -1.1524
%    17.0000   -0.4028    0.5400
%    18.0000   -0.5275    0.2717
%    19.0000    0.6708   -0.1187
%    20.0000   -0.6863    0.3601
%    21.0000   -0.6504    0.9925
%    22.0000   -0.4445    0.4721
%    23.0000   -0.6165    0.0052
%    24.0000   -1.0510    1.0840
%    25.0000   -0.8375    0.6526
%    26.0000   -1.0580    2.9729
%    27.0000   -0.4020   -0.5226
%    28.0000   -0.8243    0.5953
%    29.0000   -0.4436   -0.3811
%    30.0000   -0.4116   -0.2147
%    31.0000   -0.3625   -0.3396