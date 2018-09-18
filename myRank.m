function [Rank]=myRank(A)
% This function returns the Rank of the matrix A

[X RREF D]=myGJSolver(A,[]);
[row col]=size(A);
count=0;
for i=1:row

    F = find(RREF(i,:)==1,1);
    if isempty(F)==0
        count=count+1;
    end
end
Rank=count;

end