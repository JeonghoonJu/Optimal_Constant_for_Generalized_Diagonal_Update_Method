%%Code for Computing Iteration Numbers and Making Fig3_1 in Example2
clear
clc
m=25;

for  i=2:m %i=2:10:m
%Make Target equation    
[A, B, C]=makeABCdampBai2(i);
I=eye(i);

%Optimal constant
c(i)=min(real(eig(B-C)));
 
end
i=2:m 
%i=2:10:m; %i,a(i),'*k'

plot(i,c(i),'r*')
xlabel('m=size of matrices')
ylabel('\gamma *')
ylim([1 2.1])
legend('\gamma *')