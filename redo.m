function redo(handles)
    struct = get(handles.data, 'UserData');
    chessboard = struct.chessboard;
    log = struct.moveLog;
    [turnLength, ~] = size(log);
    turnCount = struct.turnCount;
    if (turnCount < turnLength)&&(turnCount > 0)
        count = turnCount+1;
        moveArr = log(count, :);
        iniPos = moveArr([1,2]);
        finPos = moveArr([3,4]);
        chessboard = move(chessboard, iniPos, finPos);
        
        struct.turnCount = count;
        struct.chessboard = chessboard;
        disp('Moved Piece')
    end
    set(handles.data, 'UserData', struct);
end