function [picArray] = setPieces(filePath)
%makes strings for each filepath (black pieces)
bPawnPath = strcat(filePath, '/Chess_Piece_Png/black_pawn.png');
bRookPath = strcat(filePath, '/Chess_Piece_Png/black_rook.png');
bBishopPath = strcat(filePath, '/Chess_Piece_Png/black_bishop.png');
bKnightPath = strcat(filePath, '/Chess_Piece_Png/black_knight.png');
bQueenPath = strcat(filePath, '/Chess_Piece_Png/black_queen.png');
bKingPath = strcat(filePath, '/Chess_Piece_Png/black_king.png');

%makes strings for each filepath (white pieces)
wPawnPath = strcat(filePath, '/Chess_Piece_Png/white_pawn.png');
wRookPath = strcat(filePath, '/Chess_Piece_Png/white_rook.png');
wBishopPath = strcat(filePath, '/Chess_Piece_Png/white_bishop.png');
wKnightPath = strcat(filePath, '/Chess_Piece_Png/white_knight.png');
wQueenPath = strcat(filePath, '/Chess_Piece_Png/white_queen.png');
wKingPath = strcat(filePath, '/Chess_Piece_Png/white_king.png');

%sets elements in picArray to image arrays. 
%Position is equal to 7 + piece identifier
picArray(:,:,:,1) = imread(bKingPath); %7 - 6 = 1
picArray(:,:,:,2) = imread(bQueenPath); %7 - 5 = 2
picArray(:,:,:,3) = imread(bBishopPath); %7 - 4 = 3
picArray(:,:,:,4) = imread(bKnightPath); %7 - 3 = 4
picArray(:,:,:,5) = imread(bRookPath); %7 - 2 = 5
picArray(:,:,:,6) = imread(bPawnPath); %7 - 1 = 6
picArray(:,:,:,7) = 0; %Empty element for empty space
picArray(:,:,:,8) = imread(wPawnPath); %7 + 1 = 8
picArray(:,:,:,9) = imread(wRookPath); %7 + 2 = 9
picArray(:,:,:,10) = imread(wKnightPath); %7 + 3 = 10
picArray(:,:,:,11) = imread(wBishopPath); %7 + 4 = 11
picArray(:,:,:,12) = imread(wQueenPath); %7 + 5 = 12
picArray(:,:,:,13) = imread(wKingPath); %7 + 6 = 13

%Resizes pictures to fit buttons (75x75 pixels)
picArray = imresize(picArray,[50,50]);
end