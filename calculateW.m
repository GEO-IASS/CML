function W=calculateW(x,k)
if nargin<2
    k=5;
end
[pixelX,channels]=size(x);
    disttype='euclidean';
 [IDX, D]=knnsearch(x,x,'dist',disttype,'K',k);
sigma=1;
D=exp(-D/sigma);

IDX2=zeros(size(IDX));
for i=1:pixelX
    IDX2(i,:)=i;
end
W=sparse(IDX2(:),IDX(:),D(:),pixelX,pixelX);
W=W+W';
W(1:pixelX+1:end)=0;
W(W>1)=W(W>1)/2;
end