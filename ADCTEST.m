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

% Last Modified by GUIDE v2.5 31-Jul-2017 16:39:05

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


% --- Executes on button press in WAVE_button.
function WAVE_button_Callback(hObject, eventdata, handles)
% hObject    handle to WAVE_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in DEMO_button.
function DEMO_button_Callback(hObject, eventdata, handles)
% hObject    handle to DEMO_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in TRIG_en_button.
function TRIG_en_button_Callback(hObject, eventdata, handles)
% hObject    handle to TRIG_en_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Assign_button.
function Assign_button_Callback(hObject, eventdata, handles)
% hObject    handle to Assign_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in SampleDepth_button.
function SampleDepth_button_Callback(hObject, eventdata, handles)
% hObject    handle to SampleDepth_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in DemoWinln_button.
function DemoWinln_button_Callback(hObject, eventdata, handles)
% hObject    handle to DemoWinln_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in DemoWinstart_button.
function DemoWinstart_button_Callback(hObject, eventdata, handles)
% hObject    handle to DemoWinstart_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in GainAdjust_button.
function GainAdjust_button_Callback(hObject, eventdata, handles)
% hObject    handle to GainAdjust_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


function TRIG_en_edit_Callback(hObject, eventdata, handles)
% hObject    handle to TRIG_en_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TRIG_en_edit as text
%        str2double(get(hObject,'String')) returns contents of TRIG_en_edit as a double


% --- Executes during object creation, after setting all properties.
function TRIG_en_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TRIG_en_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Assign_edit_Callback(hObject, eventdata, handles)
% hObject    handle to Assign_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Assign_edit as text
%        str2double(get(hObject,'String')) returns contents of Assign_edit as a double


% --- Executes during object creation, after setting all properties.
function Assign_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Assign_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function SD_edit_Callback(hObject, eventdata, handles)
% hObject    handle to SD_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of SD_edit as text
%        str2double(get(hObject,'String')) returns contents of SD_edit as a double


% --- Executes during object creation, after setting all properties.
function SD_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SD_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function demoWinln_edit_Callback(hObject, eventdata, handles)
% hObject    handle to demoWinln_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of demoWinln_edit as text
%        str2double(get(hObject,'String')) returns contents of demoWinln_edit as a double


% --- Executes during object creation, after setting all properties.
function demoWinln_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to demoWinln_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function demoWinstart_edit_Callback(hObject, eventdata, handles)
% hObject    handle to demoWinstart_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of demoWinstart_edit as text
%        str2double(get(hObject,'String')) returns contents of demoWinstart_edit as a double


% --- Executes during object creation, after setting all properties.
function demoWinstart_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to demoWinstart_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function GainAdjust_edit_Callback(hObject, eventdata, handles)
% hObject    handle to GainAdjust_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of GainAdjust_edit as text
%        str2double(get(hObject,'String')) returns contents of GainAdjust_edit as a double


% --- Executes during object creation, after setting all properties.
function GainAdjust_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to GainAdjust_edit (see GCBO)
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
