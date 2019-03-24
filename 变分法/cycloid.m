function [T,gx,gy] = cycloid(b,H)
 n = 100;
 g = 9.8;
 h = H/n;
 minc = 0;maxc = 1/sqrt(2*g*h*n);
 x = 0;y = 0;
 while abs(b-x)>1e-4
     x = 0;
     c = (minc+maxc)/2;
     for j= 1:n
         y = j*h;
         v = sqrt(2*g*y);
         x = x+c*v*h/sqrt(1-c^2*v^2);
         gx(j) = x;
         gy(j) = y;
     end
     if(x<b)
      minc = c;
     else
      maxc = c;
     end
 end
 T =0;
 for j = 1:n
     v = sqrt(2*g*j*h);
     if j==1
         s = sqrt(gx(1)^2+h^2);
     else
         s = sqrt((gx(j)-gx(j-1))^2+h^2);
     end
     T = T+s/v;
 end
end