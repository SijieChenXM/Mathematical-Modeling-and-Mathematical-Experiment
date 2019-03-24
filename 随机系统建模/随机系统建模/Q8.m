clc;clear;
m=zeros(1000,1);
n=0;
for i=1:1000
    a=rand;
    b=rand;
    if a<0.4&&b<0.4
        n=n+1;
    end
    m(i)=n/i;
end
plot(m);