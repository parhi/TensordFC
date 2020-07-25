function vecA = vec(A);
%% Vectorizes A
[I F] = size(A);
vecA=zeros(I*F,1);
for f=1:F,
    vecA(I*(f-1)+1:I*f)=A(:,f);
end

