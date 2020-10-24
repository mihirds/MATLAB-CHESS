function onClick(handles, dataHandle, pos)
%Code that executes upon clicking a square on board
% add all functions here

%Data required
row = pos(1);
col = pos(2);
struct = get(dataHandle, 'UserData');
piece = struct.chessboard(row,col);
count = struct.counter + 1;
logArr = struct.savedPos == pos;
notSamePos = 1 - floor((logArr(1)+logArr(2))/2);
if (piece > 0)
    pieceColor = 'White';
elseif (piece < 0)
    pieceColor = 'Black';
else
    pieceColor = 'None';
end


if (count == 1)&&(piece ~=0)&&(isPlayerTurn(pieceColor,dataHandle)) %first click, saves data if square is occupied
    struct.savedPos = pos;
    struct.counter = 1;
    set(dataHandle, 'UserData', struct);
    updateBoard(handles, dataHandle);
    highlightPiece(handles, pos, 'green');
    highlightOptions(handles, struct.chessboard, pos);
elseif (count == 2)&&notSamePos&&canMove(struct.chessboard, struct.savedPos, pos) % moves piece to new position, if position is new
    chessboard = struct.chessboard;
    initPos = struct.savedPos;
    struct.moveLog = logMove(struct.turnCount,chessboard,initPos,pos, struct.moveLog);
    newBoard = move(chessboard, initPos, pos);
    struct.chessboard = newBoard;
    %update log function
    struct.counter = 0;
    struct.savedPos = [0,0];
    
    %Displayes turn and stuff. Keep this for now
    %determines color turn
    currentTurn = struct.turnCount + 1;
    struct.turnCount = currentTurn;
    
    logString = makeMessageLog(struct.moveLog);
    
    set(handles.displayLog, 'String', sprintf(logString));
    set(dataHandle, 'UserData', struct);
    updateBoard(handles, dataHandle);
else
    struct.savedPos = [0,0];
    struct.counter = 0;
    set(dataHandle, 'UserData', struct);
    updateBoard(handles, dataHandle);
end
%sets data and updates GUI

end