%1.1
data=readtable('1.1.txt')
data1=table2array(data)
data2=zscore(data1)
R=corrcoef(data2)
[X,B]=eig(R,'nobalance')
C=sort(eig(R)','descend')
D=[X(:,8),X(:,7),X(:,6)]
sum(C)
Z1=data2*X(:,8)
Z2=data2*X(:,7)
Z3=data2*X(:,6)
Y=0.3881*Z1+0.3662*Z2+0.1163*Z3
T=[data table(Y)]

%2.3
data=readtable('2.3.txt')
data1=table2array(data)
data2=zscore(data1)
R=corrcoef(data2)
[X,B]=eig(R)
D=[X(:,4),X(:,3)]
Z1=data2*X(:,4)
Z2=data2*X(:,3)
Y=0.8125*Z1+0.1171*Z2
T=[data table(Y)]