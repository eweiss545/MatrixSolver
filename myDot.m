function [dot] = myDot(v1,v2)
%myDot returns the dot product of v1 and v2.
[r1 c1]=size(v1);
[r2 c2]=size(v2);
sum=0;
if r1~=r2 || c1~=c2
    dot=[];
else
   for i=1:numel(v1)
       sum=sum+v1(i)*v2(i);
   end
   dot=sum;
end
    



end

