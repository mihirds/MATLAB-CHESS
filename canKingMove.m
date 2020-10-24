function bool = canKingMove(chessboardArr, iniPos, finPos)
% Returns true if a king can move from iniPos to finPos, doesn't check if
% movement will cause check/checkmate
    chessboard = chessboardArr;
    bool = false;
    if isOneSpaceAway(iniPos, finPos)&&canMoveTo(chessboard, iniPos, finPos)
        bool = true;
    end
    
    iniRow = iniPos(1);
    iniCol = iniPos(2);
    piece = chessboard(iniRow, iniCol);
    if abs(piece) == 6 % make sure piece is a king
        sign = piece/abs(piece);
        for row = 1:8
            for col = 1:8
                pieceTemp = chessboard(row, col);
                if pieceTemp*sign < 0 && abs(pieceTemp)~=6 && abs(pieceTemp) ~= 1
                    % true if piece is diff sign and not zero
                    % true if piece is not king, to avoid recursion
                    if canMove(chessboard, [row,col], finPos)
                        bool = false;
                    end
                elseif pieceTemp*sign < 0 && abs(pieceTemp)==6
                    %check if opposing king can check
                    if isOneSpaceAway([row, col], finPos)&&canMoveTo(chessboard, [row, col], finPos)
                        bool = false;
                    end
                elseif pieceTemp*sign < 0 && abs(pieceTemp)==1
                    % check if pawn can take
                    iniRow = row;
                    finRow = finPos(1);
                    deltaRow = finRow - iniRow;
                    if sign == deltaRow && isDiagonal(finPos, [row,col])
                        bool = false;
                    end
                end
            end
        end
    end
end