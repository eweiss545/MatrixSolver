function [X, RREF,D] = myGJSolver(A,Y)

%RREF Definition
[m n]=size(A);
h=1;%Row
k=1;%Column
D=1;
% set ranks and make copies so they don't change during row reduction
bleep = rank(A);
RankOfA = bleep;
boop = rank([A Y]);
RankOfAY = boop;

%Dealing with an empty Y
if isempty(Y)==1
    Y=zeros(m,1);
end
        
 %Dealing with a Y with multiple rows
if size(Y,2) > 1
    if size(Y,2) == 2
        Y1 = Y(:,1);
        Y2 = Y(:,2);
        X1 = myGJSolver(A,Y1);
        X2 = myGJSolver(A,Y2);
    elseif size(Y,2) == 3
        Y1 = Y(:,1);
        Y2 = Y(:,2);
        Y3 = Y(:,3);
        X1 = myGJSolver(A,Y1);
        X2 = myGJSolver(A,Y2);
        X3 = myGJSolver(A,Y3);
    elseif size(Y,2) == 4
        Y1 = Y(:,1);
        Y2 = Y(:,2);
        Y3 = Y(:,3);
        Y4 = Y(:,4);
        X1 = myGJSolver(A,Y1);
        X2 = myGJSolver(A,Y2);
        X3 = myGJSolver(A,Y3);
        X4 = myGJSolver(A,Y4);
    end
    
end


%Code to reduce to row echelon form.
while h<m && k<n
    [big big_row]=max(abs(A(h:end,k)));
    big_row=big_row+(h-1);
    if big==0;
        k=k+1;
    else
        if h ~= big_row
        A=swap(A,h,big_row);
        % multiply D by -1 in order to get correct determinant later
        D=D*-1;
        Y=swap(Y,h,big_row);
        end
        for i=h+1:m
            mult=A(i,k)/A(h,k);
            %Zeroes for numbers below pivot
            A(i,k)=0;
            %Finding reduced form of next columns
            Y(i,1)=Y(i,1)-Y(h,1)*mult;
            for j=k+1:n
                A(i,j)=A(i,j)-A(h,j)*mult;
            end
            
        end
    end
    h=h+1;
    k=k+1;
end


%Determinant Functionality
if m==n
    for i = 1:n
        D = D*A(i,i); % get product of diags to get D
    end
else
    D = [];
end


% currently in row echelon form - now time to reduce!!!
%Reduced echelon form
if m == n | m<n
    for i = 1:m
        if A(i,i)~=0
            mult = 1 / A(i,i);
            A(i,:) = A(i,:) * mult;
            Y(i,:) = Y(i,:) * mult;
        end
    end
else % if A has more rows than cols, we will run into indexing problem
    for i = 1:n
        if A(i,i)~=0
            mult = 1 / A(i,i);
            A(i,:) = A(i,:) * mult;
            Y(i,:) = Y(i,:) * mult;
        end
        % want the column vector below the last pivot to be equal to 0s
        % this column is located below A(n,n)
        if i == n
            bleep = size(A(i+1:end),1);
            A(i+1:end, i) = zeros(bleep,1);
        end
    end
    
end

for i = m:-1:1
    [row col] = find(A(i,:)==1,1);
    row=row+(i-1);
    above=1;
    while myNorm(A(1:i-1,col))~=0
        mult = A(row-above,col);
        A(i-above,:) = A(i-above,:)-A(i,:) * mult;
        Y(i-above,:) = Y(i-above,:)-Y(i,:) * mult;
        above=above+1;
    end
end

RREF=A;
X=Y;

if n>m % if there are more cols than row, all elements below row # should
        % equal 0
    for i = size(Y,1)+1:size(A,2)
        X(i) = 0;
    end
end

if m>n % if there are more rows than cols, cut off X to only include first 
        % n rows
    X = X(1:n);
end

%Dealing with a Y with multiple rows (again)
if size(Y,2) > 1
    if size(Y,2) == 2
        X = [X1 X2];
    elseif size(Y,2) == 3
        X = [X1 X2 X3];
    elseif size(Y,2) == 4
        X = [X1 X2 X3 X4];
    end
    
end

% determining if it has one solution, infinite solution, of if x is empty
if RankOfA == RankOfAY
    if RankOfA == size(A,2)
        X = X;
    elseif RankOfA ~= size(A,2) && size(Y,2) == 1
        X = pinv(A)*Y;
    end  
else    
    X = [];
end


end
  
 


function [B]=swap(A,i,ii)
%This function swaps row i with ii 
if isempty(A)==0
    B=repmat(A,1);
    B(i,:)=A(ii,:);
    B(ii,:)=A(i,:);
else
    B=[];
end

end

