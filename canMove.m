function bool = canMove(chessboard, iniPos, finPos)
%"Master" check function: checks type of piece in iniPos and sees if it can
%move to finPos
    iniRow = iniPos(1);
    iniCol = iniPos(2);
    piece = chessboard(iniRow, iniCol);
    pieceIndex = abs(piece);
    
    switch pieceIndex
        case 0 % empty space
            bool = false;
        case 1 %pawn
            bool = canPawnMove(chessboard, iniPos, finPos);
        case 2 %rook
            bool = canRookMove(chessboard, iniPos, finPos);
        case 3 %knight
            bool = canKnightMove(chessboard, iniPos, finPos);
        case 4 %bishop
            bool = canBishopMove(chessboard, iniPos, finPos);
        case 5 %queen
            bool = canQueenMove(chessboard, iniPos, finPos);
        case 6 %king
            bool = canKingMove(chessboard, iniPos, finPos);
        otherwise
            bool = false;
    end
        
end