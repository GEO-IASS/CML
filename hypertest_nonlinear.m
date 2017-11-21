function finalx=hypertest_nonlinear(hyperimage,RGBimage,Correspondence,Wx)
x=hyperimage;
x=double(x);
[rows, columns, ~]=size(x);

Lx=diag(sum(Wx,1))-Wx;

R=RGBimage;
[rowsR, columnsR, channelsR]=size(R);
pixelR=rowsR*columnsR;
R=reshape(R, [pixelR, channelsR]);
R=double(R);

D1=diag(sum(Correspondence,2));


alpha=pixelR/sum(C(:));
left=2*Lx+alpha*D1;
%left=alpha*D1;

right=Correspondence*R*alpha;

x_new=left\right;

%% display results

finalx=x_new;
finalx=reshape(finalx,[rows,columns,channelsR]);
