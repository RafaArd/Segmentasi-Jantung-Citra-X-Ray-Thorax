function varargout = TB3(varargin)
% TB3 MATLAB code for TB3.fig
%      TB3, by itself, creates a new TB3 or raises the existing
%      singleton*.
%
%      H = TB3 returns the handle to a new TB3 or the handle to
%      the existing singleton*.
%
%      TB3('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TB3.M with the given input arguments.
%
%      TB3('Property','Value',...) creates a new TB3 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before TB3_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to TB3_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help TB3

% Last Modified by GUIDE v2.5 06-Jun-2022 10:49:32

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @TB3_OpeningFcn, ...
                   'gui_OutputFcn',  @TB3_OutputFcn, ...
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


% --- Executes just before TB3 is made visible.
function TB3_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to TB3 (see VARARGIN)

% Choose default command line output for TB3
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes TB3 wait for user response (see UIRESUME)
% uiwait(handles.TB3);


% --- Outputs from this function are returned to the command line.
function varargout = TB3_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function TB3_Callback(hObject, eventdata, handles)
% hObject    handle to TB3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --------------------------------------------------------------------
function TB1_Callback(hObject, eventdata, handles)
% hObject    handle to TB1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
TB1:show;

% --------------------------------------------------------------------
function TB2_Callback(hObject, eventdata, handles)
% hObject    handle to TB2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
TB2:show;
