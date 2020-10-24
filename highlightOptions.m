function highlightOptions (handles, chessboard, pos)
    for row = 1:8
        for col = 1:8
            testPos = [row,col];
            if canMove(chessboard, pos, testPos)
                highlightPiece(handles, testPos, 'yellow');
            end
        end
    end
end