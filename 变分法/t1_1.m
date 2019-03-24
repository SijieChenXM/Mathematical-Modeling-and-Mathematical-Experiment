i = 2;T(1) = 100;j = 1;
for y = -3:0.1:0
    x = 1-y;
    T(i) = cycloid(x,-y);
    if(T(i)<T(j)) 
        j = i;
        i=i+1;
    end
end
y0 = -3+0.1*(j-2)
x0 = 1-y0
[T,gx,gy] = cycloid(x0,-y0);
T
plot(gx,-gy);
grid on;