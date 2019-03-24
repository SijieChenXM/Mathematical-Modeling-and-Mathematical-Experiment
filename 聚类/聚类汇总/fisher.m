function y=fisher(x1,x2,sample)
%Fisher����
%x1,x2,sample�ֱ�Ϊ����ѵ���������������ݼ���������Ϊ����������Ϊ������
r1=size(x1,1);r2=size(x2,1);
r3=size(sample,1);
a1=mean(x1)';a2=mean(x2)';
s1=cov(x1)*(r1-1);s2=cov(x2)*(r2-1);
sw=s1+s2;%���Э�������
w=inv(sw)*(a1-a2)*(r1+r2-2);
y1=mean(w'*a1);
y2=mean(w'*a2);
y0=(r1*y1+r2*y2)/(r1+r2);
for i=1:r3
  y(i)=w'*sample(i,:)';
   if y(i)>y0
      y(i)=0;
   else
      y(i)=1;
   end
end
