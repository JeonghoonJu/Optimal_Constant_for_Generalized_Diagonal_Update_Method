function [X, iter, res, t] = bi1(B,C)
%Code for Original Bernoulli's Method F_1

tol = 5e-15;
m=size(B);
X0 = zeros(m);
X = X0;
iter = 0;
% we regard A is idenity 

tic;
while(1)
    X = -(B+X)\(C);
    if norm(X-X0,'inf')/norm(X,'inf') < m*tol
        break;
    end
    X0 = X;
    iter = iter + 1;
end
t = toc;
res = norm(X^2+B*X+C,'inf')/(norm(X^2,'inf')+norm(B*X,'inf')+norm(C,'inf'));
