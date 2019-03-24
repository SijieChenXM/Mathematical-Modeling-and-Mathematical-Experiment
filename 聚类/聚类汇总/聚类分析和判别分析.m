%no2_2
clc;clear;
x=[1;2;3;6;9;11];
D = pdist(x,'cityblock');
squareform(D)
%%最短距离法
Z1 = linkage(D,'single');
[H,T] = dendrogram(Z1,'colorthreshold','default');
set(H,'LineWidth',2)
grid on;title('最短距离法聚类图')


%4
A=[4 7 12 18 19 21 3 8 14 15 17 5 11 12 14 6 7 9 1 3 2]
Z1=linkage(A,'single')
dendrogram(Z1)

Z2=linkage(A,'complete')
dendrogram(Z2)

Z3=linkage(A,'centroid')
dendrogram(Z3)

B=[1 2 3;8 9 6;2 2 2;1 3 4]
Y=pdist(B,'euclidean')
C=squareform(Y)

%10
X=[9 8 7;7 6 6;10 7 8;8 4 5;9 9 7;8 6 7;7 5 6;4 4 4;3 6 6;6 3 3;2 4 5;1 2 2];
x1=X(1:7,:);
x2=X(8:12,:);
sample=[5 5 5];
y=fisher(x1,x2,sample)

%14
X=[-1.9 3.2;-6.9 10.4;5.2 2.0;5.0 2.5;7.3 0;6.8,12.7;0.9 -15.4;-12.5 -2.5;1.5 1.3;3.8 6.8
    0.2 0.2;-0.1 7.5;0.4 14.6;2.7 8.3;2.1 0.8;-4.6 4.3;-1.7 10.9;-2.6 13.1;2.6 12.8;-2.8 10]
x1=X(1:10,:);
x2=X(10:20,:);
sample=[8.2 2;10 10];
y=fisher(x1,x2,sample)