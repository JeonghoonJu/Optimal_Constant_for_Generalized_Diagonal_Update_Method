function [X,iter,res,t]=nm_qme_Bartels(A,B,C)
% A*X^2 + B*X + C = 0

tol = 1e-13;
kmax = 30;

m=size(A);
X0 = zeros(m);
B=A\B;
C=A\C;
A=eye(m);
iter = 0;                                                                  
I = eye(m);
H=zeros(m);
err = 1;
normA = norm(A,'fro');
normB = norm(B,'fro');
normC = norm(C,'fro');

tic;

while (err > tol) && (iter < kmax)
    H =bartelsStewart(A,X0.', A*X0 + B,I,-X0^2 - B*X0 - C);
    X1 = X0 + H ;
    X = X1;
    err = norm( X1^2 + B*X1 + C,'fro');
    
    iter = iter + 1 ;                                                    
    X0 = X1;
end
if iter >= kmax
    disp('warning nm')
end

t = toc;
res = err;
