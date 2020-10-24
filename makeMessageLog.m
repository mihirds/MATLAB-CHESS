function [string] = makeMessageLog(moveLog)
    [turnCount, ~] = size(moveLog);

    iniTurn = turnCount - 5;
    if iniTurn < 1
       iniTurn = 1;
    end
    
    if mod(iniTurn, 2) == 1
        color = 'White';
    else
        color = 'Black';
    end
    
    string = char(strcat({'Welcome to the chess game\n'},{'Turn '}, {int2str(iniTurn)},{': '}, {color}, {' Turn\n'}));
    for i = iniTurn:turnCount
        
        iniPos = moveLog(i, [1,2]);
        finPos = moveLog(i, [3,4]);
        iniPiece = moveLog(i, 5);
        finPiece = moveLog(i, 6);
        
       	iniString = char(strcat({getPiece(iniPiece)}, {' at '}, {getPos(iniPos)}));
        finString = char(strcat({' to '}, {getPos(finPos)}));
        moveString = char(strcat({iniString}, {finString}));
        
        if finPiece ~= 0
            moveString = char(strcat({moveString}, {' capture '}, {getPiece(finPiece)}));
        end
        %moveString is the complete string of the movement for turn i
        
        
        % returns 1 for white, 0 for black
        if mod(i+1, 2) == 1
            color = 'White';
        else
            color = 'Black';
        end

        
        %Change this later
        turnString = char(strcat({'\nTurn '}, {int2str(i+1)}, {': '}, {color}, {' Turn\n'}));
        string = char(strcat({string}, {moveString}, {turnString}));
    end
end