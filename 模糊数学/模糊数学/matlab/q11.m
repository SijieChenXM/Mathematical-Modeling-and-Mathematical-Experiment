clear;clc;
X=[0.5 5 10
    0.7 8 22
    0.6 4 12
    0.5 5 10
    1.2 9 25
    0.8 12 28];
%标准差标准化
for i=1:6
    X(i,:)=zscore(X(i,:));
end
%绝对值指数法建立模糊相似矩阵
R=zeros(6,6);
for i=1:6
    for j=1:6
        tmp=0;
        for k=1:3
            tmp=tmp+abs(X(i,k)-X(j,k));
        end
        R(i,j)=exp(-tmp);
    end
end
%求传递闭包tR
tmpR=R;
tR=rsquare(tmpR);
while ~isequal(tmpR, tR)
    tmpR=tR;
    tR=rsquare(tmpR);
end
tmp=callambda(tR,1);
callambda(tR,1)
for i=1:-0.1:0.7
    cl=callambda(tR,i);
    if ~isequal(cl,tmp)
        callambda(tR,i)
    end
    tmp=cl;
end
%-----------------------------
function [B]=rsquare(R)
a=size(R);
B=zeros(a);
for i=1:a
    for j=1:a
        for k=1:a
            B(i,j)=max(min(R(i,k),R(k,j)),B(i,j));
        end
    end
end
end
%-------------------------------
function [lamda]=callambda(R,l)
[a,b]=size(R);
lamda=zeros(a,b);
for i=1:a
    for j=1:b
        if R(i,j)>=l
            lamda(i,j)=1;
        end
    end
end
end

% ans =
% 
%      1     0     0     1     0     0
%      0     1     0     0     0     0
%      0     0     1     0     0     0
%      1     0     0     1     0     0
%      0     0     0     0     1     0
%      0     0     0     0     0     1
% 
% 
% ans =
% 
%      1     0     0     1     0     0
%      0     1     1     0     1     0
%      0     1     1     0     1     0
%      1     0     0     1     0     0
%      0     1     1     0     1     0
%      0     0     0     0     0     1
% 
% 
% ans =
% 
%      1     1     1     1     1     1
%      1     1     1     1     1     1
%      1     1     1     1     1     1
%      1     1     1     1     1     1
%      1     1     1     1     1     1
%      1     1     1     1     1     1