function updateBoard(handles, dataHandle)
%Updates GUI based on mirrored chessboards array stored in UserData of data

%Required data
pieceArr = handles.picArray;
guiArr = handles.guiArray;
struct = get(dataHandle, 'UserData');
chessboardArr = struct.chessboard;
[whiteChecked, whiteKingPos, blackChecked, blackKingPos] = isChecked(chessboardArr);

%loop through chessboard
for row = 1:8
    for col = 1:8
        %retreives piece index and correlating button handle at point
        pieceIndex = 7 + chessboardArr(row,col);
        posHandle = guiArr(row, col);
        
        if pieceIndex == 7 %sets button to empty if no piece is in the position
            set(posHandle,'cdata',[]);    
        else %sets button image to piece image    
            pieceIm = pieceArr(:,:,:,pieceIndex);
            set(posHandle, 'cdata', pieceIm);
        end
    end
end

if whiteChecked && all(whiteKingPos~=[0,0])
    highlightCheckedPiece(handles,chessboardArr)
elseif blackChecked && all(blackKingPos~=[0,0])
    highlightCheckedPiece(handles,chessboardArr)
end
    

if all(whiteKingPos == [0,0])
    %write to log that black wins
elseif all(blackKingPos == [0,0])
    %write to log that white wins
end


end