function [out] = myNorm(A)
%Takes as input a vector or matrix A and returns its L2 norm
summer = 0;
for i = 1:numel(A)
    summer = summer + A(i).^2;
end

out = sqrt(summer);

end

