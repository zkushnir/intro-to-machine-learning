%HW1

clc;
clear;
rng(0,'twister');
%Prob3a
x=.6.*randn(1000000,1)+1.5; %generates million by one vector of random variables from normal distribution with mean of 1.5 and std of .6
std(x);
%Prob3b
z=4*rand(1000000,1)-1; %generates million by one vector of random numbers from uniform distribution from -1 to 3
%Prob3c
% figure;
% hist(x); %histogram for x
% figure;
% hist(z); %histogram for z
%Prob3d
xnew=zeros(1000000,1);
tic
for(i=1:size(x))
    xnew(i)=x(i)+1; %adds 1 to every value in x with loop
end
toc %count time for the loop
%Prob3e
tic
xnew2=x+1; %adds 1 to every value in x without loop
toc %count for above operation
%Prob3f
ycount=1;
for(i=1:size(z))
   if(z(i)>=0&&z(i)<1.5)
       y(ycount)=z(i);
       ycount=ycount+1;
   end
end
ycount
%Prob4a
A=[2,1,3;2,6,8;,6,8,18] %initialize A
min(A,[],1) %min in each col
max(A,[],2) %max in each row
min(A,[],'all') %min val in A
sum(A,2) %sum of each row 
sum(A,'all') %sum of all vals in A
B=A.^2 %initialize B as square of A values
%Prob4b
b=[1;3;5];
xyz=inv(A)*b %solving system of equations for x, y, and z
%Prob4c
x1=[.5,0,-1.5];
x2=[1,-1,0];
L1norm=abs(x1(1))+abs(x1(2))+abs(x1(3)) %L1 norm hand calculated for x1
L2norm=sqrt(x1(1)^2+x1(2)^2+x1(3)^2) %L2 norm hand calculated for x1
L1norm=abs(x2(1))+abs(x2(2))+abs(x2(3)) %L1 norm hand calculated for x2
L2norm=sqrt(x2(1)^2+x2(2)^2+x2(3)^2) %L2 norm hand calculated for x2
norm(x1,1) %L1 norm for x1
norm(x1,2) %L2 norm for x1
norm(x2,1) %L1 norm for x2
norm(x2,2) %L2 norm for x2
%Prob5
A
sum_sq_ROW(A) %calling function with input of A
b
sum_sq_ROW(b) %calling function with input of b