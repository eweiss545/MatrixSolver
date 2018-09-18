function [nullspace]=myNull(A)
%This function returns the nullspace Space of A
[X RREF D]=myGJSolver(A,[]);

B = RREF(:,:);
[row col] = size(B);
I = [];
U = [];
nullspace = [];


for i = 1:col
    target = B(:,i);
    [a b] = find(B(:,i)==1,1);
     b=b+(i-1);
    if isempty([a b])==0
        zerorow=B(a,1:b-1);
         %Seeing if they're zero
         if myNorm(zerorow)==0
        I = [I target];
         else
        U = [U target];
         end
    else
        U = [U target];
    end
end


if row == col
    [r c] = size(U);
    for i = 1:c
        mat = U(:,i);
        for j = 1:size(mat,1)
            if mat(j,1) > 0
                nullspace(j,i) = -mat(j,1);
            elseif mat(j,1) < 0
                nullspace(j,i) = -1*mat(j,1);
            else
                if mat == B(:,j)
                    nullspace(j,i) = 1;
                else
                    nullspace(j,i) = 0;
                end
            end
        end
    end
            
elseif row<col
    [r c] = size(U);
    zero_dif_U = col - row;
    zero_dif_B = col - row;
    zeros_U = zeros(zero_dif_U,c);
    zeros_B = zeros(zero_dif_B,col);
    U = [U; zeros_U];
    B = [B; zeros_B];
    [r c] = size(U);
    for i = 1:c
        mat = U(:,i);
        for j = 1:size(mat,1)
            if mat(j,1) > 0
                nullspace(j,i) = -mat(j,1);
            elseif mat(j,1) < 0
                nullspace(j,i) = -1*mat(j,1);
            else
                if mat == B(:,j)
                    nullspace(j,i) = 1;
                else
                    nullspace(j,i) = 0;
                end
            end
        end
    end
                 
end
                

end

