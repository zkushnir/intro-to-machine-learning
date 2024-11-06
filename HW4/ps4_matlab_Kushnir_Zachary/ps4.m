%HW 4
clc;clear all;
%Problem 1

%Part a
%function Reg_normal_eqn made

%Part b
load('input/hw4_data1.mat');
X_data=[ones(size(X_data,1),1) X_data];
%output size of data
data_size=size(X_data)

%Part c
train_error=zeros(20,8);
test_error=zeros(20,8);
lambda = [0 0.001 0.003 0.005 0.007 0.009 0.012 0.017];
%function radSplitData created to randomly split data with given percentage
for(i=1:20)
    [X_train,y_train,X_test,y_test]=randSplitData(X_data,y,88);
    for(l=1:8)
        theta=Reg_normal_eqn(X_train,y_train,lambda(l));
        train_error(i,l)=computeCost(X_train,y_train,theta);
        test_error(i,l)=computeCost(X_test,y_test,theta);
    end
end
train_error_average=mean(train_error);
test_error_average=mean(test_error);
figure;
plot(lambda,train_error_average,'-bo',lambda,test_error_average,'-r+');
legend('Training Error','Testing Error');
xlabel('lambda');
ylabel('Average Error');
%find min of difference between costs and index of min
[M,I]=min(abs(test_error_average-train_error_average));
%find lambda correspoding to min error 
lambda(I)

%Problem 2
load('input/hw4_data2.mat');

%Part a
K=1:2:15;
acc=zeros(1,length(K));

%first classifier data
X_train1=[X1;X2;X3;X4];
y_train1=[y1;y2;y3;y4];
X_test1=X5;
y_test1=y5;

%second classifier data
X_train2=[X1;X2;X3;X5];
y_train2=[y1;y2;y3;y5];
X_test2=X4;
y_test2=y4;

%third classifier data
X_train3=[X1;X2;X4;X5];
y_train3=[y1;y2;y4;y5];
X_test3=X3;
y_test3=y3;

%fourth classifier data
X_train4=[X1;X3;X4;X5];
y_train4=[y1;y3;y4;y5];
X_test4=X2;
y_test4=y2;

%fifth classifier data
X_train5=[X2;X3;X4;X5];
y_train5=[y2;y3;y4;y5];
X_test5=X1;
y_test5=y1;


for(k=1:length(K))
    av_acc=0;
    mdl=fitcknn(X_train1,y_train1,'NumNeighbors',K(k));
    ypred=predict(mdl,X_test1);
    correct=0;
    for(i=1:length(ypred))
        if(ypred(i,1)== y_test1(i,1))
            correct=correct+1; 
        end
    end
    av_acc=av_acc+correct/length(y_test1);
    mdl=fitcknn(X_train2,y_train2,'NumNeighbors',K(k));
    ypred=predict(mdl,X_test2);
    correct=0;
    for(i=1:length(ypred))
        if(ypred(i,1)== y_test2(i,1))
             correct=correct+1; 
        end
    end
    av_acc=av_acc+correct/length(y_test2);
    mdl=fitcknn(X_train3,y_train3,'NumNeighbors',K(k));
    ypred=predict(mdl,X_test3);
    correct=0;
    for(i=1:length(ypred))
        if(ypred(i,1)== y_test3(i,1))
            correct=correct+1; 
        end
    end
    av_acc=av_acc+correct/length(y_test3);
    %4
    mdl=fitcknn(X_train4,y_train4,'NumNeighbors',K(k));
    ypred=predict(mdl,X_test4);
    correct=0;
    for(i=1:length(ypred))
        if(ypred(i,1)== y_test4(i,1))
            correct=correct+1; 
        end
    end
    av_acc=av_acc+correct/length(y_test4);
    mdl=fitcknn(X_train5,y_train5,'NumNeighbors',K(k));
    ypred=predict(mdl,X_test5);
    correct=0;
    for(i=1:length(ypred))
        if(ypred(i,1)== y_test5(i,1))
         correct=correct+1; 
        end
    end
    av_acc=av_acc+correct/length(y_test5);
    acc(k)=av_acc/5;
end
figure;
plot(K,acc)
xlabel('K');
ylabel('Average Accuracy');

%Problem 3
clear all;
%Part a
%created logReg_multi function

%Part b
load('input/hw4_data3.mat');
X_train=[ones(size(X_train,1),1) X_train];
X_test=[ones(size(X_test,1),1) X_test];

%predict from test data
y_pred=logReg_multi(X_train,y_train,X_test);
accuracy=0;
for(i=1:length(y_pred))
    if(y_pred(i)==y_test(i))
       accuracy=accuracy+1; 
    end
end
test_accuracy=accuracy/length(y_pred)

%predict with training data
y_pred=logReg_multi(X_train,y_train,X_train);
accuracy=0;
for(i=1:length(y_pred))
    if(y_pred(i)==y_train(i))
       accuracy=accuracy+1; 
    end
end
train_accuracy=accuracy/length(y_pred)