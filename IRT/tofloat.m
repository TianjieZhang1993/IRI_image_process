function [out,revertclass]=tofloat(in)
%% ���ã���ͼ��ת��Ϊ����
%revertclass�Ǻ������������ת��������
%% ��ȡͼ��
% if isempty(varargin)
% disp('��ѡ����Ҫ���д����ͼƬ');
% [filename, pathname] = uigetfile( '*.*','��ѡ����Ҫ���д����ͼƬ'); %ѡ��ͼƬ�ļ�
%     if isequal(filename,0)   %�ж��Ƿ�ѡ��
%      msgbox('û��ѡ���κ�ͼƬ');
%     else
%       pathfile=fullfile(pathname, filename);  %���ͼƬ·��
%       in=imread(pathfile);
%     end
% else
%     in=varargin;
% end
%% ת��
identity=@(x) x;
tosingle=@im2single;
table={'uint8',tosingle,@im2unit8
    'unit16',tosingle,@im2unit16
     'int16',tosingle,@im2int16
      'logical',tosingle,@logical
      'double',identity,identity
      'single',identity,identity};
  classIndex=find(strcmp(class(in),table(:,1)));
  if isempty(classIndex)
      error('Unsupported input image class.');
  end
  out=table{classIndex,2}(in);
  revertclass=table{classIndex,3};