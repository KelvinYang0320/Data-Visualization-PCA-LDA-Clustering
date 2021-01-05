fin=fopen('53stdL3.txt','r');
d=10+1; N=48;                         % d features, N patterns
fgetl(fin); fgetl(fin); fgetl(fin);   % skip 3 lines
A=fscanf(fin,'%f',[d N]); A=A'; % read data 
X=A(:,1:d-1);                           % remove the last columns
k=3;  Y=PCA(X,k)                  % better Matlab code
X1=Y(1:16,1);
Y1=Y(1:16,2);
Z1=Y(1:16,3);
X2=Y(17:32,1); Y2=Y(17:32,2); Z2=Y(17:32,3);
X3=Y(33:48,1); Y3=Y(33:48,2); Z3=Y(33:48,3);
plot3(X1,Y1,Z1,'d',X2,Y2,Z2,'O',X3,Y3,Z3,'x', 'markersize',12); grid 
legend('D04','D06','D15')
title('First Three  Principal Component Projection for 53stdL3 Data')
