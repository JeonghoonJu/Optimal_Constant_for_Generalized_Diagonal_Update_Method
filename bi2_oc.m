function [X, iter, res, t] = bi2_oc(B,C)
%Code for Generalized Diagonal Update Method with H_gamma

tol = 5e-15;
m=size(B);
X0 = zeros(m);
X = X0;
I = eye(m);
iter = 0;
tic;
a=min(real(eig(B-C)))-0.0001;
% we regard A is idenity 

while(1)
    d = min(1,min(abs(diag(X))));
    X = (-B+a*d*I)\(X*X+a*d*X+C);
    if norm(X-X0,'inf') < m*tol
        break;
    end
    X0 = X;
    iter = iter + 1;
end
t = toc;
res = norm(X^2+B*X+C,'fro');