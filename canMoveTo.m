function bool = canMoveTo(chessboard, iniPos, finPos)
%checks if piece in posIni has no issues if it were to move to posFin
%does not check obstructions, movement limitations
    iniRow = iniPos(1);
    iniCol = iniPos(2);
    finRow = finPos(1);
    finCol = finPos(2);
    piece1 = chessboard(iniRow, iniCol);
    piece2 = chessboard(finRow, finCol);
    if (piece1 > 0) && (piece2 > 0)
        bool = false;
    elseif (piece1 < 0) && (piece2 < 0)
        bool = false;
    else
        bool = true;
    end
end