function [X,iter,res,t]= cr_uqme(A,B,C)
%Code for Cyclic Reduction Method
%X : primary solvent of AX^2+BX+C=0 (when it is overdamped)

tol = 5e-15;
kmax = 30;
err = 1;
m = size(C,1);

X0=B;
A0=A;
B0=B;
C0=C;

iter = 0;
tic
while (err > m*tol) && (iter < kmax)
    W0=B0\[A0 C0];
    W1=W0(:,1:m); %W1=inv(B0)*A0
    W2=W0(:,m+1:2*m); %W2=inv(B0)*C0

    W=C0*W1; %W=C0*inv(B0)*A0
    C0=C0*W2; %C0=C0*inv(B0)*C0
    B0=B0-W; %B0=B0-C0*inv(B0)*A0
    
    W=A0*W2; %W=A0*inv(B0)*C0
    A0=A0*W1; %A0=A0*inv(B0)*A0
    X0=X0-W; %X0=X0-A0*inv(B0)*C0
    B0=B0-W; %B0=B0-C0*inv(B0)*A0-A0*inv(B0)*C0
    
    err = norm(A0,1);
    iter = iter + 1;
end
if iter == kmax
    disp('warning cr')
end
X=-X0\C;
t=toc;
res=norm( X^2 + B*X + C,'fro');
