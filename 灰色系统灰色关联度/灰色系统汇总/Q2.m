x=[960800 257119 173758 688860 2080537
   971668 276880 216354 702719 2167621
   1023730 296592 204911 715030 2240263
   104609 355943 211100 716341 2329479];
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