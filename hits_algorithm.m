function [x,y,time,numiter]=hits_algorithm(L,x0,n,epsilon)
k=0;
residual=1;
x=x0;
tic;
while (residual >= epsilon)
    prevx=x;
    k=k+1;
    x=x*L';
    x=x*L;
    x=x/sum (x) ;
    residual=norm(x-prevx,1) ;
end
y=x*L' ;
y=y / sum (y) ;
numiter=k;
time=toc;
end

