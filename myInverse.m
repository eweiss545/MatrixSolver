function [inv]=myInverse(A)
%This function calls myGJSolver to find the inverse

[row col]=size(A);
[X RREF D]=myGJSolver(A,eye(row));

if D~=0
    inv=X;
else
    inv=[];
end
    

end