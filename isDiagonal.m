function bool = isDiagonal(pos1, pos2)
%returns true if the direct path from pos1 to pos2 is diagonal
    row1 = pos1(1);
    col1 = pos1(2);
    row2 = pos2(1);
    col2 = pos2(2);
    
    deltaRow = row2 - row1;
    deltaCol = col2 - col1;
    slope = deltaRow/deltaCol;
    bool = (abs(slope) == 1);
end