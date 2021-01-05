fin=fopen('data8OX.txt','r');
d=8+1; N=45;                          % d features, N patterns
fgetl(fin); fgetl(fin); fgetl(fin);   % skip 3 lines
A=fscanf(fin,'%f',[d N]); A=A'; % read data 
X=A(:,1:d-1);                           % remove the last columns
k=3;  Y=PCA(X,k)                  % better Matlab code
X1=Y(1:15,1);
Y1=Y(1:15,2);
Z1=Y(1:15,3);
X2=Y(16:30,1); Y2=Y(16:30,2); Z2=Y(16:30,3);
X3=Y(31:45,1); Y3=Y(31:45,2); Z3=Y(31:45,3);
plot3(X1,Y1,Z1,'d',X2,Y2,Z2,'O',X3,Y3,Z3,'X', 'markersize',12); grid 
axis([4 24, -2 18, -13,0]);
legend('8','O','X')
title('First Three  Principal Component Projection for 8OX Data')
