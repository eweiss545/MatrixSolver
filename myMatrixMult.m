function [out] = myMatrixMult(A,B)
%Multiplies two matrices together, A & B. 
[r1 c1]=size(A);
[r2 c2]=size(B);
mat = [];
if c1 == r2
    for i = 1:r1
        for j = 1:c2
            mat(i,j)=dot(A(i,:),B(:,j));
        end
    end
    out=mat;
else
    out=[];
end
end

