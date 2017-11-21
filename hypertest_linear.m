function finalx=hypertest_linear(hyperimage,RGBimage,Correspondence,Wx)
x=hyperimage;
x=double(x);
% x=x/255;
[rows, columns, channels]=size(x);
pixelX=rows*columns;
x=reshape(x, [pixelX, channels]);

Lx=diag(sum(Wx,1))-Wx;
x=x';

R=RGBimage;
[rowsR, columnsR, channelsR]=size(R);
pixelR=rowsR*columnsR;
R=reshape(R, [pixelR, channelsR]);
R=R';

R=double(R);
%R=R/255;

%% find the best F
C=Correspondence;

D1=diag(sum(C,2));

A=x*Lx*x';

B=x*D1*x';

CC=x*C*R';

% alpha=50;
% cn=nnz(C);
% alpha=2000;
% k=5;
alpha=k*pixelX/cn;

left=2*A+B*alpha;
right=CC*alpha;

%F=B\CC;
%F=inv(B)*CC;
%F=inv(left)*right;
F=left\right;
%% display results

finalx=F'*x;
finalx=finalx';
finalx=reshape(finalx,[rows,columns,channelsR]);
end