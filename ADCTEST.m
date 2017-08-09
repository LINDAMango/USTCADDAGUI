function varargout = ADCTEST(varargin)
% ADCTEST MATLAB code for ADCTEST.fig
%      ADCTEST, by itself, creates a new ADCTEST or raises the existing
%      singleton*.
%
%      H = ADCTEST returns the handle to a new ADCTEST or the handle to
%      the existing singleton*.
%
%      ADCTEST('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ADCTEST.M with the given input arguments.
%
%      ADCTEST('Property','Value',...) creates a new ADCTEST or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ADCTEST_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ADCTEST_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ADCTEST

% Last Modified by GUIDE v2.5 08-Aug-2017 17:08:17

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ADCTEST_OpeningFcn, ...
                   'gui_OutputFcn',  @ADCTEST_OutputFcn, ...
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


% --- Executes just before ADCTEST is made visible.
function ADCTEST_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ADCTEST (see VARARGIN)

% Choose default command line output for ADCTEST
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ADCTEST wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ADCTEST_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in ADDA_button.
function ADDA_button_Callback(hObject, eventdata, handles)
% hObject    handle to ADDA_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of ADDA_button
set(gcf,'visible','off');
DACTEST('visible','on');


% --- Executes on button press in Sent_button.
function Sent_button_Callback(hObject, eventdata, handles)
% hObject    handle to Sent_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
da = USTCADC();
da.Open();                                       % Æô¶¯ÍøÂç¼àÌý
da.ForceTrig();
da.Close();                                      % ¹Ø±ÕÍøÂç¼àÌý


% --- Executes on button press in WAVE_button.
function WAVE_button_Callback(hObject, eventdata, handles)
% hObject    handle to WAVE_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.WAVE_button,'Enable','off');
set(handles.DEMO_button,'Enable','on');


% --- Executes on button press in DEMO_button.
function DEMO_button_Callback(hObject, eventdata, handles)
% hObject    handle to DEMO_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.DEMO_button,'Enable','off');
set(handles.WAVE_button,'Enable','on');


% --- Executes on button press in TrigCount_button.
function TrigCount_button_Callback(hObject, eventdata, handles)
% hObject    handle to TrigCount_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
da = USTCADC();
da.Open();
da.SetTrigCount(TrigCount,2000);
set(handles.TrigCount_edit,'Data');
da.Close();


function TrigCount_edit_Callback(hObject, eventdata, handles)
% hObject    handle to TrigCount_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TrigCount_edit as text
%        str2double(get(hObject,'String')) returns contents of TrigCount_edit as a double


% --- Executes during object creation, after setting all properties.
function TrigCount_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TrigCount_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in MacAddress_button.
function MacAddress_button_Callback(hObject, eventdata, handles)
% hObject    handle to MacAddress_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
da = USTCADC();
da.Open();
da.SetMacAddr();
da.Close();


function MacAddress_edit_Callback(hObject, eventdata, handles)
% hObject    handle to MacAddress_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of MacAddress_edit as text
%        str2double(get(hObject,'String')) returns contents of MacAddress_edit as a double


% --- Executes during object creation, after setting all properties.
function MacAddress_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MacAddress_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on button press in SampleDepth_button.
function SampleDepth_button_Callback(hObject, eventdata, handles)
% hObject    handle t    o SampleDepth_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
da = USTCADC();
da.Open();
da.SetSampleDepth();
da.Close();


function SampleDepth_edit_Callback(hObject, eventdata, handles)
% hObject    handle to SampleDepth_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of SampleDepth_edit as text
%        str2double(get(hObject,'String')) returns contents of SampleDepth_edit as a double


% --- Executes during object creation, after setting all properties.
function SampleDepth_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SampleDepth_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in WindowLength_button.
function WindowLength_button_Callback(hObject, eventdata, handles)
% hObject    handle to WindowLength_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
da = USTCADC();
da.Open();
da.SetWindowLength();
da.Close();


function WindowLength_edit_Callback(hObject, eventdata, handles)
% hObject    handle to WindowLength_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of WindowLength_edit as text
%        str2double(get(hObject,'String')) returns contents of WindowLength_edit as a double


% --- Executes during object creation, after setting all properties.
function WindowLength_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to WindowLength_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in WindowStart_button.
function WindowStart_button_Callback(hObject, eventdata, handles)
% hObject    handle to WindowStart_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
da = USTCADC();
da.Open();
da.SetWindowStart();
da.Close();


function WindowStart_edit_Callback(hObject, eventdata, handles)
% hObject    handle to WindowStart_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of WindowStart_edit as text
%        str2double(get(hObject,'String')) returns contents of WindowStart_edit as a double


% --- Executes during object creation, after setting all properties.
function WindowStart_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to WindowStart_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Gain_button.
function Gain_button_Callback(hObject, eventdata, handles)
% hObject    handle to Gain_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
da = USTCADC();
da.Open();
da.SetGain();
da.Close();


function Gain_edit_Callback(hObject, eventdata, handles)
% hObject    handle to Gain_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Gain_edit as text
%        str2double(get(hObject,'String')) returns contents of Gain_edit as a double


% --- Executes during object creation, after setting all properties.
function Gain_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Gain_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in OpenQData_button.
function OpenQData_button_Callback(hObject, eventdata, handles)
% hObject    handle to OpenQData_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double


% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in OpenIData_button.
function OpenIData_button_Callback(hObject, eventdata, handles)
% hObject    handle to OpenIData_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over Sent_button.
function Sent_button_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to Sent_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit10_Callback(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit10 as text
%        str2double(get(hObject,'String')) returns contents of edit10 as a double


% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
