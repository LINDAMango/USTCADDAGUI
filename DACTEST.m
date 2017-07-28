function varargout = DACTEST(varargin)
% DACTEST MATLAB code for DACTEST.fig
%      DACTEST, by itself, creates a new DACTEST or raises the existing
%      singleton*.
%
%      H = DACTEST returns the handle to a new DACTEST or the handle to
%      the existing singleton*.
%
%      DACTEST('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DACTEST.M with the given input arguments.
%
%      DACTEST('Property','Value',...) creates a new DACTEST or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before DACTEST_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to DACTEST_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help DACTEST

% Last Modified by GUIDE v2.5 27-Jul-2017 15:03:17

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @DACTEST_OpeningFcn, ...
                   'gui_OutputFcn',  @DACTEST_OutputFcn, ...
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


% --- Executes just before DACTEST is made visible.
function DACTEST_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to DACTEST (see VARARGIN)

% Choose default command line output for DACTEST
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes DACTEST wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = DACTEST_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in add_handle.
function add_handle_Callback(hObject, eventdata, handles)
% hObject    handle to add_handle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
prompt = {'Input IP:'};
dlg_title = 'Input Dialog';
num_lines = 1;
def = {'10.0.1.1'};
value_IP = inputdlg(prompt,dlg_title,num_lines,def);
str = get(handles.listbox_ip,'String');
ip = value_IP;
len = length(str);
bExist = 0;
for k = 1:len
    if(strcmp(str{k},ip))
        bExist = 1; break;
    end
end
if(~bExist)
    new_str = [str;ip];
    set(handles.listbox_ip,'String',new_str);
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
guidata(handles.listbox_ip,handles);%自动更新listbox1的用户数据
udpobj = udp('10.0.255.255','Localport',6789,'InputBufferSize',262144);
fopen(udpobj);
pause(2);
while(udpobj.BytesAvailable)
    data = fread(udpobj,1024);
    ip = udpobj.DatagramAddress;
    str = get(handles.listbox_ip,'String');
    len = length(str);
    bExist = 0;
    for k=1:len
        if(strcmp(str{k},ip))
            bExist = 1; break;
        end
    end
    if(~bExist)
        new_str = [str;ip];
        set(handles.listbox_ip,'String',new_str);
    end
end
fclose(udpobj);


% --- Executes on selection change in listbox_ip.
function listbox_ip_Callback(hObject, eventdata, handles)
% hObject    handle to listbox_ip (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox_ip contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox_ip



% --- Executes on button press in save_button.
function save_button_Callback(hObject, eventdata, handles)
% hObject    handle to save_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[f p] = uiputfile('*.mat');
filepath = [p,f];    %filepath为文件路径
para = get(handles.uitable1,'Data');%para是数据矩阵
save(filepath,'para');




% --- Executes on button press in save_button.
function load_button_Callback(hObject, eventdata, handles)
% hObject    handle to save_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[f p] = uigetfile('*.mat');
filepath = [p,f];    %filepath为文件路径
workspace = load(filepath,'para');
set(handles.uitable1,'Data',workspace.para);


% --- Executes on button press in config_button.
function config_button_Callback(hObject, eventdata, handles)
% hObject    handle to config_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str = get(handles.listbox_ip,'string');
value = get(handles.listbox_ip,'value');
ip = str(value);
da = USTCDAC(ip,80);
da.Open();
data = get(handles.uitable1,'Data');
da.SetLoop(floor(data{1,3}/65536),mod(data{1,3},65536),floor(data{1,4}/65536),mod(data{1,4},65536));
da.SetTotalCount(data{2,4});
da.SetDACStart(data{3,4});
da.SetDACStop(data{4,4});
da.SetTrigStart(data{5,4});
da.SetTrigStop(data{6,4});
da.SetIsMaster(data{7,4});
da.SetTrigSel(data{8,4});
da.SetTrigInterval(data{9,4});
da.SetTrigCount(data{10,4});
da.SetBoardcast(data{11,3},data{11,4});
for x = 1:4
    da.SetGain(data{x,7},data{x,8});
    da.SetOffset(data{4+x,7},data{4+x,8});
    da.SetDefaultVolt(data{x+8,7},data{x+8,8})
end
    
da.Close();


% --- Executes on button press in EEPROM_button.
function EEPROM_button_Callback(hObject, eventdata, handles)
% hObject    handle to EEPROM_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str = get(handles.listbox_ip,'string');
value = get(handles.listbox_ip,'value');
ip = str(value);
da = USTCDAC(ip,80);
da.Open();
da.ConfigEEPROM();
da.Close();


% --- Executes during object creation, after setting all properties.
function listbox_ip_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox_ip (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




% --- Executes on button press in togglebutton1.
function togglebutton1_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton1
set(gcf,'visible','off');
ADCTEST('visible','on');


% --- Executes when entered data in editable cell(s) in uitable1.
function uitable1_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to uitable1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)




% --- Executes on button press in Init_button.
function Init_button_Callback(hObject, eventdata, handles)
% hObject    handle to Init_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str = get(handles.listbox_ip,'string');
value = get(handles.listbox_ip,'value');
ip = str(value);
da = USTCDAC(ip,80);
da.Open();
da.Init();
da.Close();


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.radiobutton1,'value',1);
set(handles.radiobutton2,'value',0);
% Hint: get(hObject,'Value') returns toggle state of radiobutton1


% --- Executes on selection change in wave_seclect.
function wave_seclect_Callback(hObject, eventdata, handles)
% hObject    handle to wave_seclect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns wave_seclect contents as cell array
%        contents{get(hObject,'Value')} returns selected item from wave_seclect


% --- Executes during object creation, after setting all properties.
function wave_seclect_CreateFcn(hObject, eventdata, handles)
% hObject    handle to wave_seclect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.radiobutton1,'value',0);
set(handles.radiobutton2,'value',1);
% Hint: get(hObject,'Value') returns toggle state of radiobutton2


function frequency_Callback(hObject, eventdata, handles)
% hObject    handle to frequency (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of frequency as text
%        str2double(get(hObject,'String')) returns contents of frequency as a double


% --- Executes during object creation, after setting all properties.
function frequency_CreateFcn(hObject, eventdata, handles)
% hObject    handle to frequency (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function amplitude_Callback(hObject, eventdata, handles)
% hObject    handle to amplitude (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of amplitude as text
%        str2double(get(hObject,'String')) returns contents of amplitude as a double


% --- Executes during object creation, after setting all properties.
function amplitude_CreateFcn(hObject, eventdata, handles)
% hObject    handle to amplitude (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function offset_Callback(hObject, eventdata, handles)
% hObject    handle to offset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of offset as text
%        str2double(get(hObject,'String')) returns contents of offset as a double


% --- Executes during object creation, after setting all properties.
function offset_CreateFcn(hObject, eventdata, handles)
% hObject    handle to offset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function wave_length_Callback(hObject, eventdata, handles)
% hObject    handle to wave_length (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of wave_length as text
%        str2double(get(hObject,'String')) returns contents of wave_length as a double


% --- Executes during object creation, after setting all properties.
function wave_length_CreateFcn(hObject, eventdata, handles)
% hObject    handle to wave_length (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in send_button.
function send_button_Callback(hObject, eventdata, handles)
% hObject    handle to send_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(handles.radiobutton1, 'value')
    opinion = 1;
elseif get(handles.radiobutton2, 'value');
    opinion = 2;
end
wavemode = get(handles.wave_seclect, 'value');
frequency = str2num(get(handles.frequency,'String'));
amplitude = str2num(get(handles.amplitude, 'String'));%amplitude为峰峰值
offset = str2num(get(handles.offset, 'String'));
wavelength = str2num(get(handles.wave_length, 'String'));%采样点数为2000
channel = get(handles.CHANNEL,'value');
if opinion == 1
    waveobj = waveform();
    waveobj.amplitude = amplitude;
    waveobj.offset = offset;
    waveobj.frequency = frequency;
    switch(wavemode)
        case 1
            wave = waveobj.generate_dc();
        case 2
            wave = waveobj.generate_squr();
        case 3
            wave = waveobj.generate_sine();
        case 4
            wave = waveobj.generate_saw();
        otherwise
            wave = xlsread('data.xlsx','A:A');
    end
    seq = waveobj.generate_seq(length(wave));
    da = USTCDAC(ip,80);
    da.Open();
    da.StartStop(2^(3+channel));
    da.WriteWave(channel,0,wave);
    da.WriteSeq(channel,0,seq);
    da.StartStop(2^(channel-1));
    da.CheckStatus();%检查上方写函数是否执行完毕
    da.Close();
else
    switch(wavemode)
        case 1
            wave = offset;
        case 2
            wave = zeros(1,wavelength);
            pattern = zeros(1,floor(2e9/frequency))+offset+0.5*amplitude;
            pattern(floor(length(pattern)/2):floor(length(pattern))) = offset-0.5*amplitude;
            fixtimes = floor(wavelength/pattern);
            for k = 1:fixtimes
               wave(1+(k-1)*length(pattern):k*length(pattern)) = pattern;
            end
            remain = rem(wavelength,length(pattern));
            wave(1+k*length(pattern):wavelength)=pattern(1:remain);
        case 3
            wave = 0.5*amplitude*sin((1:wavelength)/(2e9/frequency)*2*pi)+offset;
        case 4
            wave = 0;
        otherwise
            wave = 0;
    end
end

function delay_Callback(hObject, eventdata, handles)
% hObject    handle to delay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of delay as text
%        str2double(get(hObject,'String')) returns contents of delay as a double


% --- Executes during object creation, after setting all properties.
function delay_CreateFcn(hObject, eventdata, handles)
% hObject    handle to delay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function IP_Count_Callback(hObject, eventdata, handles)
% hObject    handle to IP_Count (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of IP_Count as text
%        str2double(get(hObject,'String')) returns contents of IP_Count as a double


% --- Executes during object creation, after setting all properties.
function IP_Count_CreateFcn(hObject, eventdata, handles)
% hObject    handle to IP_Count (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in CHANNEL.
function CHANNEL_Callback(hObject, eventdata, handles)
% hObject    handle to CHANNEL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns CHANNEL contents as cell array
%        contents{get(hObject,'Value')} returns selected item from CHANNEL


% --- Executes during object creation, after setting all properties.
function CHANNEL_CreateFcn(hObject, eventdata, handles)
% hObject    handle to CHANNEL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
