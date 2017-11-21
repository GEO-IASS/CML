function finalx=main_NonlinearCML(DataCube,RGBimage)
[rows,columns,channels]=size(DataCube);
pixel=rows*columns;
DataCube=double(DataCube);
DataCubeTemp1=DataCube;
for i=1:channels
    temp=DataCubeTemp1(:,:,i);
    DataCubeTemp1(:,:,i)=DataCubeTemp1(:,:,i)/max(temp(:));
end
DataCubeMatrix=reshape(DataCubeTemp1,[rows*columns,channels]);
Wx=calculateW(DataCubeMatrix);
%%%%%%%%%%%%%%%%%%
input_i=1:10:rows;
input_j=1:10:columns;
[RowIndex,ColumnIndex]=meshgrid(input_i,input_j);
input_i=RowIndex(:);
input_j=ColumnIndex(:);
index=(input_j-1)*rows+input_i;
C=sparse(index,index,ones(1,length(input_j)),pixel,pixel);
%%%%%%%%%%%%%%%%

finalx=hypertest_nonlinear(DataCube,RGBimage,C,Wx);