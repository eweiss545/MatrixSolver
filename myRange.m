function [out] = myRange(A)
%This function takes a matrix A and returns a matrix of linearly
%independent column vectors that span the range of A

[X RREF D]=myGJSolver(A,[]);
[row col]=size(A);

B = [1];
out=[];
for i=1:col
     [a b] = find(RREF(:,i)==1,1);
     b=b+(i-1);
     if isempty([a b])==0
         %Looking at values before pivot
         zerorow=RREF(a,1:b-1);
         %Seeing if they're zero
         if myNorm(zerorow)==0
             out = [out A(:,i)]; %% is this supposed to be RREF or A?
         end
     end
  
end


end

