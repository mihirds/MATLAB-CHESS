function bool = isOneSpaceAway(pos1, pos2)
%returns true if pos1 is one space away from pos2 (including diagonals)
    row1 = pos1(1);
    col1 = pos1(2);
    row2 = pos2(1);
    col2 = pos2(2);
    
    deltaRowAbs = abs(row2 - row1);
    deltaColAbs = abs(col2 - col1);
    
    if isLinear(pos1,pos2)
        bool = (deltaRowAbs == 1)||(deltaColAbs == 1);
    elseif isDiagonal(pos1,pos2)
        bool = (deltaRowAbs == 1)&&(deltaColAbs == 1);
    else
        bool = false;
    end
        
end