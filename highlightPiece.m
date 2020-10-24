function highlightPiece(handles, pos, color)
handleArr = handles.guiArray;
rowPos = pos(1);
colPos = pos(2);
buttonHandle = handleArr(rowPos, colPos);
imArray = get(buttonHandle, 'CData');
if strcmp(color, 'green')
    imArray(:,:,1) = 0;
    imArray(:,:,3) = 0;
elseif strcmp(color, 'yellow')
    if isempty(imArray)
        imArray = ones(50,50,3);
        imArray(:,:,3) = 0;
    else
        imArray(:,:,3) = 0;
    end
elseif strcmp(color, 'blue')
    if isempty(imArray)
        imArray = ones(50,50,3);
        imArray(:,:,1) = 0;
    else
        imArray(:,:,1) = 0;
    end
elseif strcmp(color, 'red')
    if isempty(imArray)
        imArray = ones(50,50,3);
        imArray(:,:,2) = 0;
        imArray(:,:,3) = 0;
    else
        imArray(:,:,2) = 0;
        imArray(:,:,3) = 0;
    end
end
set(buttonHandle, 'CData', imArray);
end