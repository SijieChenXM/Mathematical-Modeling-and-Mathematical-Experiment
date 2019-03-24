%1
A=[45.8,43.3,42.3,41.9]
B=[39.1,41.6,43.9,44.9]
C=[3.4,3.3,3.5,3.5]
D=[6.7,6.8,5.4,4.7]
%标准化
A=A./45.8
B=B./39.1
C=C./3.4
D=D./6.7
%求两级极值
E=abs(C-A)
F=abs(D-A)
G=abs(C-B)
H=abs(D-B)
max1=max([E,F]) 
max2=max([G,H]) 
min1=min([E,F])
min2=min([G,H])
%求灰色关联系数和加权关联度
M13=(min1+0.5*max1)./(E+0.5*max1);
R13=mean(M13)
M14=(min1+0.5*max1)./(F+0.5*max1);
R14=mean(M14)
M23=(min2+0.5*max2)./(G+0.5*max2);
R23=mean(M23)
M24=(min2+0.5*max2)./(H+0.5*max2);
R24=mean(M24)

%8
data=table2array(readtable('8.txt'))
for i=1:17
  eval(['X',num2str(i-1),'=','data(i,:)',';'])
end
%均值化
for i=1:17
  eval(['X',num2str(i-1),'=','X',num2str(i-1),'./(sum(','X',num2str(i-1),')/5)'';'])
end
%求两级极值
for i=1:16
  eval(['Y',num2str(i),'=','abs(','X',num2str(i),'-','X',num2str(0),');'])
end
Z=Y1
for i=2:16
  eval(['Z=','[Z,Y',num2str(i),'];'])
end
max=max(Z);
min=min(Z);
%求灰色关联系数和加权关联度
for i=1:16
  eval(['M',num2str(i),'=','(min+0.5*max)./','(X',num2str(i),'+0.5*max)',';'])
end
for i=1:16
  eval(['R',num2str(i),'=','sum','(M',num2str(i),')/5',';'])
end
r=R1
for i=2:16
  eval(['r=','[r,R',num2str(i),'];'])
end
r=r'