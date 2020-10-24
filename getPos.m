function [posString] = getPos(pos)
%Takes pos and turns it into a string of pos in chess terminology
% ie: 1,1 = A1, 1,2 = B1
    switch pos(2)
        case 1
            letter = 'A';
        case 2
            letter = 'B';
        case 3
            letter = 'C';
        case 4
            letter = 'D';
        case 5
            letter = 'E';
        case 6
            letter = 'F';
        case 7
            letter = 'G';
        case 8
            letter = 'H';
    end
    number = int2str(9-pos(1));
    posString = strcat(letter, number);
end