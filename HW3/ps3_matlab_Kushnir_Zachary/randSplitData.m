function [X_train,y_train,X_test,y_test]=randSplitData (X_data, y, percent_train)
   
    idx=randi([1,size(X_data,1)],1,size(X_data,1));
    m=round(size(X_data,1)*percent_train/100);
    X_train=X_data(idx(1:m),:);
    y_train=y(idx(1:m),:);
    X_test=X_data(idx(m+1:end),:);
    y_test=y(idx(m+1:end),:);

end