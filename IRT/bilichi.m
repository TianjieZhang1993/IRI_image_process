[file_name, pathname] = uigetfile( '*.*','????????????');
I = imread([pathname,'/',file_name]); 
imtool(I)