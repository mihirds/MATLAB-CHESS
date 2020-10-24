function bool = canQueenMove(chessboard, iniPos, finPos)
% Returns true if a queen can move from iniPos to finPos
    bool = false;
    if isDiagonal(iniPos, finPos)
        if (~hasDiagObstruction(chessboard, iniPos, finPos))&&canMoveTo(chessboard, iniPos, finPos)
            bool = true;
        end
    elseif isLinear(iniPos, finPos)
        if (~hasLinObstruction(chessboard, iniPos, finPos))&&canMoveTo(chessboard, iniPos, finPos)
            bool = true;
        end
    end
end