%Code for Comparing Residual in Example1,2
clear
clc
m=500; %Change the size of matrices m

[A, B, C]=makeABCdampKim(m);
B=0.95*B;

%[A, B, C]=makeABCdampBai2(m);
 

    %BI1
    [X, iter, res, t] = bi1(B,C);
    a=res;
    clear res

    %BI2
    [X, iter, res, t] = bi2(B,C);
    b=res;
    clear res

    %Newton's Method
    [X, iter, res, t] = nm_qme_Bartels(A,B,C); 
    c=res;
    clear res

    
    %Cyclic Reduction2
    [X, iter, res, t] = cr_uqme(A,B,C);
    d=res;
    clear res

    %BI1-OC
    [X, iter, res, t] = bi1_oc(B,C);
    e=res;
    clear res

    %BI2-OC
    [X, iter, res, t] = bi2_oc(B,C);
    f=res;
    clear res


disp('residual BI1='); a
disp('residual BI2'); b
disp('residual Newton'); c
disp('residual cyclic'); d
disp('residual BI1-OC'); e
disp('residual BI2-OC'); f