function varargout = Activida_op(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Activida_op_OpeningFcn, ...
                   'gui_OutputFcn',  @Activida_op_OutputFcn, ...
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



% --- Executes just before Activida_op is made visible.

function Activida_op_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
global volume
addpath('func/');
V = load_nii('image00CompleteMASK.nii');
volume=V.img;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Activida_op wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Activida_op_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
handles.slider1 = get(hObject,'Value');
indSlide = round(handles.slider1)

function slider1_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in l1.
function l1_Callback(hObject, eventdata, handles)
% hObject    handle to l1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of l1
if get(hObject,'Value')==1
    [x1,y1]=ginput(1);
    a=round(get(handles.slider7,'Value'))+1;
    tex1=strcat('(',num2str(round(x1)),',',num2str(round(y1)),',',num2str(a),')');
    set(handles.text3,'String',tex1);
else
    set(handles.text3,'String','');
end

% --- Executes on button press in l2.
function l2_Callback(hObject, eventdata, handles)
% hObject    handle to l2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of l2
if get(hObject,'Value')==1
    [x2,y2]=ginput(1);
    b=round(get(handles.slider6,'Value'))+1;
    tex2=strcat('(',num2str(round(x2)),',',num2str(b),',',num2str(round(y2)),')');
    set(handles.text5,'String',tex2);
else
    set(handles.text5,'String','');
end

% --- Executes on button press in l3.
function l3_Callback(hObject, eventdata, handles)
% hObject    handle to l3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of l3
if get(hObject,'Value')==1
    [x3,y3]=ginput(1);
    c=round(get(handles.slider8,'Value'))+1;
    tex3=strcat('(',num2str(c),',',num2str(round(x3)),',',num2str(round(y3)),')');
    set(handles.text13,'String',tex3);
else
    set(handles.text13,'String','');
end



% --- Executes on slider movement.
function slider6_Callback(hObject, eventdata, handles)
% hObject    handle to slider6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
b = round(get(handles.slider6,'Value'))+1;
com=get(handles.mv2,'String');
com=str2num(com);
if com~=b
    global volume
    set(handles.mv2,'String',num2str(b));
    axes(handles.axes9);
    im2(:,:)=volume(:,b,:);
    imshow(im2);
    title('CORTE SAGITAL')
    
end

% --- Executes during object creation, after setting all properties.
function slider6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider7_Callback(hObject, eventdata, handles)
% hObject    handle to slider7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
a = round(get(handles.slider7,'Value'))+1;
com=get(handles.mv1,'String');
com=str2num(com);
if com~=a
    global volume
    set(handles.mv1,'String',num2str(a));
    axes(handles.axes1);
    im(:,:)=volume(:,:,a);
    imshow(im);
    title('CORTE CORONAL')
    
end




% --- Executes during object creation, after setting all properties.
function slider7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider8_Callback(hObject, eventdata, handles)
% hObject    handle to slider8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
c = round(get(handles.slider8,'Value'))+1;
com=get(handles.mv3,'String');
com=str2num(com);
if com~=c
    global volume
    set(handles.mv3,'String',num2str(c));
    axes(handles.axes10);
    im3(:,:)=volume(c,:,:);
    imshow(im3);
    title('CORTE TRANSVERSAL')
    
end


function slider8_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function axes1_CreateFcn(hObject, eventdata, handles)

function axes10_CreateFcn(hObject, eventdata, handles)

function axes9_CreateFcn(hObject, eventdata, handles)
