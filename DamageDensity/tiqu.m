function [areacount,MajorAxis,MinorAxis,BW_seg,geshu,fuhe,stats]=tiqu(image_in)
%%��ͼ�����ʶ��
[L_BW,NUM]=bwlabel(image_in,4);%�����ͨ����
[m,n]=size(L_BW);%��¼ͼ��ߴ�
BW_seg=double(zeros(m,n));%����ͬ����С��0����
stats=regionprops(L_BW,'all');
fuhe=[];
areacount=[];
MajorAxis=[];
MinorAxis=[];

for k=1:NUM
    S(k)=stats(k).Area; %ͼ����������������ܸ���
    MajorAxisLength(k)=stats(k).MajorAxisLength;%�����������ͬ��׼�������ľص���Բ�ĳ��᳤�ȣ����������£�
    MinorAxisLength(k)=stats(k).MinorAxisLength;%�����������ͬ��׼�������ľص���Բ�Ķ��᳤�ȣ����������£�
    bizhi(k)=MajorAxisLength(k)/MinorAxisLength(k);%����������ֵ
    mouge=stats(k).BoundingBox;%������Ӧ�������С����
   
    width=size(stats(k).Image,1);%stats(k).Image��K���������ͬ��С���߼�����
    height=size(stats(k).Image,2);%��ȡ��k��ͼ��ĳ��Ϳ�
    bbb=sum(sum(stats(k).Image(floor(width/2)+1:width,floor(height/2)+1:height)));
    %floor(x):������x ���������
    

            if  S(k)>700 && bizhi(k)<4 %&& S(k)<90000
             
                  fuhe=[fuhe,k];
                  areacount=[areacount,S(k)];
                  MajorAxis=[MajorAxis,MajorAxisLength(k)];
                  MinorAxis=[MinorAxis,MinorAxisLength(k)];
                  
                 
%                       for h=1:m
%                         for j=1:n
%                             if(L_BW(h,j)==k)
%                                 BW_seg(h,j)=L_BW(h,j);
%                             end
%                         end
%                       end

            end
end

geshu=length(fuhe);
disp('-------------------------------')
disp('The number of defects��')
disp(geshu)
disp('-------------------------------')
disp('The area of defects��')
disp(areacount)
disp('-------------------------------')
disp('The length of defects��')
disp(MajorAxis)
disp('-------------------------------')
disp('The width of defects��') 
disp(MinorAxis)
disp('-------------------------------')
