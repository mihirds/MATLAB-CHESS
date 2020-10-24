function moveLog = logMove(counter,board,initialPos,finalPos, moveLog)
%takes in moveLog and updates moveLog with movement from iniPos to finPos
initialPosRow = initialPos(1);
initialPosCol = initialPos(2);
finalPosRow = finalPos(1);
finalPosCol = finalPos(2);


piece1 = board(initialPosRow, initialPosCol);
piece2 = board(finalPosRow, finalPosCol);

newEntry = [initialPosRow, initialPosCol, finalPosRow, finalPosCol, piece1, piece2];

moveLog(counter, :) = newEntry;