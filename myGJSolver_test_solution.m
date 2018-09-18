%% Tests if myGJSolver solver finds a solution to Ax=y
% Also checks the returned RREF and determinant


[X, R, D] = myGJSolver(A, y);

assert(myNorm(R-rref(double(A)))<1e-10, 'RREF problem')
assert(myNorm(y-A*X)<1e-10, 'X problem')
% if m==n
%     assert(abs(D-det(double(A)))<1e-10, 'D problem')
% else
%     assert(isempty(D), 'D problem')
% end
