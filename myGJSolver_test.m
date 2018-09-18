disp('Start myGJSolver_test.m')

Ar3 = [1 1 4; 2 6 8; 6 8 16]; % Rank 3
Ar2 = [1 2 4; 2 4 8; 6 8 16]; % Rank 2
Ar1 = [1 2 4; 2 4 8; 4 8 16]; % Rank 1
Ar0 = [0 0 0; 0 0 0; 0 0 0];  % Rank 0
Aunder = [1 1 0; 0 0 1; 0 0 0]; % Skipped Variable

y=[4 8 16]';

TA = {{Ar3,y}, {Ar2,y}, {Ar1,y}, {[Ar3 Ar3], y}, {[Ar3 ; Ar3], [y ; y]}, ...
    {Ar0, [0 0 0]'}, {Aunder, [3 0 0]'}}; % Linear Systems to test

%% Test single solution case
for ii = 1:length(TA)
    A = TA{ii}{1}; y = TA{ii}{2}; [m, n] = size(A);
    
    myGJSolver_test_solution
end

%% Test multiple solution case
for ii = 1:length(TA)
    A = TA{ii}{1};
    m = size(A,1); n = size(A,2);
    y = A*[rem(1:size(A,2),2)'==0 rem(1:size(A,2),2)'==1];
    
    myGJSolver_test_solution
end

%% Test single no solution case
for ii = 1:length(TA)
    A = TA{ii}{1};
    m = size(A,1); n = size(A,2);
    
    if rank(A) < m
        A = rref(A);
        y = double(all(A==0,2)); % Bad solution
        
        myGJSolver_test_no_solution
    end
end

%% Test no solution in multiple solution case
for ii = 1:length(TA)
    A = TA{ii}{1};
    m = size(A,1); n = size(A,2);
    
    if myRank(A) < m
        A = rref(A);
        y = all(A==0,2); % Bad solution
        y = [A*ones(n,1) y];
        
        myGJSolver_test_no_solution
    end
end
disp('myGJSolver_test.m passed')




