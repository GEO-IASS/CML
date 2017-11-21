clear;
clc;
 HSIName={'D04','G03','DC','PaviaU','Moffett'};
 RGBName={'registered_D04.bmp','registered_G03.bmp','registered_DC.bmp','registered_PaviaU.bmp','registered_Moffett.bmp'};
methodName={'main_LinearCML','main_NonlinearCML','main_ManifoldAlignment'};

for j=1:length(methodName)
    time=[];
    for i=1:length(HSIName)
       start=tic;
       eval(strcat('load data/',HSIName{i}));
       RGBstr=strcat('data/',RGBName{i});
       RGBImg=imread(RGBstr);
       func=str2func(methodName{j});
       DataCube=DataCube(:,1:256,:);
       DataCube=imresize(DataCube,0.3);
       RGBImg=imresize(RGBImg,0.3);
       func(DataCube,RGBImg);
       elapseTime=toc(start);   
        writelog(HSIName{i},methodName{j},elapseTime);
        time=[time,elapseTime];
    end
%      writelog('Mean',methodName{j},mean(time));
end