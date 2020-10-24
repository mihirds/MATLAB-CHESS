function [chessboard] = makeBoard()
% makes black and white chessboard (0 and 1) and stores it in an 8x8 array
chessboard = zeros(8);
for col = 2:2:8
    for row = 1:2:7
        chessboard(col,row) = 1;
    end
end

for col = 1:2:7
    for row = 2:2:8
        chessboard(col,row) = 1;
    end
end
end