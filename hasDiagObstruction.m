function bool = hasDiagObstruction(chessboard, iniPos, finPos)
%returns true if there is NO piece between the diagonal iniPos and finPos
%does not check diagonal, use after "isDiagonal"
%does not check finPos for piece
%returns error if iniPos = finPos;
    iniRow = iniPos(1);
    iniCol = iniPos(2);
    finRow = finPos(1);
    finCol = finPos(2); 
    
    deltaRow = finRow - iniRow;
    deltaCol = finCol - iniCol;
    
    changeRow = deltaRow/abs(deltaRow);
    changeCol = deltaCol/abs(deltaCol);
    
    bool = false;
    
    for i = 1:(abs(deltaRow)-1)
        row = iniRow + changeRow*i;
        col = iniCol + changeCol*i;
        piece = chessboard(row, col);
        if piece ~= 0
            bool = true;
        end
    end
        
end