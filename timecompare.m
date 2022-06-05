%Code for Comparing Times in Example1,2
clear
clc
n=10; 
m=100; %Change the size of matrices m

[A, B, C]=makeABCdampKim(m);
B=0.95*B;

%[A, B, C]=makeABCdampBai2(m);
 
for i=1:n
    %BI1
    [X, iter, res, t] = bi1(B,C);
    a(i,1)=t;
    clear t

    %BI2
    [X, iter, res, t] = bi2(B,C);
    b(i,1)=t;
    clear t

    %Newton's Method
    [X, iter, res, t] = nm_qme_Bartels(A,B,C); 
    c(i,1)=t;
    clear t
    
    %Cyclic Reduction2
    [X, iter, res, t] = cr_uqme(A,B,C);
    d(i,1)=t;
    clear t

    %BI1-OC
    [X, iter, res, t] = bi1_oc(B,C);
    e(i,1)=t;
    clear t

    %BI2-OC
    [X, iter, res, t] = bi2_oc(B,C);
    f(i,1)=t;
    clear t
end

disp('time BI1='); sum(a)/n
disp('time BI2'); sum(b)/n
disp('time Newton'); sum(c)/n
disp('time cyclic2'); sum(d)/n
disp('time BI1-OC'); sum(e)/n
disp('time BI2-OC'); sum(f)/n