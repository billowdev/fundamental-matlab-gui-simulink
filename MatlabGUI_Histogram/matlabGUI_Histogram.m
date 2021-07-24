function varargout = matlabGUI_Histogram(varargin)
% MATLABGUI_HISTOGRAM MATLAB code for matlabGUI_Histogram.fig
%      MATLABGUI_HISTOGRAM, by itself, creates a new MATLABGUI_HISTOGRAM or raises the existing
%      singleton*.
%
%      H = MATLABGUI_HISTOGRAM returns the handle to a new MATLABGUI_HISTOGRAM or the handle to
%      the existing singleton*.
%
%      MATLABGUI_HISTOGRAM('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MATLABGUI_HISTOGRAM.M with the given input arguments.
%
%      MATLABGUI_HISTOGRAM('Property','Value',...) creates a new MATLABGUI_HISTOGRAM or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before matlabGUI_Histogram_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to matlabGUI_Histogram_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help matlabGUI_Histogram

% Last Modified by GUIDE v2.5 24-Jul-2021 16:31:09

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @matlabGUI_Histogram_OpeningFcn, ...
                   'gui_OutputFcn',  @matlabGUI_Histogram_OutputFcn, ...
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


% --- Executes just before matlabGUI_Histogram is made visible.
function matlabGUI_Histogram_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to matlabGUI_Histogram (see VARARGIN)

% Choose default command line output for matlabGUI_Histogram
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes matlabGUI_Histogram wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = matlabGUI_Histogram_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in loadingImage.
function loadingImage_Callback(hObject, eventdata, handles)
% pre-process
% Loading Image

[filename pathname] = uigetfile({'*.*'}, 'File Selector');
pathf = strcat(pathname, filename);

f = imread(pathf);
handles.image = f;
guidata(hObject, handles);
%figure(1), imshow(f);
figure('Name',['Picture: ' filename],'NumberTitle','off'), imshow(f);


% --- Executes on button press in showHistogram.
function showHistogram_Callback(hObject, eventdata, handles)
% processing
% imhist function
figure('Name', 'Histogram: Imhist', 'NumberTitle', 'off'), imhist(handles.image);

f = 255*im2double(handles.image);
bin = zeros(1,256);
for i=1:size(f,1)
    for j=1:size(f,2)
        bin(f(i,j,1)+1) = bin(f(i,j,1)+1)+1;
    end
end

% Show Histogram  (Post-process)
figure('Name', 'Histogram: customFunction', 'NumberTitle', 'off'), plot([1:256], bin, 'g')
