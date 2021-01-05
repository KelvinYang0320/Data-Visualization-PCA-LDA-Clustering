d=8;  n=45;
fin=fopen('data8OX.txt');
fgetl(fin);   fgetl(fin);   fgetl(fin);   %skip 3 lines
A=fscanf(fin,'%f', [d+1, n]);
A=A';    X=A(:,1:d);
[idx, C] = kmeans(X,3)
