function finalx=main_LinearCML(DataCube,RGBimage)
[rows,columns,channels]=size(DataCube);
pixel=rows*columns;
%%%%%%%%%%%%%%%%%%
% index=1:step:pixel;
step=5;
input_i=1:step:rows;
input_j=1:step:columns;
[RowIndex,ColumnIndex]=meshgrid(input_i,input_j);
input_i=RowIndex(:);
input_j=ColumnIndex(:);
index=(input_j-1)*rows+input_i;
C=sparse(index,index,ones(1,length(input_j)),pixel,pixel);
%%%%%%%%%%%%%%%%

DataCube=double(DataCube);
DataCubeTemp1=DataCube;
for i=1:channels
    temp=DataCubeTemp1(:,:,i);
    DataCubeTemp1(:,:,i)=DataCubeTemp1(:,:,i)/max(temp(:));
end
DataCubeMatrix=reshape(DataCubeTemp1,[rows*columns,channels]);
Wx=calculateW(DataCubeMatrix);
finalx=hypertest_linear(DataCubeTemp1,RGBimage,C,Wx);