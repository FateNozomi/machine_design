function varargout = Motor_Designer(varargin)
% MOTOR_DESIGNER MATLAB code for Motor_Designer.fig
%      MOTOR_DESIGNER, by itself, creates a new MOTOR_DESIGNER or raises the existing
%      singleton*.
%
%      H = MOTOR_DESIGNER returns the handle to a new MOTOR_DESIGNER or the handle to
%      the existing singleton*.
%
%      MOTOR_DESIGNER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MOTOR_DESIGNER.M with the given input arguments.
%
%      MOTOR_DESIGNER('Property','Value',...) creates a new MOTOR_DESIGNER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Motor_Designer_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Motor_Designer_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Motor_Designer

% Last Modified by GUIDE v2.5 13-Oct-2016 00:47:13

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Motor_Designer_OpeningFcn, ...
                   'gui_OutputFcn',  @Motor_Designer_OutputFcn, ...
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


% --- Executes just before Motor_Designer is made visible.
function Motor_Designer_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Motor_Designer (see VARARGIN)

% Choose default command line output for Motor_Designer
handles.output = hObject;

% set all table size to be 0x0
set(handles.uitable_s1,'Data',cell(0,0));
set(handles.uitable_phaseA,'Data',cell(0,0));
set(handles.uitable_phaseB,'Data',cell(0,0));
set(handles.uitable_phaseC,'Data',cell(0,0));

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Motor_Designer wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Motor_Designer_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes when entered data in editable cell(s) in uitable_s1.
function uitable_s1_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to uitable_s1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function uitable_s1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uitable_s1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object deletion, before destroying properties.
function uitable_s1_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to uitable_s1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function editText_SLOT_Callback(hObject, eventdata, handles)
% hObject    handle to editText_SLOT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editText_SLOT as text
%        str2double(get(hObject,'String')) returns contents of editText_SLOT as a double


% --- Executes during object creation, after setting all properties.
function editText_SLOT_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editText_SLOT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editText_POLE_Callback(hObject, eventdata, handles)
% hObject    handle to editText_POLE (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editText_POLE as text
%        str2double(get(hObject,'String')) returns contents of editText_POLE as a double


% --- Executes during object creation, after setting all properties.
function editText_POLE_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editText_POLE (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editText_nomCoilSpan_Callback(hObject, eventdata, handles)
% hObject    handle to editText_nomCoilSpan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editText_nomCoilSpan as text
%        str2double(get(hObject,'String')) returns contents of editText_nomCoilSpan as a double


% --- Executes during object creation, after setting all properties.
function editText_nomCoilSpan_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editText_nomCoilSpan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_design.
function pushbutton_design_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_design (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get the string in the control called handles.* and convert to double
strPOLE = get(handles.editText_POLE, 'String');
strSLOT = get(handles.editText_SLOT, 'String');
strnomCoilSpan = get(handles.editText_nomCoilSpan, 'String');
POLES = str2double(strPOLE);
SLOTS = str2double(strSLOT);
nomCoilSpan = str2double(strnomCoilSpan);
s = designMotor(POLES, SLOTS, nomCoilSpan);
phaseWinding = s{2};
rowName = {'Angle','In','Out'};
rowNamePhase = {'In','Out'};
set(handles.uitable_s1,'Data',s{1}, 'RowName',rowName);
set(handles.uitable_phaseA,'Data',phaseWinding(:,:,1), 'RowName',rowNamePhase);
set(handles.uitable_phaseB,'Data',phaseWinding(:,:,2), 'RowName',rowNamePhase);
set(handles.uitable_phaseC,'Data',phaseWinding(:,:,3), 'RowName',rowNamePhase);


% --- Executes on button press in pushbutton_reset.
function pushbutton_reset_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% set all table size to be 0x0
set(handles.uitable_s1,'Data',cell(0,0));
set(handles.uitable_phaseA,'Data',cell(0,0));
set(handles.uitable_phaseB,'Data',cell(0,0));
set(handles.uitable_phaseC,'Data',cell(0,0));