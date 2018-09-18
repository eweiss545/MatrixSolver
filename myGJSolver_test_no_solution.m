% Tests how myGJSolver solver handles a lack of solution to Ax=y

[X, R, D] = myGJSolver(A, y);

assert(isempty(X), 'X problem')
assert(myNorm(R-rref(double(A)))<1e-10, 'RREF problem')
if m==n
    assert(abs(D-det(double(A)))<1e-10, 'D problem')
else
    assert(isempty(D), 'D problem')
end