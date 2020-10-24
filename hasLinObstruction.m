function bool = hasLinObstruction(chessboard, iniPos, finPos)
% returns true if there is an obstruction between iniPos and finPos
%iniPos and finPos must pass isLinear, otherwise returns false
    iniRow = iniPos(1);
    iniCol = iniPos(2);
    finRow = finPos(1);
    finCol = finPos(2); 
    
    deltaRow = finRow - iniRow;
    deltaCol = finCol - iniCol;
    
    bool = false;
    
    if deltaRow == 0 %horizontal
        changeCol = deltaCol/abs(deltaCol);
        for col = (iniCol+changeCol):changeCol:(finCol - changeCol)%avoid inclusive at endpt
            piece = chessboard(iniRow, col);
            if piece ~= 0
                bool = true;
            end
        end
    elseif deltaCol == 0 %vertical
        changeRow = deltaRow/abs(deltaRow);
        for row = (iniRow+changeRow):changeRow:(finRow - changeRow)%avoid inclusive at endpt
            piece = chessboard(row, iniCol);
            if piece ~= 0
                bool = true;
            end
        end
    end
end