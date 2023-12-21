function [X,iter,res,t]=nm_qme_Bartels(A,B,C)
% A*X^2 + B*X + C = 0

tol = 5e-15;
kmax = 30;
err = 1;
m=size(C,1);

X0 = zeros(m);
B=A\B;
C=A\C;
A=eye(m);                                                                
I = eye(m);
H=zeros(m);

iter = 0;  

tic;

while (err > m*tol) && (iter < kmax)
    H =bartelsStewart(A,X0.', A*X0 + B,I,-X0^2 - B*X0 - C);
    X0 = X0 + H;
    err = norm(H,'inf')/norm(X0,'inf');
    
    iter = iter + 1 ;                                                    
end
if iter >= kmax
    disp('warning nm')
end

t = toc;
X=X0;
res = norm(X^2+B*X+C,'inf')/(norm(X^2,'inf')+norm(B*X,'inf')+norm(C,'inf'));
