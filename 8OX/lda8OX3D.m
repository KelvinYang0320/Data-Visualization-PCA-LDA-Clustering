% lda8OX2D.m - Linear Discriminant Projection for data8OX.txt
%
fin=fopen('data8OX.txt');
nf=8;     n=45;                       % nf features, n patterns
L(1)=15;  L(2)=30;  L(3)=45;          % L(3)=n
fgetl(fin); fgetl(fin); fgetl(fin);   % skip 3 header lines
A=fscanf(fin,'%f',[1+nf n]); A=A';    % read input data 
d=8;  nk=15;  X=A(:,1:d);
%
% (a) - Covariance Matrix T,  [n d]=size(X);  n=45,  d=8
%
X1=X(1:L(1),:);  X2=X(1+L(1):L(2),:);  X3=X(1+L(2):L(3),:);
m1=mean(X1);    m2=mean(X2);    m3=mean(X3);
mu=mean(X);     T=cov(X);
W1=cov(X1);     W2=cov(X2);     W3=cov(X3); 
W=(nk-1)*(W1+W2+W3);
B=nk*((m1-mu)'*(m1-mu)+(m2-mu)'*(m2-mu)+(m3-mu)'*(m3-mu));
s=0.0001;
C=(inv(W+s*eye(d)))*(B+eps);
%
% (b) - Compute Eigenvalues of W^{-1}B
%
[U D]=eig(C);
Lambda=diag(D);
[Cat index]=sort(Lambda,'descend');
%
% (c) - Compute Percentage of Variance Retained
%
R(1)=Cat(1);
for i=2:d
  R(i)=R(i-1)+Cat(i);
end
S=R(d);
for i=1:d
  R(i)=R(i)/S*100;
end
format short
L',R
%
% (d) - LDA for 8OX data set
%
K=3;
Xproj=zeros(K,d);                     % initiate a projection matrix
for i=1:K
   Xproj(i,:)=U(:,index(i))';
end
Y=(Xproj*X')';                        % first K discriminant components
X1=Y(1:L(1),1);      Y1=Y(1:L(1),2); Z1=Y(1:L(1),3);
X2=Y(1+L(1):L(2),1); Y2=Y(1+L(1):L(2),2); Z2=Y(1+L(1):L(2),3); 
X3=Y(1+L(2):L(3),1); Y3=Y(1+L(2):L(3),2); Z3=Y(1+L(2):L(3),3);
plot3(X1,Y1,Z1,'d',X2,Y2,Z2,'O',X3,Y3,Z3,'X', 'markersize',12); grid ;
legend('- 8','- O','- X')
% axis([2 24 -2 20]); grid;
title('First Three Linear Discriminant Projection for data8OX')