function ypredict = logReg_multi(X_train,y_train,X_test)
%determine number of classes
num_class=max(y_train);
%loop through all classes
for(c=1:num_class)
    %new y_train with binary corresponding to class
    y_train_new=y_train;
    for(i=1:length(y_train))
        if(y_train(i)~=c)
            y_train_new(i)=0;
        end
    end
    %get model
    mdl=fitclinear(X_train,y_train_new,'learner','logistic');
    [~,proba] = predict(mdl,X_test);
    %extract positive probability for class 
    num(:,c)=proba(:,2);
end
%predict class by detrmining max probability (corresp index = class)
for(i=1:size(X_test,1))
    [M,I]=max(num(i,:));
    ypredict(i,1)=I;
end
end