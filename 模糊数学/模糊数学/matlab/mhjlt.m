function [M,N]=mhjlt(R) %±Õ°ü¾ØÕó
%clc;
U=unique(R);
L=length(U);
M=1:L;
for i=L-1:-1:1
    [m,n]=find(R==U(i));
    N{i,1}=n;
    N{i,2}=m;
    R(m(1),:)=0;
    mm=unique(m);
    N{i,3}=mm;
    len=length(find(m==mm(1)));
    depth=length(find(m==mm(2)));
    index1=find(M==mm(1));
    MM=[M(1:index1-1),M(index1+depth:L)];  %
    index2=find(MM==mm(2));
    M=M(index1:index1+depth-1);
    M=[MM(1:index2-1),M,MM(index2:end)];
end
M=[1:L;M;ones(1,L)];
h=(max(U)-min(U))/L;
figure 
text(L,1,sprintf('%d',M(2,L)));
text(L+1,1-h,sprintf('%d',L));
text(0,1,sprintf('%3.2f',1));
text(0,(1+min(U))/2,sprintf('%3.2f',(1+min(U))/2));
text(0,min(U),sprintf('%3.2f',min(U)));
hold on
for i=L-1:-1:1
    m=N{i,2};
    n=N{i,1};
    mm=N{i,3};
    k=find(M(2,:)==mm(1));
    l=find(M(2,:)==mm(2));
    x1=M(1,k);
    y1=M(3,k);
    x2=M(1,l);
    y2=M(3,l);
    x=[x1,x1,x2,x2];
    M(3,[k,l])=U(i);
    M(1,[k,l])=sum(M(1,[k,l]))/length(M(1,[k,l]));
    y=[y1,U(i),U(i),y2];
    plot(x,y);
    text(i,1,sprintf('%d',M(2,i)));
    text(M(1,k(1)),U(i)+h*0.1,sprintf('%3.2f',U(i)));
    text(L+1,1-i*h-h,sprintf('%d',L-i));
end
axis([0 L+1 min(U) max(U)])
axis off
hold off
end