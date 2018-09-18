function [w] = myWeatherReport(s,M,v,n)
%This function takes in state name vector s, TPM M, state
% vector v, and the number of days in the future n. It prints
% out a forecast as it were a weatherperson on TV.
indx = find(v==1,1);
state = s(indx);
for k=1:n
        v = M*v;
end 

w = v;
end

