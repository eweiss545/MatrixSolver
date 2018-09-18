function [B]=swap(A,i,ii)
%This function swaps row i with ii 
B=repmat(A,1);
B(i,:)=A(ii,:);
B(ii,:)=A(i,:);

end