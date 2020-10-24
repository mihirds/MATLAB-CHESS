function [newBoard] = move(board,initialPosition,finalPosition)
%setting changing board to initial board
changingBoard= board;

%getting position data
rowinit = initialPosition(1);
colinit = initialPosition(2);
rowfin = finalPosition(1);
colfin = finalPosition(2);

%saves intial piece data to movingPiece variable
movingPiece = board(rowinit,colinit);

%sets final position data to the new piece value
changingBoard(rowfin,colfin) = movingPiece;

%sets old location value to empty
changingBoard(rowinit,colinit) = 0;

%returns the board with the new locations
newBoard=changingBoard;
end