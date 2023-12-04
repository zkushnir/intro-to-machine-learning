function [B] = sum_sq_ROW(A)
for(i=1:size(A,2))
    B(i)=0;
   for(x=1:size(A,1))
       B(i)=B(i)+A(x,i)^2;
   end
end
end
