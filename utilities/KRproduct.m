function [C] = KRproduct(A,B)
% The function calculates the khatri-rao product

[I,F]=size(A);
[J,F1]=size(B);
if F~=F1
    error('The number of columns should match')
else
    C=zeros(I*J,F);
    for i=1:I
        C((i-1)*J+1:J*i,:)= (ones(J,1)*A(i,:)).*B;
    end
end

n = ones(size(C,1), 1)*sqrt(sum((C.*C)));
C = C./n;
end