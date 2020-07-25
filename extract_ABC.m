function [A,B,C] = extract_ABC(tensor)
%% This is the main script for decomposition using Model 3
%% Factors are in A, B, C

% clear all;
% %% Tensor data is in masked_tensor.mat
% load('masked_tensor.mat');
F=20;
[I, J, K]=size(tensor);

A=rand(I,F);
B=rand(J,F);
C=rand(K,F);
[X1,X2,X3]=get_x(tensor);

Aold=A;
Bold=B;
Cold=C;
%% Start the loop
for i=1:100
f=sprintf('Iteration = %d',i);
display(f);

%% First Stage for ALS (Procrustes Solution)

CB=KRproduct(C,B);
CBX=(pinv(CB)*X1)';
[A] = procrustrus(CBX')';
display('first stage finished')
%% Second Stage for ALS (Non costraints)
CA=KRproduct(C,A);
B=((CA')*X2)';
display('second stage finished')
%% Third Stage for ALS (Non-negativity)
BA=KRproduct(B,A);
C=((BA')*X3)';
C(find(C<0)) = 0;
display('third stage finished')
%% Check norm convergence
n(i)=100*((norm(X2-CA*B','fro')^2)/(norm(X2,'fro'))^2);
% plot(n)
% drawnow;

%% Check convergence of the matrices

% a(i)=(norm(Aold-A,'fro'));
% figure,plot(a)
% drawnow;
% b(i)=(norm(Bold-B,'fro'));
% figure,plot(b)
% drawnow
% c(i)=(norm(Cold-C,'fro'));
% figure,plot(c)
% drawnow

Aold=A;
Bold=B;
Cold=C;
 if (i>1) 
        if abs((n(i)-n(i-1)))<10^-7
        break;
        end
 end
end
end

