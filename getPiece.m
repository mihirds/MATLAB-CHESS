function [piece] = getPiece(index)
    switch abs(index)
        case 0
            piece = 'Empty';
        case 1
            piece = 'Pawn';
        case 2
            piece = 'Rook';
        case 3
            piece = 'Knight';
        case 4
            piece = 'Bishop';
        case 5
            piece = 'Queen';
        case 6
            piece = 'King';
    end
    
    if (index ~= 0 )&&(index < 0)
        piece = char(strcat({'Black '}, {piece}));
    elseif (index ~= 0 )&&(index > 0)
        piece = char(strcat({'White '}, {piece}));
    end
end