function [J, grad] = costFunction(theta, X_train, y_train)
    m=size(X_train,1);
    grad=zeros(length(theta),1);
    J=0;
    for(i=1:m)
       h=sigmoid(X_train(i,:)*theta);
       J=J-y_train(i)*log(h)-(1-y_train(i))*log(1-h); 
    end
    J=(1/m)*J;
    for(j=1:length(grad))
        sum=0;
       for(i=1:m)
           h=sigmoid(X_train(i,:)*theta);
           sum=sum+(h-y_train(i))*X_train(i,j);
       end
       grad(j)=(1/m)*sum;
    end
end