function [out] = myIsSymmetric(M)
%Takes as input a matrix M and returns True(1) if it's symmetric
%and False(0) otherwise
out = isequal(M,myTranspose(M));
end

