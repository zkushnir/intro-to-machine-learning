function [theta] = Reg_normal_eqn(X_train,y_train,lambda)
    [m n] =size(X_train);
    D=eye(n,n);
    D(1,1)=0;
    theta=(pinv(X_train'*X_train+(lambda*D)))*X_train'*y_train;
end
