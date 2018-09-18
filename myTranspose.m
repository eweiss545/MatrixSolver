function [T] = myTranspose(M)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
[r1 c1]=size(M);
mat=[];
for i = 1:r1
    for j = 1:c1
        if r1 == c1
            mat(i,j)=M(j,i);
        else
            mat(j,i) = M(i,j);
    end
end

T=mat;

end

