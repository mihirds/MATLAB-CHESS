function varargout = chessboard_gui(varargin)
% CHESSBOARD_GUI MATLAB code for chessboard_gui.fig
%      CHESSBOARD_GUI, by itself, creates a new CHESSBOARD_GUI or raises the existing
%      singleton*.
%
%      H = CHESSBOARD_GUI returns the handle to a new CHESSBOARD_GUI or the handle to
%      the existing singleton*.
%
%      CHESSBOARD_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CHESSBOARD_GUI.M with the given input arguments.
%
%      CHESSBOARD_GUI('Property','Value',...) creates a new CHESSBOARD_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before chessboard_gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to chessboard_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help chessboard_gui

% Last Modified by GUIDE v2.5 18-Apr-2017 18:27:25

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @chessboard_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @chessboard_gui_OutputFcn, ...
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


% --- Executes just before chessboard_gui is made visible.
function chessboard_gui_OpeningFcn(hObject, eventdata, handles, varargin)
%EDIT THESE VARIABLES TO APPROPRIATE VALUES
%Location of image folder (named Chess_Piece_Png)
userFilePath = '/Users/mihirshah/Documents/MATLAB/matlabChessProject-master';

%DO NOT CHANGE VARIABLE NAMES
%Read only data arrays
handles.guiArray = setGuiArray(handles);
handles.picArray = setPieces(userFilePath);

%Saves data to single structure object
%Add additional editable data here
data = struct('counter', 0, 'chessboard', createChessBoard(), 'savedPos', [0,0], 'moveLog', [], 'turnCount', 1, 'logMessage', 'Welcome to the chess game/nTurn 1: White Turn');
handles.data = 0;
set(handles.data, 'UserData', data);
%counter is coutner to determine movement
%turnCount is the turn number
%chessboard is array of pieces (mirrored on GUI)
%savedPos is the current saved position (first click on piece)
%moveLog is log of moves occurred
%logMessage is the message to be printed to the log

%Relevant Tags of Buttons and Objects:
%Buttons: A1 ~ H8, A1 = [8,1], A2 = [7,1], etc.
%log: displayLog
%20 lines, 32 characters long
%other button tags: reset: 'reset', undo: 'undo', redo: 'redo'

%displys first part of log
set(handles.displayLog, 'String', sprintf(data.logMessage));

board = makeBoard(); % constructs black and white chessboard (0 and 1)
for row = 1:8
    for col = 1:8
    posHandle = handles.guiArray(row, col);
    %removes text from buttons
    set(posHandle, 'String', '');
    % sets background to b/w depending on position in chessboard
    if board(row, col) ==0
        set(posHandle, 'BackgroundColor', 'White');
    else
        set(posHandle, 'BackgroundColor', 'Black');
    end
    end
end

set(handles.redo, 'Visible', 'Off');

%updates GUI with pieces in chessboard array
updateBoard(handles, handles.data);

% Choose default command line output for chessboard_gui
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);


% UIWAIT makes chessboard_gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = chessboard_gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in A1.
function A1_Callback(hObject, eventdata, handles)
% hObject    handle to A1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
onClick(handles, handles.data, [8,1])




% --- Executes on button press in A2.
function A2_Callback(hObject, eventdata, handles)
% hObject    handle to A2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
onClick(handles, handles.data, [7,1]);


% --- Executes on button press in A3.
function A3_Callback(hObject, eventdata, handles)
% hObject    handle to A3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
onClick(handles, handles.data, [6,1]);


% --- Executes on button press in A4.
function A4_Callback(hObject, eventdata, handles)
% hObject    handle to A4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
onClick(handles, handles.data, [5,1]);

% --- Executes on button press in A5.
function A5_Callback(hObject, eventdata, handles)
% hObject    handle to A5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
onClick(handles, handles.data, [4,1]);

% --- Executes on button press in A6.
function A6_Callback(hObject, eventdata, handles)
% hObject    handle to A6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
onClick(handles, handles.data, [3,1]);

% --- Executes on button press in A7.
function A7_Callback(hObject, eventdata, handles)
% hObject    handle to A7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
onClick(handles, handles.data, [2,1]);

% --- Executes on button press in A8.
function A8_Callback(hObject, eventdata, handles)
% hObject    handle to A8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
onClick(handles, handles.data, [1,1]);

% --- Executes on button press in B1.
function B1_Callback(hObject, eventdata, handles)
% hObject    handle to B1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
onClick(handles, handles.data, [8,2]);

% --- Executes on button press in B2.
function B2_Callback(hObject, eventdata, handles)
% hObject    handle to B2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
onClick(handles, handles.data, [7,2]);

% --- Executes on button press in B3.
function B3_Callback(hObject, eventdata, handles)
% hObject    handle to B3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
onClick(handles, handles.data, [6,2]);

% --- Executes on button press in B4.
function B4_Callback(hObject, eventdata, handles)
% hObject    handle to B4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
onClick(handles, handles.data, [5,2]);

% --- Executes on button press in B5.
function B5_Callback(hObject, eventdata, handles)
% hObject    handle to B5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
onClick(handles, handles.data, [4,2]);

% --- Executes on button press in B6.
function B6_Callback(hObject, eventdata, handles)
% hObject    handle to B6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
onClick(handles, handles.data, [3,2]);

% --- Executes on button press in B7.
function B7_Callback(hObject, eventdata, handles)
% hObject    handle to B7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
onClick(handles, handles.data, [2,2]);

% --- Executes on button press in B8.
function B8_Callback(hObject, eventdata, handles)
% hObject    handle to B8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
onClick(handles, handles.data, [1,2]);

% --- Executes on button press in C1.
function C1_Callback(hObject, eventdata, handles)
% hObject    handle to C1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
onClick(handles, handles.data, [8,3]);

% --- Executes on button press in C2.
function C2_Callback(hObject, eventdata, handles)
% hObject    handle to C2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
onClick(handles, handles.data, [7,3]);

% --- Executes on button press in C3.
function C3_Callback(hObject, eventdata, handles)
% hObject    handle to C3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
onClick(handles, handles.data, [6,3]);

% --- Executes on button press in C4.
function C4_Callback(hObject, eventdata, handles)
% hObject    handle to C4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
onClick(handles, handles.data, [5,3]);

% --- Executes on button press in C5.
function C5_Callback(hObject, eventdata, handles)
% hObject    handle to C5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
onClick(handles, handles.data, [4,3]);

% --- Executes on button press in C6.
function C6_Callback(hObject, eventdata, handles)
% hObject    handle to C6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
onClick(handles, handles.data, [3,3]);

% --- Executes on button press in C7.
function C7_Callback(hObject, eventdata, handles)
% hObject    handle to C7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
onClick(handles, handles.data, [2,3]);

% --- Executes on button press in C8.
function C8_Callback(hObject, eventdata, handles)
% hObject    handle to C8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
onClick(handles, handles.data, [1,3]);

% --- Executes on button press in D1.
function D1_Callback(hObject, eventdata, handles)
% hObject    handle to D1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
onClick(handles, handles.data, [8,4]);

% --- Executes on button press in D2.
function D2_Callback(hObject, eventdata, handles)
% hObject    handle to D2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
onClick(handles, handles.data, [7,4]);

% --- Executes on button press in D3.
function D3_Callback(hObject, eventdata, handles)
% hObject    handle to D3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
onClick(handles, handles.data, [6,4]);

% --- Executes on button press in D4.
function D4_Callback(hObject, eventdata, handles)
% hObject    handle to D4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
onClick(handles, handles.data, [5,4]);

% --- Executes on button press in D5.
function D5_Callback(hObject, eventdata, handles)
% hObject    handle to D5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
onClick(handles, handles.data, [4,4]);

% --- Executes on button press in D6.
function D6_Callback(hObject, eventdata, handles)
% hObject    handle to D6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
onClick(handles, handles.data, [3,4]);

% --- Executes on button press in D7.
function D7_Callback(hObject, eventdata, handles)
% hObject    handle to D7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
onClick(handles, handles.data, [2,4]);

% --- Executes on button press in D8.
function D8_Callback(hObject, eventdata, handles)
% hObject    handle to D8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
onClick(handles, handles.data, [1,4]);

% --- Executes on button press in E1.
function E1_Callback(hObject, eventdata, handles)
% hObject    handle to E1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
onClick(handles, handles.data, [8,5]);

% --- Executes on button press in E2.
function E2_Callback(hObject, eventdata, handles)
% hObject    handle to E2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
onClick(handles, handles.data, [7,5]);

% --- Executes on button press in E3.
function E3_Callback(hObject, eventdata, handles)
% hObject    handle to E3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
onClick(handles, handles.data, [6,5]);

% --- Executes on button press in E4.
function E4_Callback(hObject, eventdata, handles)
% hObject    handle to E4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
onClick(handles, handles.data, [5,5]);

% --- Executes on button press in E5.
function E5_Callback(hObject, eventdata, handles)
% hObject    handle to E5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
onClick(handles, handles.data, [4,5]);

% --- Executes on button press in E6.
function E6_Callback(hObject, eventdata, handles)
% hObject    handle to E6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
onClick(handles, handles.data, [3,5]);

% --- Executes on button press in E7.
function E7_Callback(hObject, eventdata, handles)
% hObject    handle to E7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
onClick(handles, handles.data, [2,5]);

% --- Executes on button press in E8.
function E8_Callback(hObject, eventdata, handles)
% hObject    handle to E8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
onClick(handles, handles.data, [1,5]);

% --- Executes on button press in F1.
function F1_Callback(hObject, eventdata, handles)
% hObject    handle to F1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
onClick(handles, handles.data, [8,6]);

% --- Executes on button press in F2.
function F2_Callback(hObject, eventdata, handles)
% hObject    handle to F2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
onClick(handles, handles.data, [7,6]);

% --- Executes on button press in F3.
function F3_Callback(hObject, eventdata, handles)
% hObject    handle to F3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
onClick(handles, handles.data, [6,6]);

% --- Executes on button press in F4.
function F4_Callback(hObject, eventdata, handles)
% hObject    handle to F4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
onClick(handles, handles.data, [5,6]);

% --- Executes on button press in F5.
function F5_Callback(hObject, eventdata, handles)
% hObject    handle to F5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
onClick(handles, handles.data, [4,6]);

% --- Executes on button press in F6.
function F6_Callback(hObject, eventdata, handles)
% hObject    handle to F6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
onClick(handles, handles.data, [3,6]);

% --- Executes on button press in F7.
function F7_Callback(hObject, eventdata, handles)
% hObject    handle to F7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
onClick(handles, handles.data, [2,6]);

% --- Executes on button press in F8.
function F8_Callback(hObject, eventdata, handles)
% hObject    handle to F8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
onClick(handles, handles.data, [1,6]);

% --- Executes on button press in G1.
function G1_Callback(hObject, eventdata, handles)
% hObject    handle to G1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
onClick(handles, handles.data, [8,7]);

% --- Executes on button press in G2.
function G2_Callback(hObject, eventdata, handles)
% hObject    handle to G2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
onClick(handles, handles.data, [7,7]);

% --- Executes on button press in G3.
function G3_Callback(hObject, eventdata, handles)
% hObject    handle to G3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
onClick(handles, handles.data, [6,7]);

% --- Executes on button press in G4.
function G4_Callback(hObject, eventdata, handles)
% hObject    handle to G4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
onClick(handles, handles.data, [5,7]);

% --- Executes on button press in G5.
function G5_Callback(hObject, eventdata, handles)
% hObject    handle to G5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
onClick(handles, handles.data, [4,7]);

% --- Executes on button press in G6.
function G6_Callback(hObject, eventdata, handles)
% hObject    handle to G6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
onClick(handles, handles.data, [3,7]);

% --- Executes on button press in G7.
function G7_Callback(hObject, eventdata, handles)
% hObject    handle to G7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
onClick(handles, handles.data, [2,7]);

% --- Executes on button press in G8.
function G8_Callback(hObject, eventdata, handles)
% hObject    handle to G8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
onClick(handles, handles.data, [1,7]);

% --- Executes on button press in H1.
function H1_Callback(hObject, eventdata, handles)
% hObject    handle to H1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
onClick(handles, handles.data, [8,8]);

% --- Executes on button press in H2.
function H2_Callback(hObject, eventdata, handles)
% hObject    handle to H2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
onClick(handles, handles.data, [7,8]);

% --- Executes on button press in H3.
function H3_Callback(hObject, eventdata, handles)
% hObject    handle to H3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
onClick(handles, handles.data, [6,8]);

% --- Executes on button press in H4.
function H4_Callback(hObject, eventdata, handles)
% hObject    handle to H4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
onClick(handles, handles.data, [5,8]);

% --- Executes on button press in H5.
function H5_Callback(hObject, eventdata, handles)
% hObject    handle to H5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
onClick(handles, handles.data, [4,8]);

% --- Executes on button press in H6.
function H6_Callback(hObject, eventdata, handles)
% hObject    handle to H6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
onClick(handles, handles.data, [3,8]);

% --- Executes on button press in H7.
function H7_Callback(hObject, eventdata, handles)
% hObject    handle to H7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
onClick(handles, handles.data, [2,8]);

% --- Executes on button press in H8.
function H8_Callback(hObject, eventdata, handles)
% hObject    handle to H8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
onClick(handles, handles.data, [1,8]);

% --- Executes on button press in reset.
function reset_Callback(hObject, eventdata, handles)
% hObject    handle to reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
struct = get(handles.data, 'UserData');
struct.chessboard = createChessBoard();
struct.logMessage = 'Welcome to the chess game/nTurn 1: White Turn';
struct.turnCount = 1;
struct.moveLog = [];
set(handles.displayLog, 'String', sprintf(struct.logMessage));
set(handles.data, 'UserData', struct);
updateBoard(handles, handles.data);


% --- Executes on button press in undo.
function undo_Callback(hObject, eventdata, handles)
% hObject    handle to undo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
undo(handles);
updateBoard(handles, handles.data);



% --- Executes on button press in redo.
function redo_Callback(hObject, eventdata, handles)
% hObject    handle to redo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
redo(handles)
updateBoard(handles, handles.data);