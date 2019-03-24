clear;clc;
grades=[65 61 72 84 81 79
       77 77 76 64 70 55
       67 63 49 65 67 57
       80 69 75 74 74 63
       74 70 80 84 81 74
       78 84 75 64 71 64
       66 71 67 52 65 57
       77 71 57 72 86 71
       83 100 79 41 67 50
       86 94 97 51 63 55
       74 80 88 64 73 66
       67 84 53 58 66 56
       81 62 69 56 66 52
       71 64 69 56 66 52
       78 96 81 80 89 76
       69 56 67 75 94 80
       77 90 80 68 66 60
       84 67 75 60 70 63
       62 67 83 71 85 77
       74 65 75 72 90 73
       91 74 97 62 71 66
       72 87 72 79 83 76
       82 70 83 68 77 85
       63 70 60 91 85 82
       74 79 95 59 74 59
       66 61 77 62 73 64
       90 82 98 47 71 60
       77 90 85 68 73 76
       91 82 84 54 62 60
       78 84 100 51 60 60];
 varnames={'数学','物理','化学','语文','历史','英语'}';
 obsname=1:30;
 obsname=obsname';
 [lambda,psi,T,stats,F]=factoran(grades,2)
contribut=100*sum(lambda.^2)/6
cumcont=cumsum(contribut)
result1=num2cell(lambda);
result=[varnames,result1]
obsF=[num2cell(obsname),num2cell(F)]
j=1;k=1;
for i=1:30
    if F(i,1)<F(i,2)
        li(j)=i;
        j=j+1;
    else
        wen(k)=i;
        k=k+1;
    end
end
fprintf('适合学理科的学生有：')
for i=1:j-1
    fprintf('%6d',li(i))
end
fprintf('\n适合学文科的学生有：')
for i=1:k-1
    fprintf('%6d',wen(i))
end