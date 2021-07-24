function varargout = rgbextract(varargin)
% rgbextract MATLAB code for rgbextract.fig
%      rgbextract, by itself, creates a new rgbextract or raises the existing
%      singleton*.
%
%      H = rgbextract returns the handle to a new rgbextract or the handle to
%      the existing singleton*.
%
%      rgbextract('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in rgbextract.M with the given input arguments.
%
%      rgbextract('Property','Value',...) creates a new rgbextract or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before rgbextract_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to rgbextract_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help rgbextract

% Last Modified by GUIDE v2.5 18-Jul-2021 10:25:59

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @rgbextract_OpeningFcn, ...
                   'gui_OutputFcn',  @rgbextract_OutputFcn, ...
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


% --- Executes just before rgbextract is made visible.
function rgbextract_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to rgbextract (see VARARGIN)

% Choose default command line output for rgbextract
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes rgbextract wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = rgbextract_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
f=imread('Img\rgb.png');
handles.image=f;
handles.red=f(:,:,1);
handles.green=f(:,:,2);
handles.blue=f(:,:,3);
guidata(hObject, handles);

check=get(handles.checkbox1,'value')
if (check==1)
    figure(1), imshow(f);
else
    figure(1), close;
end

% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
check=get(handles.checkbox1,'value')
if (check==1)
    if (get(handles.radiobutton1, 'value')==1)
        figure(2), imshow(handles.red);
    elseif (get(handles.radiobutton2, 'value')==1)
        figure(3), imshow(handles.green);
    elseif (get(handles.radiobutton3, 'value')==1)
        figure(4), imshow(handles.blue);
    end
else figure(2), close;
end


% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
check=get(handles.checkbox1,'value')
if (check==1)
    if (get(handles.radiobutton1, 'value')==1)
        figure(2), imshow(handles.red);
    elseif (get(handles.radiobutton2, 'value')==1)
        figure(3), imshow(handles.green);
    elseif (get(handles.radiobutton3, 'value')==1)
        figure(4), imshow(handles.blue);
    end
else figure(3), close;
end

% --- Executes on button press in radiobutton3.
function radiobutton3_Callback(hObject, eventdata, handles)
check=get(handles.checkbox1,'value')
if (check==1)
    if (get(handles.radiobutton1, 'value')==1)
        figure(2), imshow(handles.red);
    elseif (get(handles.radiobutton2, 'value')==1)
        figure(3), imshow(handles.green);
    elseif (get(handles.radiobutton3, 'value')==1)
        figure(4), imshow(handles.blue);
    end
else figure(4), close;
end
