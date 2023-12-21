function [X, iter, res, t] = bi1_oc(B,C)
%Code for Generalized Diagonal Update Method with G_gamma

tol = 5e-15;
m=size(B);
X0 = zeros(m);
X = X0;
I = eye(m);
iter = 0;

tic;
a=min(real(eig(B-C)))-1.0001;
% we regard A is idenity 

while(1)
    d = min(1,min(abs(diag(X))));
    X = -(B+X-a*d*I)\(C+a*d*X);
    if norm(X-X0,'inf')/norm(X,'inf') < m*tol
        break;
    end
    X0 = X;
    iter = iter + 1;
end
t = toc;
res = norm(X^2+B*X+C,'inf')/(norm(X^2,'inf')+norm(B*X,'inf')+norm(C,'inf'));
