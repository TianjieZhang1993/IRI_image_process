function [g,NR,SI,TI]=regiongrow(S,T,img)
%% ���������㷨
%�Ա������ʴ���
%fΪԭͼ��
%SΪ���ӵ�����(0-1)��Ҳ������λ��
%TΪȫ����ֵ(0-1)
%g��ʾ����ָ�Ľ��
%NR��ʾ�ָ����������
%SI��ʾ���յ�����ͼ��
%TI��ʾ������ֵ�������ǻ�δ���ع��Ľ��ͼ
%% ��ȡͼ��
% if isempty(varargin)
% disp('��ѡ����Ҫ���д����ͼƬ');
% [filename, pathname] = uigetfile( '*.*','��ѡ����Ҫ���д����ͼƬ'); %ѡ��ͼƬ�ļ�
%     if isequal(filename,0)   %�ж��Ƿ�ѡ��
%      msgbox('û��ѡ���κ�ͼƬ');
%     else
%       pathfile=fullfile(pathname, filename);  %���ͼƬ·��
%       img=imread(pathfile);
%     end
% else
%     img=varargin;
% end
% %% �ж�ά�����ı�ͼ��ߴ�
% image_size=size(img);
% dimension=numel(image_size);
% if dimension==3
% img=rgb2gray(img);
% end

%% ��ȡ���ӵ����ػ���λ��
f=tofloat(img);%ת��Ϊ����
if numel(S)==1
    SI=f==S;
    S1=S;
else
    SI=bwmorph(S,'shrink',Inf);
    S1=f(SI);
end

%% ��������
TI=false(size(f));%
for K=1:length(S1)%��������صĻ����Ⱦ���1��
    seedvalue=S1(K);
    S=abs(f-seedvalue)<=T;
    TI=TI|S;%��TI����S����TI
end
[g,NR]=bwlabel(imreconstruct(SI,TI));