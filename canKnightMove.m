function bool = canKnightMove(chessboard, iniPos, finPos)
% Returns true if a knight can move from iniPos to finPos
    iniRow = iniPos(1);
    iniCol = iniPos(2);
    finRow = finPos(1);
    finCol = finPos(2);
    
    deltaRow = finRow - iniRow;
    deltaCol = finCol - iniCol;
    
    absSum = abs(deltaRow)+abs(deltaCol);
    
    if (absSum == 3)&&(deltaRow ~= 0)&&(deltaCol ~= 0)&&(canMoveTo(chessboard, iniPos,finPos))
        bool = true;
    else
        bool = false;
    end
end