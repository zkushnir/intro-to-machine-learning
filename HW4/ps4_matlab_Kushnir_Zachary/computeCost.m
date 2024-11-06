function J = computeCost(X, y, theta)
    sum=0;
    h=0;
    for(i=1:size(y,1))
        h=X(i,:)*theta;
        sum=sum+(h-y(i,:))^2;
    end
    J=1/(2*size(y,1))*(sum);
end