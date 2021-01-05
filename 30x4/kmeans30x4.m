d=4;  n=30;
fin=fopen('data30x4.txt');
fgetl(fin);   fgetl(fin);   fgetl(fin);   %skip 3 lines
A=fscanf(fin,'%f', [d+1, n]);
A=A';    X=A(:,1:d);
[idx, C] = kmeans(X,2)
