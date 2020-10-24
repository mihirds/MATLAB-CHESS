function bool = isPlayerTurn(pieceColor, dataHandle)
% Returns true if the piece is the same color as the turn player
    struct = get(dataHandle, 'UserData');
    colNum = mod((struct.turnCount),2);
    if (colNum == 1)&&(strcmp(pieceColor, 'White'))
        bool = true;
    elseif (colNum == 0)&&(strcmp(pieceColor, 'Black'))
        bool = true;
    else
        bool = false;
    end
end