fin=fopen('data30x4.txt','r');
d=4+1; N=30;                         % d features, N patterns
fgetl(fin); fgetl(fin); fgetl(fin);   % skip 3 lines
A=fscanf(fin,'%f',[d N]); A=A'; % read data 
X=A(:,1:d-1);                           % remove the last columns
k=3;  Y=PCA(X,k)                  % better Matlab code
X1=Y(1:15,1);
Y1=Y(1:15,2);
Z1=Y(1:15,3);
X2=Y(16:30,1); Y2=Y(16:30,2); Z2=Y(16:30,3);
plot3(X1,Y1,Z1,'d',X2,Y2,Z2,'O', 'markersize',12); grid 
legend('u1','u2')
title('First Three  Principal Component Projection for 30x4 Data')
