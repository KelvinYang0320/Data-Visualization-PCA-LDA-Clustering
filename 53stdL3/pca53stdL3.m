%
% Script file: pca8OX.m
% Principal Component Projection for data8OX.txt
%
fin=fopen('53stdL3.txt','r');
d=10+1; N=48;                        % d features, N patterns
fgetl(fin); fgetl(fin); fgetl(fin);  % skip 3 header lines
A=fscanf(fin,'%f',[d N]);  A=A';     % read input data 
X=A(:,1:d-1);                        % remove the label in the last column
k=2;  Y=PCA(X,k);                   % better Matlab code
X1=Y(1:16,1); Y1=Y(1:16,2); 
X2=Y(17:32,1); Y2=Y(17:32,2);
X3=Y(33:48,1); Y3=Y(33:48,2);
plot(X1,Y1,'d',X2,Y2,'O', X3,Y3,'x','markersize',12);  
% axis([4 24 -2 18]);
legend('D04','D06','D15')
title('First Two Principal Component Projection for 53stdL3 Data')