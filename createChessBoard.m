function [chessArray] = createChessBoard()
%Preallocates 8x8 chessboard array
A =zeros(8);

% Assigns each piece a unique identifier
% Number represents type of piece, sign represents color
pawnW = 1;
rookW = 2;
knightW = 3;
bishopW = 4;
queenW = 5;
kingW = 6;
pawnB = -1;
rookB = -2;
knightB = -3;
bishopB = -4;
queenB = -5;
kingB = -6;

%sets pawn locations
A(2,:) = pawnB;
A(7,:) = pawnW;

%sets locations for black pieces
A(1,1) = rookB;
A(1,8) = rookB;
A(1,2) = knightB;
A(1,7) = knightB;
A(1,3) = bishopB;
A(1,6) = bishopB;
A(1,5) = kingB;
A(1,4) = queenB;

%sts locations for white pieces
A(8,1) = rookW;
A(8,8) = rookW;
A(8,2) = knightW;
A(8,7) = knightW;
A(8,3) = bishopW;
A(8,6) = bishopW;
A(8,5) = kingW;
A(8,4) = queenW;

%returns array
chessArray = A;
end