disp('Start myXXX_tests.m')

Ar3 = [1 1 4; 2 6 8; 6 8 16]; % Rank 3
Ar2 = [1 2 4; 2 4 8; 6 8 16]; % Rank 2
Ar1 = [1 2 4; 2 4 8; 4 8 16]; % Rank 1
Ar0 = [0 0 0; 0 0 0; 0 0 0];  % Rank 0
Aunder = [1 1 0; 0 0 1; 0 0 0]; % Skipped Variable


Ar21=[1 3;3 7]; %Rank 2, 2x2 matrix
Ar22=[1 2;4 8]; %Rank 1, 2x2 matrix

Ar11=[4]; %Single Matrix Variable

y=[4 8 16]';
y2=[2 4]';


TA = {{Ar3,y}, {Ar2,y}, {Ar1,y}, {[Ar3 Ar3],y}, {[Ar3 ; Ar3] [y ; y]}, ...
    {Ar0, [0 0 0]'}, {Aunder, [3 0 0]'},{Ar21,y2}, {Ar22,y2},{Ar11,Ar11}};

%% Test myXXX functions
for ii = 1:length(TA)
    A = TA{ii}{1};
    y = TA{ii}{2};
    [m, n] = size(A);
    
    
    
    
    % Test myNorm
    CheckmyNorm=myNorm(y);
    assert(isequal(CheckmyNorm,norm(y)),'MyNorm Testing')
    
    % Test myNormalize

    
    if myNorm(y)~=0
        assert(isequal(myNormalize(y), y./myNorm(y)), 'myNorm problem')
    else
        assert(isempty(myNormalize(y)))
    end
    tol = 0.0001;
    
    % Test myDot
    assert(isequal(myDot(y,2*y),dot(y,2*y)),'Simple function')

    %Extra myDot cases
    Case21=myDot([0 0 1],[1 0 0]);
    assert(isequal(Case21,0),'Case 21: Orthogonal Vectors')
    Case22=myDot([1 1], [1 2 3]);
    assert(isequal(Case22,[]),'Case 22: Different Sizes')
    Case23=myDot([3;2],[0;0]);
    assert(isequal(Case23,0),'Case 23: 2 column')
    Case24=myDot([2 3 4;1 2 3], [1 0 1;1 2 0]);
    assert(isequal(Case24,11), 'Case 24: 2x3 matrix')
    
    % Test myMatrixMult
    assert(isequal(myMatrixMult(A,A'),A*A'),'Multiplication of similar size')
   
    assert(isequal(myMatrixMult(y,y'),y*y'),'Mult of different shape')
    
  
    
    Case33A=[0 5;2 6;1 2];
    Case33B=[1 4 1;2 4 4;2 4 6];
    Case33C= myMatrixMult(Case33A,Case33B);
    assert(isequal(Case33C,[]),'Case 33: Undefined')
    
    Case34A=[1 2 3;4 5 6;7 8 9];
    Case34B=[9 7 8;6 5 4; 3 2 1];
    Case34C=myMatrixMult(Case34A, Case34B);
    assert(isequal(Case34C,Case34A*Case34B),'Case 34: 3x3 Matrix')
    
    % Test myTranspose
    
    assert(isequal(myTranspose(A),A'),'Large Transpose')
    assert(isequal(myTranspose(y),y'),'Small Matrix')
   
    
    Case44A = myTranspose([4 0;3 0;2 0;1 0]);
    Case44B = [4 0;3 0;2 0;1 0]';
    assert(isequal(Case44A, Case44B), 'Case 44: 4x2 Vector')
   
    % Test myIsSymmetric
    assert(isequal(myIsSymmetric(A),issymmetric(A)),'Large Symmetric')
    assert(isequal(myIsSymmetric(y),issymmetric(y)),'Small Symmetric')
    
    % Test myDeterminant
    if m==n
        if rank(double(A))==m
            assert(abs(double(myDeterminant(A))-det(double(A)))<1e-10, 'myDeterminant Problem')
        else
            assert(myDeterminant(A)==0, 'myDeterminant Problem');
        end
    else
        assert(isempty(myDeterminant(A)), 'myDeterminant Problem')
    end
    
    % Test myInverse
    if abs(myDeterminant(A))>0
        assert(myNorm(myInverse(A)*A-eye(m))<1e-10, 'Inverse Problem')
    else
        assert(isempty(myInverse(A)), 'Inverse Problem')
    end
    
    % Test myRank
    assert(myRank(A)==rank(double(A)), 'Rank Problem')
    
    % Test myRange
    R = myRange(A);
    assert(size(R,2)==myRank(A), 'myRank dimension problem') %% fix later
    assert(myRank([R A])==myRank(A), 'myRank span problem')
    
    % Test myNull
    Z = myNull(A);
    if isempty(Z)
        assert(myRank(A)==min(m,n), 'myNull problem')
    else
        assert(size(Z,1)==n && size(Z,2)==n-myRank(A), 'myNull problem')
        assert(myNorm(A*Z)<1e-10, 'myNull problem')
    end
end

disp('myXXX_tests.m passed')