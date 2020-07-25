function [X1,X2,X3 ] = get_x(X)
%% Provides X1, X2, X3 in matrix format

[I, J, K]=size(X);
X1=zeros(K*J,I);
for i=1:I
    X1(:,i)=vec(squeeze(X(i,:,:)));
end

% Used in the V-update step:
X2=zeros(I*K,J);
for j=1:J
    X2(:,j)=vec(squeeze(X(:,j,:)));
end

% Used in the W-update step:
X3=zeros(I*J,K);
for k=1:K
    X3(:,k)=vec(squeeze(X(:,:,k)));
end

end

