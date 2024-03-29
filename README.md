# Optimal Constant for Generalized Diagonal Update Method
This page is for sharing some m-files(matlab files) which are used in the paper "**Optimal Constant for Generalized Diagonal Update Mehotd**".
The following files are used in "**Section 5 Numerical experimets**" of the paper.

### Making Matrices
- makeABCdampKim : for making the matrices A,B, and C in Example 1.
- makeABCdampBai2 : for making the matrices A,B, and C in Example 2.

### Methods
- bartelsStewart : for using the Bartels-Stewart method to solve a generalized Sylvester equation AXB^T+CXD^T=E. **This code is from https://github.com/ajt60gaibb/freeLYAP .**
- bi1 : for using the Bernoulli's method BI1 : X_{k+1}=F_1(X_k), F_1(X)=-(B+X)^{-1}C to solve a quadratic matrix equation AX^2+BX+C=0.
- bi2 : for using the Bernoulli's method BI2 : X_{k+1}=F_2(X_k), F_2(X)=-B^{-1}(X^2+C) to solve a quadratic matrix equation AX^2+BX+C=0.
- bi1_oc : for using the generalized diagonal update method BI1-OC with the fucntion G_{\gamma}(X) to solve a quadratic matrix equation AX^2+BX+C=0.
- bi2_oc : for using the generalized diagonal update method BI2-OC with the fucntion H_{\gamma}(X) to solve a quadratic matrix equation AX^2+BX+C=0.
- nm_qme_Bartels : for using the Newton's method with the Bartels-Stewart method to solve a quadratic matrix equation AX^2+BX+C=0.
- cr_uqme : for using the cyclic reduction method in "**Algorithms for Hyperbolic quadratic eigenvalue problems (Guo, Lancaster, 2005)**" and "**Numerical Solution of Algebraic Riccati Equations (Bini, Iannazzo, Meini, 2012)**" to solve a quadratic matrix equation AX^2+BX+C=0.

### Compiler
- fig1_1 : for comparing iteration numbers of the methods BI1 and BI1-OC, and for making the Figure 1_1.
- fig1_2 : for comparing iteration numbers of the methods BI2 and BI2-OC, and for making the Figure 1_2.
- timecompare : for comparing computational time and making the Talbe 1.
- residualcompare : for comparing residualcompare and making the Table 2.
- fig2 : for comparing residual of the methods BI1 and BI1-OC, and for making the Figure 2.
- fig3_1 : for making the Figure 3_1.
- fig3_2 : for making the Figure 3_2.
