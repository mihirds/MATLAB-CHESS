function highlightCheckedPiece(handles,chessboard)
    [whiteChecked, whiteKingPos, blackChecked, blackKingPos] = isChecked(chessboard);
    if whiteChecked && all(whiteKingPos~=[0,0])
        highlightPiece(handles, whiteKingPos, 'blue');
    end
    if blackChecked && all(blackKingPos~=[0,0])
        highlightPiece(handles, blackKingPos, 'blue');
    end

end