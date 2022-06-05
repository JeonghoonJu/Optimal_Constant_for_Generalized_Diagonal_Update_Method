function [X,iter,res,t]= cr_uqme1(A0,A1,A2)
%Code for Cyclic Reduction Method
%X : solution of the UQME A0+A1X+A2X^2=0

tol = 1e-13;
kmax = 30;
n = size(A0,1);

AH = A1;
AT = A1;
B0 = A0; B1 = A1; B2 = A2;

err = 1;
k = 0;
tic
while err > tol && k < kmax
    F = [B0;B2]/B1;
    F0 = F(1:n,:);
    F2 = F(n+1:2*n,:);
    W = F2*B0;
    B0 = F0*B0;
    AH = AH - W;
    B1 = B1 - W;
    W = F0*B2;
    B2 = F2*B2;
    AT = AT - W;
    B1 = B1 - W;
    err = min(norm(B0,1), norm(B2,1));
    k = k + 1;
end
G = -AH\A0;
if k == kmax
    disp('warning cr')
end
t=toc;
X=G;
iter = k;
res=err;