function bool = canBishopMove(chessboard, iniPos, finPos)
    bool = false;
    if isDiagonal(iniPos, finPos)
        if canMoveTo(chessboard, iniPos, finPos)&&(~hasDiagObstruction(chessboard, iniPos, finPos))
            bool = true;
        end
    end
end