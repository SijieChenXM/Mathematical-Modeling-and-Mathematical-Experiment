%求传递闭包代码
R=[1 0.1 0.2;0.1 1 0.3;0.2 0.3 1]
a=size(R);
B=zeros(a);
flag=0;
while flag==0
for i= 1: a
for j= 1: a
for k=1:a
B( i , j ) = max(min( R( i , k) , R( k, j) ) , B( i , j ) ) ;%R与R内积，先取小再取大
end
end
end
if B==R
flag=1;
else
R=B;%循环计算R传递闭包
end
end

%10
A=[1.8,95,0.15;2.1,99,0.21;3.2,101,0.18;2.2,103,0.17;2.5,98,0.16;2.8,102,0.2;1.9,120,0.09;2.0,130,0.11]
a=size(A);
A1=zeros(a);
for i=1:a(1)
for j=1:a(2)
    A1(i,j)=A(i,j)/max(A(:,j))
end
end

B=zeros(a)
for i=1:a(1)
    for j=1:a(1)
      B(i,j)=exp(-sum(abs(A1(i,:)-A1(j,:))))
    end
end

b=size(B);
C=zeros(b);
flag=0;
while flag==0
for i= 1: b
for j= 1: b
for k=1:b
C( i , j ) = max(min( B( i , k) , B( k, j) ) , C( i , j ) ) ;%R与R内积，先取小再取大
end
end
end
if C==B
flag=1;
else
B=C;%循环计算R传递闭包
end
end

D=sort(C(:))

C1=zeros(b);
for i=1:8
    for j=1:8
   if C(i,j)>=0.6008
       C1(i,j)=1;
   else
       C1(i,j)=0;
   end
    end
end

[M,N]=mhjlt(C)


%16
data=readtable('16.txt')
data1=table2array(data)'
a=size(data1);
A1=zeros(a);
for i=1:a(1)
for j=1:a(2)
    A1(i,j)=data1(i,j)/max(data1(:,j))
end
end

B=zeros(a)
for i=1:a(1)
    for j=1:a(1)
      B(i,j)=exp(-sum(abs(A1(i,:)-A1(j,:))))
    end
end

b=size(B);
C=zeros(b);
flag=0;
while flag==0
for i= 1: b
for j= 1: b
for k=1:b
C( i , j ) = max(min( B( i , k) , B( k, j) ) , C( i , j ) ) ;%R与R内积，先取小再取大
end
end
end
if C==B
flag=1;
else
B=C;%循环计算R传递闭包
end
end

[M,N]=mhjlt(C)