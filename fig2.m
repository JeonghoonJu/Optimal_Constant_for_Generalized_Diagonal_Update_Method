% For Making a Fig2 of Iteration Number in Example 2
clear
clc
m=100;

hold on

%makeABC
[A,B,C]=makeABCdampBai2(m);
I = eye(m);

tol = 5e-15;

%BI1
[X, iter1, res, t] = bi1(B,C);
X0 = zeros(m);
X = X0;
x1=zeros(iter1,1);
for i=1:1:iter1;
    X = -(B+X)\(C);
    x1(i)=norm(X^2+B*X+C,'inf');
end


%BI1-OC
[X, iter2, res, t] = bi1_oc(B,C);
X0 = zeros(m);
X = X0;
a=min(real(eig(B-C)))-1.0001;
x2=zeros(iter2,1);
for i=1:1:iter2;
    d = min(1,min(abs(diag(X))));
    X = -(B+X-a*d*I)\(C+a*d*X);
    x2(i)=norm(X^2+B*X+C,'inf');
end

plot(x1,'*k');
plot(x2,'db');
xlabel('Iteration number')
ylabel('Residual')
legend('BI1','BI1-OC')
set(gca, 'YScale', 'log')
