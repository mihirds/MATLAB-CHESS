function bool = canPawnMove(chessboard, iniPos, finPos)
    iniRow = iniPos(1);
    iniCol = iniPos(2);
    finRow = finPos(1);
    finCol = finPos(2);
    deltaRow = finRow - iniRow;
    
    bool = false;
    
    piece = chessboard(iniRow,iniCol);
    piece2 = chessboard(finRow,finCol);
    %Determines color of pawn
    if piece < 0
        color = 'Black';
    else
        color = 'White';
    end
    
     %determines if pawn is in starting pos
     if (iniRow == 7)&&(strcmp('White', color)) 
         % if piece is white and starting pos and spot is uncoccupied, and
         % is moving vertically
         if ((deltaRow == -1)||(deltaRow == -2))&&(piece2 == 0)&&isLinear(iniPos, finPos)&&(~hasLinObstruction(chessboard, iniPos, finPos))
             bool = true;
         end
     elseif (iniRow == 2)&&(strcmp('Black', color))% if piece is black and in starting pos and spot is uncoccupied
         if ((deltaRow == 1)||(deltaRow == 2))&&(piece2 == 0)&&isLinear(iniPos, finPos)&&(~hasLinObstruction(chessboard, iniPos, finPos))
             bool = true;
         end
     end
    
     %is true if pawn is moving forward
     movingForward = ((deltaRow < 0)&&(strcmp('White', color)))||((deltaRow > 0)&&(strcmp('Black',color)));
     
     %checks if pawn can move forward one space
     if movingForward&&isLinear(iniPos, finPos)&&isOneSpaceAway(iniPos, finPos)&&(chessboard(finRow,finCol) == 0)
         bool = true;
     end
     
     
     %checks if piece is moving diagonally, one space away, in the right
     %direction, and there is a piece of a different color in the spot
     if movingForward&&isDiagonal(iniPos, finPos)&&isOneSpaceAway(iniPos, finPos)&&isDiffColor(chessboard, iniPos, finPos)
         bool = true;
     end
     
     %Put advanced chess rule here: en passant, promotion
     
end