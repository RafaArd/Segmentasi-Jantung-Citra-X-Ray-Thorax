function varargout = TB1(varargin)
% TB1 MATLAB code for TB1.fig
%      TB1, by itself, creates a new TB1 or raises the existing
%      singleton*.
%
%      H = TB1 returns the handle to a new TB1 or the handle to
%      the existing singleton*.
%
%      TB1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TB1.M with the given input arguments.
%
%      TB1('Property','Value',...) creates a new TB1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before TB1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to TB1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help TB1

% Last Modified by GUIDE v2.5 14-Dec-2020 00:35:54

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @TB1_OpeningFcn, ...
                   'gui_OutputFcn',  @TB1_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before TB1 is made visible.
function TB1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to TB1 (see VARARGIN)

% Choose default command line output for TB1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes TB1 wait for user response (see UIRESUME)
% uiwait(handles.TB1);


% --- Outputs from this function are returned to the command line.
function varargout = TB1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
proyek=guidata(gcbo); 
[namafile,direktori]=uigetfile({'*.jpg';'*.bmp';'*.png';'*.tif';'*.*'},'Buka Citra'); 
if isequal(namafile,0)
return; 
end
eval(['cd ''' direktori ''';']);
A=imread(strcat(direktori,namafile)); 
set(proyek.TB1,'CurrentAxes',proyek.axes6); 
set(imshow(A));  
set(proyek.axes6,'Userdata',A); 
set(proyek.TB1,'Userdata',A);

% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
proyek=guidata(gcbo);
A=get(proyek.axes6,'Userdata'); 
F=rgb2gray(A); 
set(imshow(A));
set(proyek.axes6,'Userdata',A); 
set(proyek.TB1,'CurrentAxes',proyek.axes1); 
set(imshow(F));
set(proyek.axes1,'Userdata',F); 
impixelregion;
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
proyek=guidata(gcbo); 
A=get(proyek.axes1,'Userdata'); 
B=fspecial('gaussian'); 
C=imfilter(A,B,'replicate'); 
set(proyek.TB1,'CurrentAxes',proyek.axes3); 
set(imshow(C)); 
set(proyek.axes3,'Userdata',C);
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
proyek=guidata(gcbo); 
b=get(proyek.axes1, 'Userdata');

[m,n]=size(b);
for i=1:m
    for j=1:n
        if(b(i,j)==20) || (i<5 || j<10) || (i>m-10 || j>m-10)
            b(i,j)=0;
        end
    end
end

tg=find(b>0);
[tg] 
th=graythresh(b(tg)); 
Ta=th*255;
[Ta] 
A=b<Ta;
set(proyek.TB1,'CurrentAxes',proyek.axes4); 
set(imshow(A));
set(proyek.axes4,'Userdata',A);

g=~A;

g(20,:)=1;
ga=imfill(g,'holes'); 
set(proyek.TB1,'CurrentAxes',proyek.axes5); 
set(imshow(ga));
set(proyek.axes5,'Userdata',ga);

seD=strel('diamond',2); 
gb=imerode(ga,seD);
gb=imerode(gb,seD);

se90=strel('line',7,90); 
se0=strel('line',7,0); 
gc=imdilate(gb,[se90 se0]);
set(proyek.TB1,'CurrentAxes',proyek.axes7); 
set(imshow(gc));
set(proyek.axes7,'Userdata',gc);

B=zeros(m,n);
set(proyek.TB1,'CurrentAxes',proyek.axes8); 
set(imshow(B));
set(proyek.axes8,'Userdata',B);
HT=find(gc==1);
B(HT)=A(HT);
set(proyek.TB1,'CurrentAxes',proyek.axes9); 
set(imshow(B));
set(proyek.axes9,'Userdata',B);

se90=strel('line',5,90); 
se0=strel('line',5,0); 
C=imdilate(B,[se90 se0]);

D=imfill(C,'holes');

seD=strel('diamond',3); 
E=imerode(D,seD); 
E=imerode(E,seD);

se90=strel('line',7,90); 
se0=strel('line',7,0);
F=imdilate(E,[se90 se0]); 

set(proyek.TB1,'CurrentAxes',proyek.axes10); 
set(imshow(F));
set(proyek.axes10,'Userdata',F); 
imwrite(F,'Hasil.jpg');
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


