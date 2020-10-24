function bool = isLinear(pos1, pos2)
%returns true if the path between positions is linear and the two positions
%are different
    row1 = pos1(1);
    col1 = pos1(2);
    row2 = pos2(1);
    col2 = pos2(2);
    
    sameRow = (row1 == row2);
    sameCol = (col1 == col2);
    bool = xor(sameRow, sameCol); 
end