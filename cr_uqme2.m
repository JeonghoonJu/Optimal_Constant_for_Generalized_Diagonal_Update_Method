function [X,iter,res,t]= cr_uqme2(A,B,C)
%Code for Cyclic Reduction Method
%X : primary solvent of AX^2+BX+C=0 (when it is overdamped)

tol = 1e-13;
kmax = 30;
err = 1;

X0=B;
A0=A;
B0=B;
C0=C;


iter = 0;
tic
while (err > tol) && (iter < kmax)
    X1=X0-A0*inv(B0)*C0;
    X=-inv(X1)*C;
    err = norm( X^2 + B*X + C,'fro');    
    
    A1=A0*inv(B0)*A0;
    B1=B0-A0*inv(B0)*C0-C0*inv(B0)*A0;
    C1=C0*inv(B0)*C0;
    
    iter = iter + 1;
    A0=A1;
    B0=B1;
    C0=C1;
    X0=X1;
end
if iter == kmax
    disp('warning cr')
end
t=toc;
res=err;
