%HW 3
clc;clear;

%Problem 1

data=load('input/hw3_data1.txt');
%part a
X=[ones(size(data,1),1) data(:,1:2)];
y=[data(:,3)];
sizeOfX = size(X)
sizeOfy = size(y)
%part b
figure;
gscatter(X(:,2),X(:,3),y(:,1),'br','xo')
xlabel('Exam 1 Score');
ylabel('Exam 2 Score');
legend('Not Admitted','Admitted');
%part c
m=round(size(X,1)*.9);
[X_train,y_train,X_test,y_test]=randSplitData(X,y,90);
%part d
figure;
z=[-15:15];
gz=sigmoid(z);
plot(z,gz);
xlabel('z');
ylabel('g(z)');
%part e
X=[1,1,0;1,1,3;1,3,1;1,3,4];
y=[0;1;0;1];
theta=[2,0,0]';
X(1,:)*theta;
[J,grad]=costFunction(theta,X,y);
J=J
%Part f
initialTheta=[0,0,0]';
%set options for fminunc
options = optimset('GradObj','on','MaxIter',400);

%Run fminunc to obtain the optimal theta
%This function will return theta and the cost
[theta, cost] = fminunc(@(t)(costFunction(t,X_train,y_train)),initialTheta,options);
theta
cost
%Part g
figure;
gscatter(X_train(:,2),X_train(:,3),y_train(:,1),'br','xo')
xlabel('Exam 1 Score');
ylabel('Exam 2 Score');
legend(["Not Admitted","Admitted"],'autoUpdate','off');
hold on
xh=0:.001:100;
h=(-theta(1)-theta(2)*xh)/theta(3);
plot(xh,h);
ylim([30 100]);
%Part h
y_pred=zeros(length(y_test),1);
for(i=1:length(y_pred))
   if(sigmoid(X_test(i,:)*theta)>.5)
       y_pred(i)=1;
   else
       y_pred(i)=0;
   end
end
accuracy=calcAcuracy(y_pred,y_test)
%Part i
X_new=[1,70,55];
probability= sigmoid(X_new*theta)
if(sigmoid(X_new*theta)>.5)
    decision=1
else
    decision=0
end
%Part j **BONUS**


%*************************************************
%Probelm 2

%Part a
data=load('input/hw3_data2.csv');
X=[ones(size(data,1),1) data(:,1) data(:,1).^2];
y=[data(:,2)];
theta=pinv(X'*X)*X'*y
xm=500:.001:1000;
hs=theta(1)+theta(2)*xm+theta(3)*(xm.^2);
figure;
plot(X(:,2),y,'ro');
hold on,
plot(xm,hs,'b');
legend('training data','fitted model');
ylabel('profit');
xlabel('population in thousands, n');