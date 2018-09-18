function [out] = myNormalize(A)
%Takes as input a vector or a matrix and returns its normalized
% version
temp = repmat(A,1);
N=myNorm(A);
if N==0
    out=[];
else
    for i = 1:numel(A)
        x=temp(i);
        if N == 0
            temp(i) = 0;
        else
            temp(i) = x / N;
        end
    end
    out = temp;
end

end

