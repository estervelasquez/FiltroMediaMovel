function varargout = mediamovel(varargin)
% MEDIAMOVEL MATLAB code for mediamovel.fig
%      MEDIAMOVEL, by itself, creates a new MEDIAMOVEL or raises the existing
%      singleton*.
%
%      H = MEDIAMOVEL returns the handle to a new MEDIAMOVEL or the handle to
%      the existing singleton*.
%
%      MEDIAMOVEL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MEDIAMOVEL.M with the given input arguments.
%
%      MEDIAMOVEL('Property','Value',...) creates a new MEDIAMOVEL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before mediamovel_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to mediamovel_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help mediamovel

% Last Modified by GUIDE v2.5 10-Jun-2021 10:46:24

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @mediamovel_OpeningFcn, ...
    'gui_OutputFcn',  @mediamovel_OutputFcn, ...
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


% --- Executes just before mediamovel is made visible.
    function mediamovel_OpeningFcn(hObject, eventdata, handles, varargin)
        % This function has no output args, see OutputFcn.
        % hObject    handle to figure
        % eventdata  reserved - to be defined in a future version of MATLAB
        % handles    structure with handles and user data (see GUIDATA)
        % varargin   command line arguments to mediamovel (see VARARGIN)
        
        % Choose default command line output for mediamovel
        handles.output = hObject;
        
        % Update handles structure
        guidata(hObject, handles);
        axes(handles.axes5)
imshow('LogoGUI.png')
        % UIWAIT makes mediamovel wait for user response (see UIRESUME)
        % uiwait(handles.figure1);
        
        
        % --- Outputs from this function are returned to the command line.
        function varargout = mediamovel_OutputFcn(hObject, eventdata, handles)
            % varargout  cell array for returning output args (see VARARGOUT);
            % hObject    handle to figure
            % eventdata  reserved - to be defined in a future version of MATLAB
            % handles    structure with handles and user data (see GUIDATA)
            
            % Get default command line output from handles structure
            varargout{1} = handles.output;
            
            




function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double
m1 = str2double(get(handles.edit1,'String'))
    m2 = str2double(get(handles.edit2,'String'))
 
    
    n = -30:1:30;
    tam = length(n)
    h = zeros(1,tam)
    
%%%Resposta ao impulso
if abs(m2)<abs(m1)
    a = m1;
    m1=m2;
    m2=a;
end

    for j=1:tam
        
           if (n(j)>=-m1) & (n(j)<=m2)
            h(j) = 1/(m1+m2+1)

        end
        
        
    end
    
%% Resposta ao Degrau
s = zeros(1,tam);
soma = 0;

for k=1:tam
    soma = soma + h(k);
    s(k) = soma;
end

%% Frequencia

omega = -2*pi:0.01:2*pi;
Hw = 1/(m1+m2+1).*exp(i.*omega.*((m1-m2)/2)).*sin(omega.*((m1+m2+1)/2))./sin(omega/2);
    
stem(handles.axes1,n,h)
stem(handles.axes2,n,s)
plot(handles.axes3,omega,abs(Hw))
plot(handles.axes4,omega,angle(Hw))


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double
    m1 = str2double(get(handles.edit1,'String'))
    m2 = str2double(get(handles.edit2,'String'))
 
    
    n = -30:1:30;
    tam = length(n)
    h = zeros(1,tam)
    
%%%Resposta ao impulso
if abs(m2)<abs(m1)
    a = m1;
    m1=m2;
    m2=a;
end

    for j=1:tam
        
           if (n(j)>=-m1) & (n(j)<=m2)
            h(j) = 1/(m1+m2+1)

        end
        
        
    end
    
%% Resposta ao Degrau
s = zeros(1,tam);
soma = 0;

for k=1:tam
    soma = soma + h(k);
    s(k) = soma;
end

%% Frequencia

omega = -2*pi:0.01:2*pi;
Hw = 1/(m1+m2+1).*exp(i.*omega.*((m1-m2)/2)).*sin(omega.*((m1+m2+1)/2))./sin(omega/2);
    
stem(handles.axes1,n,h)
stem(handles.axes2,n,s)
plot(handles.axes3,omega,abs(Hw))
plot(handles.axes4,omega,angle(Hw))


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
