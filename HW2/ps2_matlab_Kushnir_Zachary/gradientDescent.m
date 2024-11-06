function [theta, cost] = gradientDescent (X_train, y_train, alpha, iters)
    m=size(X_train,1);
    theta=rand(size(X_train,2),1);
    cost=zeros(iters,1);
    for(i=1:iters)
        cost(i)=computeCost(X_train,y_train,theta);
        for(x=1:size(theta))
            sum=0;
            h=0;
            for(y=1:size(X_train,1))
                h=X_train(y,:)*theta;
                sum=sum+(h-y_train(y))*X_train(y,x);
            end
            theta(x)= theta(x)-alpha/m*sum;
        end
    end
end