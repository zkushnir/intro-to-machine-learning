clc;clear;
%HW2

%Probelm 1

X1 = [1,0;1,2;1,3;1,4];
X=[0;2;3;4];
y = [4;8;10;12];
theta1 = [0, 0.5]';
theta2 = [1, 1]';
X1(1,:)*theta1;
%computes cost with function for theta 1
computeCost(X1,y,theta1);
%computes cost by hand for theta 1
cost1=1/(2*4)*((0*.5-4)^2+(2*.5-8)^2+(3*.5-10)^2+(4*.5-12)^2)
%computes cost with function for theta 2
computeCost(X1,y,theta2);
%computes cost by hand for theta 2
cost2=1/(2*4)*((1+0*1-4)^2+(1+2*1-8)^2+(1+3*1-10)^2+(1+4*1-12)^2)

%Problem 2
alpha=.001;
iters=15;
%calls function with previously defined x,y.alpha, and iterations
[theta cost]=gradientDescent(X1,y,alpha,iters);
theta
cost(15)

%CHECK***************************************
%evenly distributed x values to plot model
% x=0:.001:5;
%coresponding h values from model parameters
% h=theta(1)+theta(2)*x;
%Plots data points and model for visual check
% plot(X,y,'x');
% hold on;
% plot(x,h);

%Problem 3
%theta calculated wih normal equation 
theta = normalEqn(X1,y)

%CHECK***************************************
%x and h calculated using theta from eqn to plot and check model
% x=0:.001:5;
% h=theta(1)+theta(2)*x;
% hold on;
% plot(x,h);

%Problem 4
%loads data
data=load('input/hw2_data1.csv');
plot(data(:,1),data(:,2),'rx');
xlabel('Horse power of a car in 100s');
ylabel('Price in $1,000s');
%extracts feature vector and adds X0
X=[ones(size(data,1),1) data(:,1)];
%extracts label vector
y=data(:,2);
%size of X and y
size(X)
size(y)
%90 percent of data for training data
ntrain=round(size(X,1)*.9);
X_train=X(1:ntrain,:);
y_train=y(1:ntrain,:);
X_test=X(ntrain+1:size(X,1),:);
y_test=y(ntrain+1:size(X,1),:);
%size of training data and training labels
size(X_train);
size(X_test);
%calculate theta with gradient descent
alpha=.3;
iters=500;
[theta cost]=gradientDescent(X_train,y_train,alpha,iters);
theta
%x and h to plot model line
x=0:.001:3;
h=theta(1)+theta(2)*x;
it=1:1:iters;
%Plots cost vs iterations
figure;
plot(it,cost);
xlabel('Iteration #');
ylabel('Cost');
%Plots training data and model
figure;
plot(X_train(:,2),y_train,'rx');
hold on;
plot(x,h,'b');
ylim([5 50]);
legend('data points','model');
xlabel('Horse power of a car in 100s');
ylabel('Price in $1,000s');
X_test;
y_pred=X_test*theta;
%error from y values from gradient descent
err=aveMeanSquarErr(y_test,y_pred)

%CHECK***************************************
%plots predicted y values to check visually
% hold on;
% plot(X_test(:,2),y_pred,'gx')
% hold on;
% plot(X_test(:,2),y_test,'yx');

%calculates theta using normal eqn
thetanorm=normalEqn(X_train,y_train);
%y calculated with normal eqn 
y_pred2=X_test*thetanorm;
%error from y values by normal equation
err=aveMeanSquarErr(y_test,y_pred2)
a=[.001, .003, .03, 3];
iters=300;
it=1:1:iters;
[theta cost]=gradientDescent(X_train,y_train,a(1),iters);
figure;
plot(it,cost);
legend('a=.001');
xlabel('Iteration #');
ylabel('Cost');
[theta cost]=gradientDescent(X_train,y_train,a(2),iters);
figure;
plot(it,cost);
legend('a=.003');
xlabel('Iteration #');
ylabel('Cost');
[theta cost]=gradientDescent(X_train,y_train,a(3),iters);
figure;
plot(it,cost);
legend('a=.03');
xlabel('Iteration #');
ylabel('Cost');
[theta cost]=gradientDescent(X_train,y_train,a(4),iters);
figure;
plot(it,cost);
legend('a=3');
xlabel('Iteration #');
ylabel('Cost');

%Problem 5
data=load('input/hw2_data2.txt');
X=[ones(size(data,1),1) data(:,1:2)];
y=[data(:,3)];
means=[mean(X(:,2)) mean(X(:,3))]
stds=[std(X(:,2)) std(X(:,3))]
for(i=1:size(X,1))
    X(i,2)=(X(i,2)-means(1))/stds(1);
    X(i,3)=(X(i,3)-means(2))/stds(2);
end
size(X);
size(y);

a=.01;
iters=750;
it=1:1:iters;
[theta cost]=gradientDescent(X,y,a,iters);
theta
%plot for cost vs iteration
figure;
plot(it,cost);
legend('a=.01');
xlabel('Iteration #');
ylabel('Cost');

xnew=[1 1080 2];
xnew(2)=(xnew(2)-means(1))/stds(1);
xnew(3)=(xnew(3)-means(2))/stds(2);
ypred=xnew*theta

%CHECK******************************************
%x and y plotted with model 
hx=[ones(1,100); linspace(min(X(:,2)),max(X(:,2))); linspace(min(X(:,3)),max(X(:,3)))]';
hy=hx*theta;
% figure;
% plot(X(:,2),y,'rx')
% hold on;
% plot(hx(:,2),hy,'b')
% hold on;
% plot(xnew(:,2),ypred,'gx')
