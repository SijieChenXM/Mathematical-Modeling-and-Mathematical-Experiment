clear;clc;
x=[960800 257119 173758 688860 2080537
   971668 276880 216354 702719 2167621
   1023730 296592 204911 715030 2240263
   1046095 355943 211100 716341 2329479
   1052384 365933 239101 729051 2386469
   1099454 398715 244888 771625 2514682
   1167362 319486 232816 806689 2526353
   1193838 459177 269779 758769 2681563
   1185079 488706 268956 768619 2711360];
[m,n]=size(x);
for i=1:n
    x(:,i)=x(:,i)/x(1,i);
end
s1=1;
s2=4;
mu=x(:,s2+1:end);
zi=x(:,1:s2);
for i=1:s1
    for j=1:s2
        t(:,j)=zi(:,j)-mu(:,i);
    end
    min2=min(min(abs(t)));
    max2=max(max(abs(t)));
    rho=0.5;
    eta=(min2+rho*max2)./(abs(t)+rho*max2);
    R(i,:)=mean(eta);
end
R
a=x';
for i=1:5
    lamda=a(i,1:m-1)./a(i,2:m);
    c=0;
    range=minmax(lamda);
    ran1=[exp(-2/(m+1)),exp(2/(m+2))];
    if(ran1(1)<range(1),range(2)<ran1(2))
        disp('级比检验通过');
    else
        disp('级比检验未通过');
    end
    a1=cumsum(x(:,i));
    B=[-0.5*(a1(1:end-1)+a1(2:end)),ones(n-1,1)];
    Y=x(2:end,i);
    r=B\Y;
    y=dsolve('Dy+a*y=b','y(0)=y0');
    y=subs(y,{'a','b','y0'},{r(1),r(2),a1(1)});
    yuce1=subs(y,'t',[0:2*n-1]);
    digits(6),y=vpa(y);
    yuce=diff(yuce1);
    yuce=[a(1),yuce];
end

