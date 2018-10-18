# MatrixSolver

** This project was super difficult because both my partner and I did not know linear algebra when we first started out!

This project runs a program that is essentially a general linear equation solver based on Gauss-Jordan elimination, and also creates additional functions that use it to find matrix determinants, inverses, ranks, ranges and null spaces. 

Helper functions for GJ Solver: myNorm, my Normalize, myDot, myMatrixMult, myTranspose, myIsSymmetric, swap.

myGJSolver: solves linear equations of the form AX = Y. The function returns a solution, X, the reduced row echelon form, RREF of Matrix A and the determinant, D, of A. 

The signature is:
function [X, RREF, D] = myGJSolver(A, Y). 

Then follow a number of other functions that uses myGJSolver to find additional data: myDeterminant, myInverse, myRank, myRange and myNull. 

The other files test myGJSolver in a range of conditions. 

For more details on this project, please see CS0040_Matrix_Project pdf. 
