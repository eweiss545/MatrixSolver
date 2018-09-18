%% Project 2 - Elena & Hunter

%% Problem 2.1: L2 Norm
%% *A) Test Cases*
%myNorm Testing
Case11=myNorm([1;-4;5]);
assert(isequal(Case11,sqrt(42)),'Case 11: Basic Function')
Case12=myNorm([0;0;0]);
assert(isequal(Case12,0),'Case 12: Zero')
Case13=myNorm([-2;-2;-2]);
assert(isequal(Case13,sqrt(12)),'Case 13: Negative')

%myNormalize Testing
tol = 0.0001;
Case14=myNormalize([1;-4;5]);
Case14n = [(1/sqrt(42)) (-2*sqrt(2/21)) 5/sqrt(42)]';
assert(abs(myNorm(Case14-Case14n)) < tol, 'Case 14: Basic Function')
Case15=myNormalize([0;0;0]);
assert(isequal(Case15,[0;0;0]),'Case 15: Zero Length')
Case16=myNormalize([-3.5]);
assert(isequal(Case16,[-1]),'Case 16: 1x1')

%% *B) Function*
dbtype myNorm.m
dbtype myNormalize.m

%% Problem 2.2: Dot Product
%% *A) Test Cases*

Case21=myDot([0 0 1],[1 0 0]);
assert(isequal(Case21,0),'Case 21: Orthogonal Vectors')
Case22=myDot([1 1], [1 2 3]);
assert(isequal(Case22,[]),'Case 22: Different Sizes')
Case23=myDot([3;2],[0;0]);
assert(isequal(Case23,0),'Case 23: 2 column')
Case24=myDot([2 3 4;1 2 3], [1 0 1;1 2 0]);
assert(isequal(Case24,11), 'Case 24: 2x3 matrix')

%% *B) Function*
dbtype myDot.m

%% Problem 2.3: Matrix Multiplication
%% *A) Test Cases*
Case31A = [1;2;2];
Case31B = [0 5 5];
Case31C = myMatrixMult(Case31A, Case31B);
Case31D = [0 5 5;0 10 10;0 10 10];
assert(isequal(Case31C, Case31D))

Case32A = [0 5 5];
Case32B = [1;2;2];
Case32C = myMatrixMult(Case32A, Case32B);
assert(isequal(Case32C, [20]))

Case33A=[0 5;2 6;1 2];
Case33B=[1 4 1;2 4 4;2 4 6];
Case33C= myMatrixMult(Case33A,Case33B);
assert(isequal(Case33C,[]),'Case 33: Undefined')

Case34A=[1 2 3;4 5 6;7 8 9];
Case34B=[9 7 8;6 5 4; 3 2 1];
Case34C=myMatrixMult(Case34A, Case34B);
assert(isequal(Case34C,Case34A*Case34B),'Case 34: 3x3 Matrix')

%% *B) Function*
dbtype myMatrixMult.m

%% Problem 2.4: Transpose
%% *A) Test Cases*
%myTranpose testing
Case41A = myTranspose([1 4 1;2 4 7;2 8 4]);
Case41B = [1 2 2;4 4 8;1 7 4];
assert(isequal(Case41A, Case41B), 'Case 41: 3x3 Matrix')

Case42A = myTranspose([4 3 2 1]);
Case42B = [4 3 2 1]';
assert(isequal(Case42A, Case42B), 'Case 42: Row Vector')

Case43A = myTranspose([4;3;2;1]);
Case43B = [4 3 2 1];
assert(isequal(Case43A, Case43B), 'Case 43: Col Vector')

Case44A = myTranspose([4 0;3 0;2 0;1 0]);
Case44B = [4 0;3 0;2 0;1 0]';
assert(isequal(Case44A, Case44B), 'Case 44: 4x2 Vector')

%myIsSymmetric testing
Case45 = [1 7 3;7 4 -5;3 -5 6];
assert(isequal(myIsSymmetric(Case45), 1))

Case46 = [1 2 3 4];
assert(isequal(myIsSymmetric(Case46), 0))

Case47 = [1 2 3 4]';
assert(isequal(myIsSymmetric(Case47), 0))


%% *B) Function*
dbtype myTranspose.m
dbtype myIsSymmetric.m





