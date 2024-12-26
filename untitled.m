function varargout = untitled(varargin)
% UNTITLED MATLAB code for untitled.fig
%      UNTITLED, by itself, creates a new UNTITLED or raises the existing
%      singleton*.
%
%      H = UNTITLED returns the handle to a new UNTITLED or the handle to
%      the existing singleton*.
%
%      UNTITLED('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNTITLED.M with the given input arguments.
%
%      UNTITLED('Property','Value',...) creates a new UNTITLED or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitled_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitled_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitled

% Last Modified by GUIDE v2.5 25-Dec-2024 03:34:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled_OutputFcn, ...
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


% --- Executes just before untitled is made visible.
function untitled_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitled (see VARARGIN)

% Choose default command line output for untitled
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes untitled wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = untitled_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Upload_image.
function Upload_image_Callback(hObject, eventdata, handles)
global X
global i
X=uigetfile('*.*');
X=imread(X);
i=X;
axes(handles.axes1);
imshow(X);

% --- Executes on button press in Rgb_to_Gray.
function Rgb_to_Gray_Callback(hObject, eventdata, handles)
global X
A=RGB2GRAY(X,1);
X=A;
axes(handles.axes2);
imshow(X)

% --- Executes on button press in Rgb_to_Binary.
function Rgb_to_Binary_Callback(hObject, eventdata, handles)
global X
A=rgb2bin(X);
X=A;
axes(handles.axes2);
imshow(X)


% --- Executes on button press in Gray_to_Binary.
function Gray_to_Binary_Callback(hObject, eventdata, handles)
global X
A=gray2bin(X);
X=A;
axes(handles.axes2);
imshow(X)


% --- Executes on button press in histogram.
function histogram_Callback(hObject, eventdata, handles)
global X
axes(handles.axes2);
histogram_rgb_gray(X);



% --- Executes on button press in Contrast_streching.
function Contrast_streching_Callback(hObject, eventdata, handles)
global X
A=contrast_stretcing(X);
X=A;
axes(handles.axes2);
imshow(X)


% --- Executes on button press in Equalization.
function Equalization_Callback(hObject, eventdata, handles)
global X
axes(handles.axes2);
histogram_equalization(X);


% --- Executes on button press in Brightness.
function Brightness_Callback(hObject, eventdata, handles)
global X
A=Brightness(X,128);
X=A;
axes(handles.axes2);
imshow(X)


% --- Executes on button press in Negative.
function Negative_Callback(hObject, eventdata, handles)
global X
A=negative(X);
X=A;
axes(handles.axes2);
imshow(X)


% --- Executes on button press in Log.
function Log_Callback(hObject, eventdata, handles)
global X
A=LOG_EXP(X);
X=A;
axes(handles.axes2);
imshow(X)



% --- Executes on button press in in_Log.
function in_Log_Callback(hObject, eventdata, handles)
global X
axes(handles.axes2);
in_LOG_EXP(X);



% --- Executes on button press in Power.
function Power_Callback(hObject, eventdata, handles)
global X
A=powers(X,1.6);
X=A;
axes(handles.axes2);
imshow(X)


% --- Executes on button press in Darkness.
function Darkness_Callback(hObject, eventdata, handles)
global X
A=Darkness(X,160);
X=A;
axes(handles.axes2);
imshow(X)



% --- Executes on button press in Root.
function Root_Callback(hObject, eventdata, handles)
global X
A=root(X);
X=A;
axes(handles.axes2);
imshow(X)


% --- Executes on button press in Avarage.
function Avarage_Callback(hObject, eventdata, handles)
global X
w=fspecial('average', [3 3]);
A=imfilter(X,w);
X = A;
axes(handles.axes2);
imshow(X)


% --- Executes on button press in Min.
function Min_Callback(hObject, eventdata, handles)
global X
axes(handles.axes2);
min_filter(X);

% --- Executes on button press in Max.
function Max_Callback(hObject, eventdata, handles)
global X
axes(handles.axes2);
max_filter(X);


% --- Executes on button press in Madian.
function Madian_Callback(hObject, eventdata, handles)
global X
X=imnoise(X,'salt & pepper',0.02);
axes(handles.axes1);
imshow(X)
axes(handles.axes2);
median_filter(X);


% --- Executes on button press in Reset.
function Reset_Callback(hObject, eventdata, handles)
cla(handles.axes1,'reset')
cla(handles.axes2,'reset')


% --- Executes on button press in Back.
function Back_Callback(hObject, eventdata, handles)
global X
global i
cla(handles.axes1,'reset')
cla(handles.axes2,'reset')
X=i;
axes(handles.axes1);
imshow(X);


% --- Executes on button press in idle_high.
function idle_high_Callback(hObject, eventdata, handles)
global X
A = idealhigh(X,50);
X = A;
axes(handles.axes2);
imshow(X)


% --- Executes on button press in idle_low.
function idle_low_Callback(hObject, eventdata, handles)
global X
A = ideal_low(X,50);
X = A;
axes(handles.axes2);
imshow(X)


% --- Executes on button press in Butterworth_high.
function Butterworth_high_Callback(hObject, eventdata, handles)
global X
A = butterworth_high(X,30,3);
X = A;
axes(handles.axes2);
imshow(X)


% --- Executes on button press in Butterworth_low.
function Butterworth_low_Callback(hObject, eventdata, handles)
global X
A = butterworth_low(X,30,2);
X = A;
axes(handles.axes2);
imshow(X)


% --- Executes on button press in Gaussin_high.
function Gaussin_high_Callback(hObject, eventdata, handles)
global X
A = gaussian_high(X,20);
X = A;
axes(handles.axes2);
imshow(X)


% --- Executes on button press in Gaussin_low.
function Gaussin_low_Callback(hObject, eventdata, handles)
global X
A = gaussian_low(X,25);
X = A;
axes(handles.axes2);
imshow(X)


% --- Executes on button press in idle_high_RGB.
function idle_high_RGB_Callback(hObject, eventdata, handles)
global X
axes(handles.axes2);
ideal_high_rgb(X,20);


% --- Executes on button press in idle_low_RGB.
function idle_low_RGB_Callback(hObject, eventdata, handles)
global X
axes(handles.axes2);
ideal_low_rgb(X,20);


% --- Executes on button press in Butterworth_H_RGB.
function Butterworth_H_RGB_Callback(hObject, eventdata, handles)
global X
axes(handles.axes2);
butterworth_h_RGB(X,20,1);


% --- Executes on button press in Butterworth_L_RGB.
function Butterworth_L_RGB_Callback(hObject, eventdata, handles)
global X
axes(handles.axes2);
butterworth_l_RGB(X,20,1);


% --- Executes on button press in Gaussin_H_RGB.
function Gaussin_H_RGB_Callback(hObject, eventdata, handles)
global X
axes(handles.axes2);
gaussian_rgb_high(X,20);


% --- Executes on button press in Gaussin_L_RGB.
function Gaussin_L_RGB_Callback(hObject, eventdata, handles)
global X
axes(handles.axes2);
gaussian_rgb_low(X,20);


% --- Executes on button press in Fourier_transform.
function Fourier_transform_Callback(hObject, eventdata, handles)
global X
axes(handles.axes2);
fourier_transform(X)


% --- Executes on button press in inverse_fourier.
function inverse_fourier_Callback(hObject, eventdata, handles)
global X
axes(handles.axes2);
inverse_fourier_transform(X)


% --- Executes on button press in Exponential_Noise.
function Exponential_Noise_Callback(hObject, eventdata, handles)
global X
axes(handles.axes2);
exp_noise(X,50)


% --- Executes on button press in Gaussian_Noise.
function Gaussian_Noise_Callback(hObject, eventdata, handles)
global X
A =  Gaussian_Normal_Noise(X,5,12);
X = A;
axes(handles.axes2);
imshow(X)


% --- Executes on button press in Gamma_Noise.
function Gamma_Noise_Callback(hObject, eventdata, handles)
global X
axes(handles.axes2);
gamma_noise(X,100,100);


% --- Executes on button press in Uniform_Noise.
function Uniform_Noise_Callback(hObject, eventdata, handles)
global X
axes(handles.axes2);
uniformNoise(X,100,100,100);


% --- Executes on button press in Ryligh_Noise.
function Ryligh_Noise_Callback(hObject, eventdata, handles)
global X
axes(handles.axes2);
rayligh_noise(X,100,100);


% --- Executes on button press in Salt_Peper_Noise.
function Salt_Peper_Noise_Callback(hObject, eventdata, handles)
global X
A = salt_peper(X,0.3,0.4);
X = A;
axes(handles.axes2);
imshow(X)


% --- Executes on button press in Mid_point.
function Mid_point_Callback(hObject, eventdata, handles)
global X
axes(handles.axes2);
MidPoint(X);


% --- Executes on button press in Madian_RGB.
function Madian_RGB_Callback(hObject, eventdata, handles)
global X
X=imnoise(X,'salt & pepper',0.02);
axes(handles.axes1);
imshow(X)
axes(handles.axes2);
median_filter_rgb(X);


% --- Executes on button press in point_detection.
function point_detection_Callback(hObject, eventdata, handles)
global X

axes(handles.axes2);
PointDetection(X);


% --- Executes on button press in weight_filter.
function weight_filter_Callback(hObject, eventdata, handles)
global X
axes(handles.axes2);
weight(X)


% --- Executes on button press in point_sharpining.
function point_sharpining_Callback(hObject, eventdata, handles)
global X
axes(handles.axes2);
PointSharpening(X);


% --- Executes on button press in correlation.
function correlation_Callback(hObject, eventdata, handles)
global X
axes(handles.axes2);
co(X);


% --- Executes on button press in convolution.
function convolution_Callback(hObject, eventdata, handles)
global X
axes(handles.axes2);
conv(X);


% --- Executes on button press in uniform_RGB.
function uniform_RGB_Callback(hObject, eventdata, handles)
global X
axes(handles.axes2);
uniformNoise_rgb(X,200,200,200);





% --- Executes on button press in sobel.
function sobel_Callback(hObject, eventdata, handles)
% hObject    handle to sobel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(handles.horizontal, 'Value') == 1
    choice = 'h';  % Horizontal Sobel filter
elseif get(handles.vertical, 'Value') == 1
    choice = 'v';  % Vertical Sobel filter
elseif get(handles.diagonal_right, 'Value') == 1
    choice = 'rd';  % Right Diagonal Sobel filter
elseif get(handles.diagonal_left, 'Value') == 1
    choice = 'ld';  % Left Diagonal Sobel filter
else
    errordlg('Please select a Sobel filter type', 'Error');
    return;
end

% Ensure you have an image in global X or another source
global X;

% Call the Sobel function with the chosen filter
sharp = sobel(X, choice);

% Display the output in axes2
axes(handles.axes2);
imshow(sharp);


% --- Executes on button press in Horizontal1.
function horizontal_Callback(hObject, eventdata, handles)
% hObject    handle to Horizontal1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Horizontal1


% --- Executes on button press in Vertical1.
function vertical_Callback(hObject, eventdata, handles)
% hObject    handle to Vertical1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Vertical1


% --- Executes on button press in diagonal_left1.
function diagonal_left_Callback(hObject, eventdata, handles)
% hObject    handle to diagonal_left1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of diagonal_left1


% --- Executes on button press in diagonal_right1.
function diagonal_right_Callback(hObject, eventdata, handles)
% hObject    handle to diagonal_right1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of diagonal_right1


% --- Executes on button press in Vertical1.
function Vertical1_Callback(hObject, eventdata, handles)
% hObject    handle to Vertical1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Vertical1


% --- Executes on button press in Diagonal_left1.
function Diagonal_left1_Callback(hObject, eventdata, handles)
% hObject    handle to Diagonal_left1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Diagonal_left1


% --- Executes on button press in Diagonal_right1.
function Diagonal_right1_Callback(hObject, eventdata, handles)
% hObject    handle to Diagonal_right1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Diagonal_right1





% --- Executes on button press in HighBoost.
function HighBoost_Callback(hObject, eventdata, handles)
% hObject    handle to HighBoost (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(handles.Horizontal1, 'Value') == 1
    choice = 'horizontal' ;  % H
elseif get(handles.Vertical1, 'Value') == 1
    choice = 'vertical';  % V
elseif get(handles.Diagonal_right1, 'Value') == 1
    choice = 'diagonal_right';  % DR
elseif get(handles.Diagonal_left1, 'Value') == 1
    choice = 'diagonal_left';  % DL
elseif get(handles.All, 'Value') == 1
    choice = 'all';  % all
else
    errordlg('Please select a highboost direcion', 'Error');
    return;
end

global X

% Get the boost factor value from the input field (edit_boost_factor)
boost_factor = str2double(get(handles.edit_boost_factor, 'String'));

% Check if the input is a valid number
if isnan(boost_factor) || boost_factor <= 0
    % If invalid, show an error message and return
    errordlg('Please enter a valid boost factor (positive number)', 'Invalid Input');
    return;
end

% Perform the high-boost filtering operation by calling the custom function 'highBoostFilter'
sharpened_image = highBoostFilter(X, boost_factor,choice);

% Display the sharpened image in axes2
axes(handles.axes2);
imshow(sharpened_image);


% --- Executes on button press in Horizontal1.
function Horizontal1_Callback(hObject, eventdata, handles)
% hObject    handle to Horizontal1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Horizontal1



function edit_boost_factor_Callback(hObject, eventdata, handles)
% hObject    handle to edit_boost_factor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_boost_factor as text
%        str2double(get(hObject,'String')) returns contents of edit_boost_factor as a double


% --- Executes during object creation, after setting all properties.
function edit_boost_factor_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_boost_factor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in multiply.
function multiply_Callback(hObject, eventdata, handles)
% hObject    handle to multiply (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global X
A=multiply(X,25);
X=A;
axes(handles.axes2);
imshow(X)


% --- Executes on button press in division.
function division_Callback(hObject, eventdata, handles)
% hObject    handle to division (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global X
A=divide(X,8);
X=A;
axes(handles.axes2);
imshow(X)


% --- Executes on button press in mean.
function mean_Callback(hObject, eventdata, handles)
% hObject    handle to mean (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global X
axes(handles.axes2);
mean_filter(X);
