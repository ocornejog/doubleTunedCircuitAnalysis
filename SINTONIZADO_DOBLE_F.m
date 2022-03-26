function varargout = SINTONIZADO_DOBLE_F(varargin)
% SINTONIZADO_DOBLE_F MATLAB code for SINTONIZADO_DOBLE_F.fig
%      SINTONIZADO_DOBLE_F, by itself, creates a new SINTONIZADO_DOBLE_F or raises the existing
%      singleton*.
%
%      H = SINTONIZADO_DOBLE_F returns the handle to a new SINTONIZADO_DOBLE_F or the handle to
%      the existing singleton*.
%
%      SINTONIZADO_DOBLE_F('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SINTONIZADO_DOBLE_F.M with the given input arguments.
%
%      SINTONIZADO_DOBLE_F('Property','Value',...) creates a new SINTONIZADO_DOBLE_F or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SINTONIZADO_DOBLE_F_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SINTONIZADO_DOBLE_F_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SINTONIZADO_DOBLE_F

% Last Modified by GUIDE v2.5 07-Sep-2021 20:07:21

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SINTONIZADO_DOBLE_F_OpeningFcn, ...
                   'gui_OutputFcn',  @SINTONIZADO_DOBLE_F_OutputFcn, ...
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


% --- Executes just before SINTONIZADO_DOBLE_F is made visible.
function SINTONIZADO_DOBLE_F_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SINTONIZADO_DOBLE_F (see VARARGIN)

% Choose default command line output for SINTONIZADO_DOBLE_F
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes SINTONIZADO_DOBLE_F wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = SINTONIZADO_DOBLE_F_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in CALCULAR.
function CALCULAR_Callback(hObject, eventdata, handles)
% hObject    handle to CALCULAR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global L1 rb1 L2 rb2 W Q AB ABexp Beta Cu Cpi rpi Av Rb Rc

clc
L1 = str2num(get(handles.L1, 'String'));
rb1 = str2num(get(handles.rb1, 'String'));
L2 = str2num(get(handles.L2, 'String'));
rb2 = str2num(get(handles.rb2, 'String'));
W = str2num(get(handles.W, 'String'));
Q = str2num(get(handles.Q, 'String'));
AB = str2num(get(handles.AB, 'String'));
ABexp = str2num(get(handles.ABexp, 'String'));
Beta = str2num(get(handles.Beta, 'String'));
Cu = str2num(get(handles.Cu, 'String'));
Cpi = str2num(get(handles.Cpi, 'String'));

rpi = str2num(get(handles.rpi, 'String'));
Av = str2num(get(handles.Av, 'String'));
Rb = str2num(get(handles.Rb, 'String'));
Rc = str2num(get(handles.Rc, 'String'));

axes(handles.axes1)
set(handles.axes1, 'visible', 'off')
cla
C11 = num2str(round(1000/(L1*W*W),2));
C12 = num2str(round(1000/(L1*W*W),2));
C13 = num2str(round(1000/(L2*W*W),2));
C14 = num2str(round(1000/(L2*W*W),2));
C21 = num2str(round(1000/(L1*W*W),2));
C22 = num2str(round(1000/(L2*W*W),2));
C23 = num2str(round(1000/(L1*W*W),2));
C24 = num2str(round(1000/(L2*W*W),2));
R11 = num2str(round(1000000/(ABexp*str2num(C11)),2));
R12 = num2str(round(1000000/(ABexp*str2num(C12)),2));
R13 = num2str(round(1000000/(ABexp*str2num(C13)),2));
R14 = num2str(round(1000000/(ABexp*str2num(C14)),2));
P1 = strcat('$$', 'L_1 = ', char(latex(sym(L1))),'{\rightarrow}',...
    'r_{b_{1}} =', char(latex(sym(rb1))),'{\rightarrow}','L_2 = ', ...
    char(latex(sym(L1))),'{\rightarrow}','r_{b_{2}} =',char(latex(sym(rb1))), ...
    '{\rightarrow}','C_{1} =',char(latex(sym(C11))),'[nF]','{\rightarrow}', ...
    'C_{2} =',char(latex(sym(C21))),'[nF]','{\rightarrow}','R_1 = ', ...
    char(latex(sym(R11))),'[k\Omega]','$$');
text('Interpreter','latex',...
	'String',P1,...
	'Position',[0 0],...
    'FontSize',14);
axes(handles.axes4)
set(handles.axes4, 'visible', 'off')
cla
P4 = strcat('$$', 'L_1 = ', char(latex(sym(L1))),'{\rightarrow}',...
    'r_{b_{1}} =', char(latex(sym(rb1))),'{\rightarrow}','L_2 = ', ...
    char(latex(sym(L2))),'{\rightarrow}','r_{b_{2}} =',char(latex(sym(rb2))), ...
    '{\rightarrow}','C_{1} =',char(latex(sym(C12))),'[nF]','{\rightarrow}', ...
    'C_{2} =',char(latex(sym(C22))),'[nF]','{\rightarrow}','R_1 = ', ...
    char(latex(sym(R12))),'[k\Omega]','$$');
text('Interpreter','latex',...
	'String',P4,...
	'Position',[0 0],...
    'FontSize',14);
axes(handles.axes7)
set(handles.axes7, 'visible', 'off')
cla
P7 = strcat('$$', 'L_1 = ', char(latex(sym(L2))),'{\rightarrow}',...
    'r_{b_{1}} =', char(latex(sym(rb2))),'{\rightarrow}','L_2 = ', ...
    char(latex(sym(L1))),'{\rightarrow}','r_{b_{2}} =',char(latex(sym(rb1))), ...
    '{\rightarrow}','C_{1} =',char(latex(sym(C13))),'[nF]','{\rightarrow}', ...
    'C_{2} =',char(latex(sym(C23))),'[nF]','{\rightarrow}','R_1 = ', ...
    char(latex(sym(R13))),'[k\Omega]','$$');
text('Interpreter','latex',...
	'String',P7,...
	'Position',[0 0],...
    'FontSize',14);
axes(handles.axes10)
set(handles.axes10, 'visible', 'off')
cla
P10 = strcat('$$', 'L_1 = ', char(latex(sym(L2))),'{\rightarrow}',...
    'r_{b_{1}} =', char(latex(sym(rb2))),'{\rightarrow}','L_2 = ', ...
    char(latex(sym(L2))),'{\rightarrow}','r_{b_{2}} =',char(latex(sym(rb2))), ...
    '{\rightarrow}','C_{1} =',char(latex(sym(C14))),'[nF]','{\rightarrow}', ...
    'C_{2} =',char(latex(sym(C24))),'[nF]','{\rightarrow}','R_1 = ', ...
    char(latex(sym(R14))),'[k\Omega]','$$');
text('Interpreter','latex',...
	'String',P10,...
	'Position',[0 0],...
    'FontSize',14);
axes(handles.axes2)
set(handles.axes2, 'visible', 'off')
cla
R21 = num2str(round(1000000/(ABexp*str2num(C21)),2));
R22 = num2str(round(1000000/(ABexp*str2num(C22)),2));
R23 = num2str(round(1000000/(ABexp*str2num(C23)),2));
R24 = num2str(round(1000000/(ABexp*str2num(C24)),2));
R1R2inv1 = 1/((str2num(R11))*(str2num(R21))); % ---> 1/R1R2
R1R2inv2 = 1/((str2num(R12))*(str2num(R22))); % ---> 1/R1R2
R1R2inv3 = 1/((str2num(R13))*(str2num(R23))); % ---> 1/R1R2
R1R2inv4 = 1/((str2num(R14))*(str2num(R24))); % ---> 1/R1R2
evaluacion11 = (5*W*Beta*Cu)/(rpi*1000); % --> 5*gm*W*Cu
if (R1R2inv1 >= evaluacion11)
    cond11 = 'SI';
else
    cond11 = 'NO';
end
if (R1R2inv2 >= evaluacion11)
    cond12 = 'SI';
else
    cond12 = 'NO';
end 
if (R1R2inv3 >= evaluacion11)
    cond13 = 'SI';
else
    cond13 = 'NO';
end
if (R1R2inv4 >= evaluacion11)
    cond14 = 'SI';
else
    cond14 = 'NO';
end
if (strcmp(cond11,'SI')==1)
    Rs1 = num2str(round((((str2num(R11)*str2num(R21)*Beta)/(abs(Av)*rpi))-str2num(R11)),3));
    if (str2num(Rs1)>(10*str2num(R11)))
        cond21 = 'SI';
        Rbl11 = num2str(((W*W*L1*L1)/(rb1*1000)));
        Rbl21 = num2str(((W*W*L1*L1)/(rb1*1000)));
        R11p = num2str(((1/((1/str2num(R11))-(1/str2num(Rbl11))-(1/Rb)-(1/rpi)))));
        R21p = num2str(((1/((1/str2num(R21))-(1/str2num(Rbl21))-(1/Rc)))));
        CM1 = num2str((Cpi + (Cu*(Beta/rpi)*str2num(R21)))/1000);
        CM1p = num2str((Cu*((Beta/rpi)/((1/str2num(Rs1))+(1/rpi))))/1000);
        C11p = num2str(str2num(C11)-str2num(CM1));
        C21p = num2str(str2num(C21)-str2num(CM1p));
    else
        cond21 = 'NO';
        Rbl11 = 'X';
        Rbl21 = 'X';
        R11p = 'X';
        R21p = 'X';
        CM1 = 'X';
        CM1p = 'X';
        C11p = 'X';
        C21p = 'X';
    end
else
    Rs1 = 'X';
    cond21 = 'X';
    Rbl11 = 'X';
    Rbl21 = 'X';
    R11p = 'X';
    R21p = 'X';
    CM1 = 'X';
    CM1p = 'X';
    C11p = 'X';
    C21p = 'X';
end
if (strcmp(cond12,'SI')==1)
    Rs2 = num2str(round((((str2num(R12)*str2num(R22)*Beta)/(abs(Av)*rpi))-str2num(R12)),3));
    if (str2num(Rs2)>(10*str2num(R12)))
        cond22 = 'SI';
        Rbl12 = num2str(((W*W*L1*L1)/(rb1*1000)));
        Rbl22 = num2str(((W*W*L2*L2)/(rb2*1000)));
        R12p = num2str(((1/((1/str2num(R12))-(1/str2num(Rbl12))-(1/Rb)-(1/rpi)))));
        R22p = num2str(((1/((1/str2num(R22))-(1/str2num(Rbl22))-(1/Rc)))));
        CM2 = num2str((Cpi + (Cu*(Beta/rpi)*str2num(R22)))/1000);
        CM2p = num2str((Cu*((Beta/rpi)/((1/str2num(Rs2))+(1/rpi))))/1000);
        C12p = num2str(str2num(C12)-str2num(CM2));
        C22p = num2str(str2num(C22)-str2num(CM2p));
    else
        cond22 = 'NO';
        Rbl12 = 'X';
        Rbl22 = 'X';
        R12p = 'X';
        R22p = 'X';
        CM2 = 'X';
        CM2p = 'X';
        C12p = 'X';
        C22p = 'X';
    end
else
    Rs2 = 'X';
    cond22 = 'X';
    Rbl12 = 'X';
    Rbl22 = 'X';
    R12p = 'X';
    R22p = 'X';
    CM2 = 'X';
    CM2p = 'X';
    C12p = 'X';
    C22p = 'X';
end
if (strcmp(cond13,'SI')==1)
    Rs3 = num2str(round((((str2num(R13)*str2num(R23)*Beta)/(abs(Av)*rpi))-str2num(R13)),3));
    if (str2num(Rs3)>(10*str2num(R13)))
        cond23 = 'SI';
        Rbl13 = num2str(((W*W*L2*L2)/(rb2*1000)));
        Rbl23 = num2str(((W*W*L1*L1)/(rb1*1000)));
        R13p = num2str(((1/((1/str2num(R13))-(1/str2num(Rbl13))-(1/Rb)-(1/rpi)))));
        R23p = num2str(((1/((1/str2num(R23))-(1/str2num(Rbl23))-(1/Rc)))));
        CM3 = num2str((Cpi + (Cu*(Beta/rpi)*str2num(R23)))/1000);
        CM3p = num2str((Cu*((Beta/rpi)/((1/str2num(Rs3))+(1/rpi))))/1000);
        C13p = num2str(str2num(C13)-str2num(CM3));
        C23p = num2str(str2num(C23)-str2num(CM3p));
    else
        cond23 = 'NO';
        Rbl13 = 'X';
        Rbl23 = 'X';
        R13p = 'X';
        R23p = 'X';
        CM3 = 'X';
        CM3p = 'X';
        C13p = 'X';
        C23p = 'X';
    end
else
    Rs3 = 'X';
    cond23 = 'X';
    Rbl13 = 'X';
    Rbl23 = 'X';
    R13p = 'X';
    R23p = 'X';
    CM3 = 'X';
    CM3p = 'X';
    C13p = 'X';
    C23p = 'X';
end
if (strcmp(cond14,'SI')==1)
    Rs4 = num2str(round((((str2num(R14)*str2num(R24)*Beta)/(abs(Av)*rpi))-str2num(R14)),3));
    if (str2num(Rs4)>(10*str2num(R14)))
        cond24 = 'SI';
        Rbl14 = num2str(((W*W*L2*L2)/(rb2*1000)));
        Rbl24 = num2str(((W*W*L2*L2)/(rb2*1000)));
        R14p = num2str(((1/((1/str2num(R14))-(1/str2num(Rbl14))-(1/Rb)-(1/rpi)))));
        R24p = num2str(((1/((1/str2num(R24))-(1/str2num(Rbl24))-(1/Rc)))));
        CM4 = num2str((Cpi + (Cu*(Beta/rpi)*str2num(R24)))/1000);
        CM4p = num2str((Cu*((Beta/rpi)/((1/str2num(Rs4))+(1/rpi))))/1000);
        C14p = num2str(str2num(C14)-str2num(CM3));
        C24p = num2str(str2num(C24)-str2num(CM3p));
    else
        cond24 = 'NO';
        Rbl14 = 'X';
        Rbl24 = 'X';
        R14p = 'X';
        R24p = 'X';
        CM4 = 'X';
        CM4p = 'X';
        C14p = 'X';
        C24p = 'X';
    end
else
    Rs4 = 'X';
    cond24 = 'X';
    Rbl14 = 'X';
    Rbl24 = 'X';
    R14p = 'X';
    R24p = 'X';
    CM4 = 'X';
    CM4p = 'X';
    C14p = 'X';
    C24p = 'X';
end
P2 = strcat('$$','R_2 =', char(latex(sym(R21))),'[k\Omega]','{\rightarrow}','{\bf{Cnd1:}}', ...
    char(latex(sym(cond11))),'{\rightarrow}','R_s =',char(latex(sym(Rs1))), ...
    '[k\Omega]','{\rightarrow}','{\bf{Cnd2:}}',char(latex(sym(cond21))),'{\rightarrow}', ...
    'R_{b_{l_{1}}} =',char(latex(sym(Rbl11))),'[k\Omega]','{\rightarrow}', 'R_{b_{l_{2}}} =', ...
    char(latex(sym(Rbl21))),'[k\Omega]','$$');
text('Interpreter','latex',...
	'String',P2,...
	'Position',[0 0],...
    'FontSize',14);
axes(handles.axes5)
set(handles.axes5, 'visible', 'off')
cla
P5 = strcat('$$','R_2 =', char(latex(sym(R22))),'[k\Omega]','{\rightarrow}','{\bf{Cnd1:}}', ...
    char(latex(sym(cond12))),'{\rightarrow}','R_s =',char(latex(sym(Rs2))), ...
    '[k\Omega]','{\rightarrow}','{\bf{Cnd2:}}',char(latex(sym(cond22))),'{\rightarrow}', ...
    'R_{b_{l_{1}}} =',char(latex(sym(Rbl12))),'[k\Omega]','{\rightarrow}', 'R_{b_{l_{2}}} =', ...
    char(latex(sym(Rbl22))),'[k\Omega]','$$');
text('Interpreter','latex',...
	'String',P5,...
	'Position',[0 0],...
    'FontSize',14);
axes(handles.axes8)
set(handles.axes8, 'visible', 'off')
cla
P8 = strcat('$$','R_2 =', char(latex(sym(R23))),'[k\Omega]','{\rightarrow}','{\bf{Cnd1:}}', ...
    char(latex(sym(cond13))),'{\rightarrow}','R_s =',char(latex(sym(Rs3))), ...
    '[k\Omega]','{\rightarrow}','{\bf{Cnd2:}}',char(latex(sym(cond23))),'{\rightarrow}', ...
    'R_{b_{l_{1}}} =',char(latex(sym(Rbl13))),'[k\Omega]','{\rightarrow}', 'R_{b_{l_{2}}} =', ...
    char(latex(sym(Rbl23))),'[k\Omega]','$$');
text('Interpreter','latex',...
	'String',P8,...
	'Position',[0 0],...
    'FontSize',14);
axes(handles.axes11)
set(handles.axes11, 'visible', 'off')
cla
P11 = strcat('$$','R_2 =', char(latex(sym(R24))),'[k\Omega]','{\rightarrow}','{\bf{Cnd1:}}', ...
    char(latex(sym(cond14))),'{\rightarrow}','R_s =',char(latex(sym(Rs4))), ...
    '[k\Omega]','{\rightarrow}','{\bf{Cnd2:}}',char(latex(sym(cond24))),'{\rightarrow}', ...
    'R_{b_{l_{1}}} =',char(latex(sym(Rbl14))),'[k\Omega]','{\rightarrow}', 'R_{b_{l_{2}}} =', ...
    char(latex(sym(Rbl24))),'[k\Omega]','$$');
text('Interpreter','latex',...
	'String',P11,...
	'Position',[0 0],...
    'FontSize',14);
axes(handles.axes3)
set(handles.axes3, 'visible', 'off')
cla
P3 = strcat('$$',"R_{1}^{'} = ", char(latex(sym(R11p))),'[k\Omega]','{\rightarrow}',"R_{2}^{'} = ", ...
    char(latex(sym(R21p))),'[k\Omega]','{\rightarrow}','C_m =', char(latex(sym(CM1))),'[nF]',...
    '{\rightarrow}',"C_{m}^{'} = ", char(latex(sym(CM1p))),'[nF]','{\rightarrow}',"C_{1}^{'} = ",...
    char(latex(sym(C11p))),'[nF]','{\rightarrow}',"C_{2}^{'} = ",char(latex(sym(C21p))),'[nF]','$$');
text('Interpreter','latex',...
	'String',P3,...
	'Position',[0 0],...
    'FontSize',12);
axes(handles.axes6)
set(handles.axes6, 'visible', 'off')
cla
P6 = strcat('$$',"R_{1}^{'} = ", char(latex(sym(R12p))),'[k\Omega]','{\rightarrow}',"R_{2}^{'} = ", ...
    char(latex(sym(R22p))),'[k\Omega]','{\rightarrow}','C_m =', char(latex(sym(CM2))),'[nF]',...
    '{\rightarrow}',"C_{m}^{'} = ", char(latex(sym(CM2p))),'[nF]','{\rightarrow}',"C_{1}^{'} = ",...
    char(latex(sym(C12p))),'[nF]','{\rightarrow}',"C_{2}^{'} = ",char(latex(sym(C22p))),'[nF]','$$');
text('Interpreter','latex',...
	'String',P6,...
	'Position',[0 0],...
    'FontSize',12);
axes(handles.axes9)
set(handles.axes9, 'visible', 'off')
cla
P9 = strcat('$$',"R_{1}^{'} = ", char(latex(sym(R13p))),'[k\Omega]','{\rightarrow}',"R_{2}^{'} = ", ...
    char(latex(sym(R23p))),'[k\Omega]','{\rightarrow}','C_m =', char(latex(sym(CM3))),'[nF]',...
    '{\rightarrow}',"C_{m}^{'} = ", char(latex(sym(CM3p))),'[nF]','{\rightarrow}',"C_{1}^{'} = ",...
    char(latex(sym(C13p))),'[nF]','{\rightarrow}',"C_{2}^{'} = ",char(latex(sym(C23p))),'[nF]','$$');
text('Interpreter','latex',...
	'String',P9,...
	'Position',[0 0],...
    'FontSize',12);
axes(handles.axes12)
set(handles.axes12, 'visible', 'off')
cla
P12 = strcat('$$',"R_{1}^{'} = ", char(latex(sym(R14p))),'[k\Omega]','{\rightarrow}',"R_{2}^{'} = ", ...
    char(latex(sym(R24p))),'[k\Omega]','{\rightarrow}','C_m =', char(latex(sym(CM4))),'[nF]',...
    '{\rightarrow}',"C_{m}^{'} = ", char(latex(sym(CM4p))),'[nF]','{\rightarrow}',"C_{1}^{'} = ",...
    char(latex(sym(C14p))),'[nF]','{\rightarrow}',"C_{2}^{'} = ",char(latex(sym(C24p))),'[nF]','$$');
text('Interpreter','latex',...
	'String',P12,...
	'Position',[0 0],...
    'FontSize',12);
axes(handles.axes13)
if((strcmp(cond11,'SI')==1)&&(strcmp(cond21,'SI')==1))
    handles.imagen1=imread('check.png');
else
    handles.imagen1=imread('equis4.png');
end
imagesc(handles.imagen1)
axis off
axes(handles.axes14)
if((strcmp(cond12,'SI')==1)&&(strcmp(cond22,'SI')==1))
    handles.imagen2=imread('check.png');
else
    handles.imagen2=imread('equis4.png');
end
imagesc(handles.imagen2)
axis off
axes(handles.axes15)
if((strcmp(cond13,'SI')==1)&&(strcmp(cond23,'SI')==1))
    handles.imagen3=imread('check.png');
else
    handles.imagen3=imread('equis4.png');
end
imagesc(handles.imagen3)
axis off
axes(handles.axes16)
if((strcmp(cond14,'SI')==1)&&(strcmp(cond24,'SI')==1))
    handles.imagen4=imread('check.png');
else
    handles.imagen4=imread('equis4.png');
end
imagesc(handles.imagen4)
axis off
function W_Callback(hObject, eventdata, handles)
% hObject    handle to W (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of W as text
%        str2double(get(hObject,'String')) returns contents of W as a double


% --- Executes during object creation, after setting all properties.
function W_CreateFcn(hObject, eventdata, handles)
% hObject    handle to W (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Av_Callback(hObject, eventdata, handles)
% hObject    handle to Av (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Av as text
%        str2double(get(hObject,'String')) returns contents of Av as a double


% --- Executes during object creation, after setting all properties.
function Av_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Av (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function rpi_Callback(hObject, eventdata, handles)
% hObject    handle to rpi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of rpi as text
%        str2double(get(hObject,'String')) returns contents of rpi as a double


% --- Executes during object creation, after setting all properties.
function rpi_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rpi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Cu_Callback(hObject, eventdata, handles)
% hObject    handle to Cu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Cu as text
%        str2double(get(hObject,'String')) returns contents of Cu as a double


% --- Executes during object creation, after setting all properties.
function Cu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Cu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Rc_Callback(hObject, eventdata, handles)
% hObject    handle to Rc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Rc as text
%        str2double(get(hObject,'String')) returns contents of Rc as a double


% --- Executes during object creation, after setting all properties.
function Rc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Rc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Q_Callback(hObject, eventdata, handles)
% hObject    handle to Q (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Q as text
%        str2double(get(hObject,'String')) returns contents of Q as a double


% --- Executes during object creation, after setting all properties.
function Q_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Q (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Beta_Callback(hObject, eventdata, handles)
% hObject    handle to Beta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Beta as text
%        str2double(get(hObject,'String')) returns contents of Beta as a double


% --- Executes during object creation, after setting all properties.
function Beta_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Beta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Cpi_Callback(hObject, eventdata, handles)
% hObject    handle to Cpi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Cpi as text
%        str2double(get(hObject,'String')) returns contents of Cpi as a double


% --- Executes during object creation, after setting all properties.
function Cpi_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Cpi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Rb_Callback(hObject, eventdata, handles)
% hObject    handle to Rb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Rb as text
%        str2double(get(hObject,'String')) returns contents of Rb as a double


% --- Executes during object creation, after setting all properties.
function Rb_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Rb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ABexp_Callback(hObject, eventdata, handles)
% hObject    handle to ABexp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ABexp as text
%        str2double(get(hObject,'String')) returns contents of ABexp as a double


% --- Executes during object creation, after setting all properties.
function ABexp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ABexp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function AB_Callback(hObject, eventdata, handles)
% hObject    handle to AB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of AB as text
%        str2double(get(hObject,'String')) returns contents of AB as a double


% --- Executes during object creation, after setting all properties.
function AB_CreateFcn(hObject, eventdata, handles)
% hObject    handle to AB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in CALCAB.
function CALCAB_Callback(hObject, eventdata, handles)
% hObject    handle to CALCAB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global W Q

clc
W = str2num(get(handles.W, 'String'));
Q = str2num(get(handles.Q, 'String'));
AB = num2str(round(W*1000000/Q),3);
ABexp = num2str(round(1.7*W*1000000/Q),3);
set(handles.AB, 'String', AB);
set(handles.ABexp, 'String', ABexp);


function L1_Callback(hObject, eventdata, handles)
% hObject    handle to L1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of L1 as text
%        str2double(get(hObject,'String')) returns contents of L1 as a double


% --- Executes during object creation, after setting all properties.
function L1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to L1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function L2_Callback(hObject, eventdata, handles)
% hObject    handle to L2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of L2 as text
%        str2double(get(hObject,'String')) returns contents of L2 as a double


% --- Executes during object creation, after setting all properties.
function L2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to L2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function rb1_Callback(hObject, eventdata, handles)
% hObject    handle to rb1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of rb1 as text
%        str2double(get(hObject,'String')) returns contents of rb1 as a double


% --- Executes during object creation, after setting all properties.
function rb1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rb1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function rb2_Callback(hObject, eventdata, handles)
% hObject    handle to rb2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of rb2 as text
%        str2double(get(hObject,'String')) returns contents of rb2 as a double


% --- Executes during object creation, after setting all properties.
function rb2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rb2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
