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

% Last Modified by GUIDE v2.5 04-Aug-2017 09:26:11

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
function DACTEST_OpeningFcn(hObject, ~, handles, varargin)
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
function varargout = DACTEST_OutputFcn(~, ~, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in DAAD_button.
function DAAD_button_Callback(~, ~, ~)
% hObject    handle to DAAD_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of DAAD_button
set(gcf,'visible','off');
ADCTEST('visible','on');                    % 实现DACTEST页面与ADCTEST页面的转换


% --- Executes on button press in IPCount_button.
function IPCount_button_Callback(~, ~, handles)
% hObject    handle to IPCount_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str = get(handles.IP_listbox,'String');
len = length(str);
set(handles.IPCount_edit,'String',len);     % 统计IP_listbox中的ip的数量


function IPCount_edit_Callback(~, ~, ~)
% hObject    handle to IPCount_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of IPCount_edit as text
%        str2double(get(hObject,'String')) returns contents of IPCount_edit as a double


% --- Executes during object creation, after setting all properties.
function IPCount_edit_CreateFcn(hObject, ~, ~)
% hObject    handle to IPCount_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in IP_listbox.
function IP_listbox_Callback(hObject, eventdata, handles)
% hObject    handle to IP_listbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns IP_listbox contents as cell array
%        contents{get(hObject,'Value')} returns selected item from IP_listbox
str = get(handles.IP_listbox,'string');
value = get(handles.IP_listbox,'value');
ip = str{value};
path = 'C:\Users\Administrator\Desktop\USTCADDAGUI\config\';
ip_str = char(strcat(path, strcat(cellstr(ip),'.mat')));
workspace = load(ip_str);
set(handles.Setpara_uitable,'Data',workspace.data);
 

% --- Executes during object creation, after setting all properties.
function IP_listbox_CreateFcn(hObject,eventdata, handles)
% hObject    handle to IP_listbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on button press in Manual_button.
function Manual_button_Callback(~, eventdata, handles)
% hObject    handle to Manual_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
prompt = {'Input IP:'};
dlg_title = 'Input Dialog';
num_lines = 1;
def = {'10.0.1.1'};                         % 弹出一个菜单，手动输入ip，默认值为10.0.1.1
value_IP = inputdlg(prompt,dlg_title,num_lines,def);
str = get(handles.IP_listbox,'String');
ip = value_IP;
len = length(str);
bExist = 0;
for k = 1:len
    if(strcmp(str{k},ip))
        bExist = 1;
        break;
    end
end
if(~bExist)
    new_str = [str;ip];
    set(handles.IP_listbox,'String',new_str);
end                                         %若当前输入的ip列表中已经存在则不进行操作，若不存在则将ip写入列表中
ip = value_IP;
path = 'C:\Users\Administrator\Desktop\USTCADDAGUI\config\';
ip_str = char(strcat(path, strcat(cellstr(ip),'.mat')));
if(~exist(ip_str,'file'))
    msgbox('请配置参数！','警告','warn');           %若子文件夹（config）中没有名为ip.mat的文件，则警告用户配置参数并保存。
    data = get(handles.Setpara_uitable,'Data');
    save('temp','data'); 
    movefile('temp.mat',ip_str);
end


% --- Executes on button press in Scan_button.
function Scan_button_Callback(~, eventdata, handles)
% hObject    handle to Scan_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.Scan_button,'Enable','off');
guidata(handles.IP_listbox,handles);        %自动更新listbox1的用户数据
udpobj = udp('10.0.255.255','Localport',6789,'InputBufferSize',262144); 
fopen(udpobj);
pause(2);
iplist = get(handles.IP_listbox,'String');
while(udpobj.BytesAvailable)
    ip = {udpobj.DatagramAddress};
    fread(udpobj,1024);
    len = length(iplist);
    bExist = 0;
    for k=1:len
        if(strcmp(iplist{k},ip{1}))
            bExist = 1;
            break;
        end
    end
    if(~bExist)
        iplist1 = [iplist;ip];
        iplist = iplist1;
        path = 'C:\Users\Administrator\Desktop\USTCADDAGUI\config\';
        ip_str = char(strcat(path, strcat(cellstr(ip),'.mat')));
        if(~exist(ip_str,'file'))
            data = get(handles.Setpara_uitable,'Data');
            save('temp','data'); 
            movefile('temp.mat',ip_str);
        end
    end
end
set(handles.IP_listbox,'String',iplist);
fclose(udpobj);
set(handles.Scan_button,'Enable','on');


% --- Executes when entered data in editable cell(s) in Setpara_uitable.
function Setpara_uitable_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to Setpara_uitable (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Save_button.
function Save_button_Callback(~, eventdata, handles)
% hObject    handle to Save_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str = get(handles.IP_listbox,'string');
value = get(handles.IP_listbox,'value');
ip = str{value};
dir = 'C:\Users\Administrator\Desktop\USTCADDAGUI\config\';
savepath = char(strcat(dir,strcat(cellstr(ip),'.mat')));
data = get(handles.Setpara_uitable,'Data');
save(savepath,'data');


% --- Executes on button press in Save_button.
function Load_button_Callback(~,eventdata, handles)
% hObject    handle to Save_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[f,p] = uigetfile('*.mat');
filepath = [p,f];    %filepath为文件路径
workspace = load(filepath,'para');
set(handles.Setpara_uitable,'Data',workspace.para);% 将USTCADDAGUI文件夹下的config文件夹中的数据加载到Setpara_uitable中


% --- Executes on button press in Config_button.
function Config_button_Callback(~,eventdata, handles)
% hObject    handle to Config_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str = get(handles.IP_listbox,'string');
value = get(handles.IP_listbox,'value');
ip = str{value};
da = USTCDAC(ip,80);
da.Open();
data = get(handles.Setpara_uitable,'Data');
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
da.CheckStatus();                           %检查上方指令是否执行完毕
da.Close();                                 %将Setpara_uitable中的数据写到对应ip地址的DAC板上


% --- Executes on button press in EEPROM_button.
function EEPROM_button_Callback(~, eventdata, handles)
% hObject    handle to EEPROM_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str = get(handles.IP_listbox,'string');
value = get(handles.IP_listbox,'value');
ip = str{value};
da = USTCDAC(ip,80);
da.Open();
da.ConfigEEPROM();
da.CheckStatus();
da.Close();                                 % 给DAC板指令，将数据写入EEPROM


% --- Executes on button press in Init_button.
function Init_button_Callback(~, ~, handles)
% hObject    handle to Init_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str = get(handles.IP_listbox,'string');
value = get(handles.IP_listbox,'value');
ip = str{value};
da = USTCDAC(ip,80);
da.Open();
da.Init();
da.CheckStatus();
da.Close();                                 % 初始化DAC


% --- Executes on button press in ContinuousMode_rbutton.
function ContinuousMode_rbutton_Callback(hObject, eventdata, handles)
% hObject    handle to ContinuousMode_rbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.ContinuousMode_rbutton,'value',1);
set(handles.TriggerMode_rbutton,'value',0);
% Hint: get(hObject,'Value') returns toggle state of ContinuousMode_rbutton


% --- Executes on button press in TriggerMode_rbutton.
function TriggerMode_rbutton_Callback(hObject, eventdata, handles)
% hObject    handle to TriggerMode_rbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.ContinuousMode_rbutton,'value',0);
set(handles.TriggerMode_rbutton,'value',1);                       % 将两个单选按钮（连续模式和触发模式）设置为一组
% Hint: get(hObject,'Value') returns toggle state of TriggerMode_rbutton


function Delay_edit_Callback(hObject, eventdata, handles)
% hObject    handle to Delay_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Delay_edit as text
%        str2double(get(hObject,'String')) returns contents of Delay_edit as a double


% --- Executes during object creation, after setting all properties.
function Delay_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Delay_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in WaveSeclect_popu.
function WaveSeclect_popu_Callback(hObject, eventdata, handles)
% hObject    handle to WaveSeclect_popu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns WaveSeclect_popu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from WaveSeclect_popu


% --- Executes during object creation, after setting all properties.
function WaveSeclect_popu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to WaveSeclect_popu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function Frequency_edit_Callback(hObject, eventdata, handles)
% hObject    handle to Frequency_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Frequency_edit as text
%        str2double(get(hObject,'String')) returns contents of Frequency_edit as a double


% --- Executes during object creation, after setting all properties.
function Frequency_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Frequency_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function Amplitude_edit_Callback(hObject, eventdata, handles)
% hObject    handle to Amplitude_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Amplitude_edit as text
%        str2double(get(hObject,'String')) returns contents of Amplitude_edit as a double


% --- Executes during object creation, after setting all properties.
function Amplitude_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Amplitude_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function Offset_edit_Callback(hObject, eventdata, handles)
% hObject    handle to Offset_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Offset_edit as text
%        str2double(get(hObject,'String')) returns contents of Offset_edit as a double


% --- Executes during object creation, after setting all properties.
function Offset_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Offset_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function WaveLength_edit_Callback(hObject, eventdata, handles)
% hObject    handle to WaveLength_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of WaveLength_edit as text
%        str2double(get(hObject,'String')) returns contents of WaveLength_edit as a double


% --- Executes during object creation, after setting all properties.
function WaveLength_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to WaveLength_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in CHANNEL_popu.
function CHANNEL_popu_Callback(hObject, eventdata, handles)
% hObject    handle to CHANNEL_popu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns CHANNEL_popu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from CHANNEL_popu


% --- Executes during object creation, after setting all properties.
function CHANNEL_popu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to CHANNEL_popu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Send_button.
function Send_button_Callback(hObject, eventdata, handles)
% hObject    handle to Send_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(handles.ContinuousMode_rbutton, 'value')
    opinion = 1;
elseif get(handles.TriggerMode_rbutton, 'value');
    opinion = 2;
end
wavemode = get(handles.WaveSeclect_popu, 'value');                % 选择波形模式
delay = str2num(get(handles.Delay_edit,'String'));                % 延时
frequency = str2num(get(handles.Frequency_edit,'String'));        % 频率
amplitude = str2num(get(handles.Amplitude_edit, 'String'));       % amplitude为峰峰值
offset = str2num(get(handles.Offset_edit, 'String'));             % 偏置
wavelength = str2num(get(handles.WaveLength_edit, 'String'));     % 采样长度
channel = get(handles.CHANNEL_popu,'value');
if opinion == 1                                                   % 连续模式
    waveobj = waveform();                                         % 调用waveform.m文件中的函数waveform()
    waveobj.amplitude = amplitude;
    waveobj.offset = offset;
    waveobj.frequency = frequency;
    switch(wavemode)
        case 1
            wave = waveobj.generate_dc();                         % 直流
        case 2
            wave = waveobj.generate_squr();                       % 方波
        case 3
            wave = waveobj.generate_sine();                       % 正弦波
        case 4
            wave = waveobj.generate_saw();                        % 锯齿波
        otherwise
            wave = xlsread('data.xlsx','A:A');                    % 通过向data.xlsx写数据，自定义波形
    end
    seq = waveobj.generate_seq(length(wave));
    str = get(handles.IP_listbox,'String');
    value = get(handles.IP_listbox,'value');
    ip = str{value};
    da = USTCDAC(ip,80);                                          % 调用USTCDAC.m文件
    da.Open();                                                    % Connect to DAC board.
    da.StartStop(2^(3+channel));
    da.WriteWave(channel,0,wave);
    da.WriteSeq(channel,0,seq);
    da.StartStop(2^(channel-1));
    da.CheckStatus();                                             % 检查上方写函数是否执行完毕
    da.Close();
else                                                              % 触发模式
    waveobj = waveform();
    switch(wavemode)
        case 1
            wave = zeros(1,wavelength)+offset;
        case 2
            wave = zeros(1,wavelength);
            pattern = zeros(1,floor(2e9/frequency))+offset+0.5*amplitude;
            pattern(floor(length(pattern)/2):length(pattern)) = offset-0.5*amplitude;
            fixtimes = floor(wavelength/length(pattern));
            for k = 1:fixtimes
               wave(1+(k-1)*length(pattern):k*length(pattern)) = pattern;
            end
            remain = rem(wavelength,length(pattern));
            wave(1+k*length(pattern):wavelength)=pattern(1:remain);
        case 3
            wave = 0.5*amplitude*sin((1:wavelength)/(2e9/frequency)*2*pi)+offset;
        case 4
            wave = zeros(1,wavelength);
            for k = 1:floor(2e9/frequency)
                pattern = zeros(1,floor(2e9/frequency))+amplitude/(2e9/frequency)*(length(floor(2e9/frequency))-k)+offset-0.5*amplitude;
            end
            fixtimes = floor(wavelength/length(pattern));
            for k = 1:fixtimes
               wave(1+(k-1)*length(pattern):k*length(pattern)) = pattern;
            end
            remain = rem(wavelength,length(pattern));
            wave(1+k*length(pattern):wavelength)=pattern(1:remain);
        otherwise
            wave = xlsread('data.xlsx','A:A');
    end
%     seq = zeros(1,wavelength);
%     count = wavelength;
%     for k=1:floor((wavelength/8))
%         seq(4*k-3) = 0;
%         seq(4*k-2) = 0;
%         seq(4*k-1) = 0;
%         seq(4*k) = count;
%     end
    seq = waveobj.generate_trig_seq(wavelength,delay);
    str = get(handles.IP_listbox,'String');
    value = get(handles.IP_listbox,'value');
    ip = str{value};
    da = USTCDAC(ip,80);                                          % 调用USTCDAC.m文件
    da.Open();                                                    % Connect to DAC board.
    data = get(handles.Setpara_uitable,'Data');
    da.ismaster = data{7,4};
    da.StartStop(2^(3+channel));
    da.WriteWave(channel,0,wave);
    da.WriteSeq(channel,0,seq);
    da.StartStop(2^(channel-1));
    if(da.ismaster)
        da.SendIntTrig();
    end
    da.CheckStatus();                                             %检查上方写函数是否执行完毕
    da.Close();
end


% --- Executes during object creation, after setting all properties.
function Setpara_uitable_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Setpara_uitable (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
