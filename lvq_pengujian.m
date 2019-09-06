function varargout = lvq_pengujian(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @lvq_pengujian_OpeningFcn, ...
                   'gui_OutputFcn',  @lvq_pengujian_OutputFcn, ...
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
function lvq_pengujian_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);

[back] = imread('background.jpg');
image (back)


function varargout = lvq_pengujian_OutputFcn(hObject, eventdata, handles)
varargout{1} = handles.output;

function axes3_CreateFcn(hObject, eventdata, handles)

function edit2_Callback(hObject, eventdata, handles)
function edit2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% Browse Button untuk mengambil citra dari direktori
% dan menampilkan hasil
function pushbutton1_Callback(hObject, eventdata, handles)
[nama_file,nama_path] = uigetfile(...
    {'*.bmp; *.jpg; *.*'},...
    'Buka Citra');
if ~isequal (nama_file,0)
    handles.data1 = imread(fullfile(nama_path,nama_file));
    guidata(hObject,handles);
    handles.current_data1=handles.data1;
    axes(handles.axes1);
    imshow(handles.data1);
else
    return
end

red=mean(mean(handles.data1(:,:,1)));   %Mean R
green=mean(mean(handles.data1(:,:,2))); %Mean G
blue=mean(mean(handles.data1(:,:,3)));  %Mean B

load jstlvqdataset16citra.mat

data_uji = [red;green;blue];
hasil_uji = round(sim(net,data_uji))

if hasil_uji== [1;0];
    set(handles.edit2,'string','Matang');
else
    set(handles.edit2,'string','Mentah');
end
