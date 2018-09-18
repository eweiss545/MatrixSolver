function [D] = myDeterminant(A)
%This function calls myGJSolver and returns the determinant of the solution
[X RREF Det]=myGJSolver(A,[]);
D=Det;

end

