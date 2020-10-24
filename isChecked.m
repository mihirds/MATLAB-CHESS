function [whiteChecked, whiteKingPos, blackChecked, blackKingPos] = isChecked(chessboard)
    % checks if color is checked
    whiteChecked = false;
    blackChecked = false;
    whiteKingPos = [0,0];
    blackKingPos = [0,0];
    
    %finds position of both kings
    for row = 1:8
        for col = 1:8
            piece = chessboard(row, col);
            if piece == 6
                whiteKingPos = [row,col];
            elseif piece == -6
                blackKingPos = [row,col];
            end
        end
    end
    
    % checks if any opposing piece can take the king
    for row = 1:8
        for col = 1:8
            piece = chessboard(row, col);
            pos = [row, col];
            if piece > 0 % if piece is white
                if all(blackKingPos ~= [0,0])&&canMove(chessboard, pos, blackKingPos)
                    blackChecked = true;
                end
            elseif piece < 0% if piece is black
                if all(whiteKingPos ~= [0,0])&&canMove(chessboard, pos, whiteKingPos)
                    whiteChecked = true;
                end
            end
        end
    end
end