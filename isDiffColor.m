function bool = isDiffColor(chessboard, iniPos, finPos)
%Returns true if there are pieces in iniPos and finPos and they are
%different colors
    iniRow = iniPos(1);
    iniCol = iniPos(2);
    finRow = finPos(1);
    finCol = finPos(2);
    
    piece1 = chessboard(iniRow, iniCol);
    piece2 = chessboard(finRow, finCol);
    
    if (piece1 < 0 && piece2 > 0)||(piece1 > 0 && piece2 < 0)
        bool = true;
    else
        bool = false;
    end
end