%% This code mainly calculates the damage density
%% crop the ROI
[m, n, z] = size(I1);
figure(1),imshow(I1);
h=imrect;%use mouse get the ROI
pos=getPosition(h);%get the position,
I1 = imcrop( I1, pos );
%figure(1),imshow(I1);
%imwrite(I1,[pathname,dirc,'/original_',file_name]);
%% get the location of the eage of defects
K1=histeq(I1);
%imwrite(K1,[pathname,dirc,'/preprocess_',file_name]);
% K1=rgb2gray(K1);
%%
%level = graythresh(K1);
level=200/255;
%%
BW = im2bw(K1,level);
%se=strel('square',10);
%se1=strel('square',10);
%BW=imdilate(BW,se);
%BW=imerode(BW,se1);
figure(2),imshow(BW);
%imwrite(BW,[pathname,dirc,'/bw_',file_name]);
[GX0,GY0]=gradient(BW);
G0=sqrt(GX0.*GX0+GY0.*GY0);
%imwrite(G0,[pathname,dirc,'/edge_',file_name]);
figure(3),imshow(G0);
%% calculate the gradient
[areacount,MajorAxis,MinorAxis,BW_seg,geshu,fuhe,stats]=tiqu(BW);

x=find(G0~=0);
I1=rgb2gray(I1);
A=double(I1);
[GX,GY]=gradient(A);
G=sqrt(GX.*GX+GY.*GY);
mean_gradient=mean(G);

mean_gradient1=mean(G(x));% get the mean gradient
sum_gradient=sum(G(x));
figure(4),imshow(G);
%imwrite(G,[pathname,dirc,'/Gradientoriginal_',file_name]);
G1=mat2gray(G);
%imwrite(G1,[pathname,dirc,'/Gradient_',file_name]);
figure(5),imshow(G1);
% mean_gradient=mean(G(x));% get the mean gradient
% sum_gradient=sum(G(x));
% subplot(3,2,3),histogram(G1);
% level = graythresh(G1);
% BW = im2bw(G1,level);
% imwrite(BW,'/Users/zhangtianjie/Documents/IR/Specialissue/damage_density/test1/bw2.jpg');
% figure(6),imshow(BW);
sum_areacount=sum(areacount);