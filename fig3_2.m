%%Code for Computing Iteration Numbers and Making Fig3_2 in Example2
clear
clc
m=25; 

for  i=2:m %i=2:10:m
%Make Target equation    
[A, B, C]=makeABCdampBai2(i);
I=eye(i);

%BI1
[X, iter, res, t] = bi1(B,C);
a(i)=iter
clear iter;

%BI1-OC
[X, iter, res, t] = bi1_oc(B,C);
b(i)=iter
clear iter;

%Optimal constant
c(i)=min(real(eig(B-C)));
 
end
i=2:m 
plot(i,a(i),'*k',i,b(i),'ob')
xlabel('m=size of matrices')
ylabel('Iteration number')
legend('BI1','BI1-OC')