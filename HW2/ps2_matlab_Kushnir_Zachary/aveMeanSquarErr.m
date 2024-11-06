function [error] = aveMeanSquarErr(val1, val2)
    error=0;
    for(i=1:size(val1))
        error=error+(val1(i)-val2(i))^2;
    end
    error=1/(2*size(val1,1))*error;

end