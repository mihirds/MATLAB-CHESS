function bool = canRookMove(chessboard, iniPos, finPos)
%returns true if piece in iniPos can move to finPos following movement of
%rook
    bool = false;
    if isLinear(iniPos, finPos)
        if (~hasLinObstruction(chessboard,iniPos,finPos))&&canMoveTo(chessboard,iniPos,finPos)
            bool = true;
        end
    end
    
    %put advanced rules of chess here: castling
    
end