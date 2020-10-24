function undo(handles)
    struct = get(handles.data, 'UserData');
    chessboard = struct.chessboard;
    log = struct.moveLog;
    turnCount = struct.turnCount;
    if turnCount > 1
        count = turnCount -1;
        move = log(count, :);
        iniRow = move(1);
        iniCol = move(2);
        finRow = move(3);
        finCol = move(4);
        piece1 = move(5);
        piece2 = move(6);
        chessboard(iniRow, iniCol) = piece1;
        chessboard(finRow, finCol) = piece2;
        struct.turnCount = count;
        struct.chessboard = chessboard;
    end
    set(handles.data, 'UserData', struct);
end