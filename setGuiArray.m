function [guiArray] = setGuiArray(handles)
%function makes a mirrored array of gui handles
%calling 1,1 on gui array returns same position as 1,1 on chessboard
guiArray = zeros(8);
guiArray(8,1) = handles.A1;
guiArray(7,1) = handles.A2;
guiArray(6,1) = handles.A3;
guiArray(5,1) = handles.A4;
guiArray(4,1) = handles.A5;
guiArray(3,1) = handles.A6;
guiArray(2,1) = handles.A7;
guiArray(1,1) = handles.A8;

guiArray(8,2) = handles.B1;
guiArray(7,2) = handles.B2;
guiArray(6,2) = handles.B3;
guiArray(5,2) = handles.B4;
guiArray(4,2) = handles.B5;
guiArray(3,2) = handles.B6;
guiArray(2,2) = handles.B7;
guiArray(1,2) = handles.B8;

guiArray(8,3) = handles.C1;
guiArray(7,3) = handles.C2;
guiArray(6,3) = handles.C3;
guiArray(5,3) = handles.C4;
guiArray(4,3) = handles.C5;
guiArray(3,3) = handles.C6;
guiArray(2,3) = handles.C7;
guiArray(1,3) = handles.C8;

guiArray(8,4) = handles.D1;
guiArray(7,4) = handles.D2;
guiArray(6,4) = handles.D3;
guiArray(5,4) = handles.D4;
guiArray(4,4) = handles.D5;
guiArray(3,4) = handles.D6;
guiArray(2,4) = handles.D7;
guiArray(1,4) = handles.D8;

guiArray(8,5) = handles.E1;
guiArray(7,5) = handles.E2;
guiArray(6,5) = handles.E3;
guiArray(5,5) = handles.E4;
guiArray(4,5) = handles.E5;
guiArray(3,5) = handles.E6;
guiArray(2,5) = handles.E7;
guiArray(1,5) = handles.E8;

guiArray(8,6) = handles.F1;
guiArray(7,6) = handles.F2;
guiArray(6,6) = handles.F3;
guiArray(5,6) = handles.F4;
guiArray(4,6) = handles.F5;
guiArray(3,6) = handles.F6;
guiArray(2,6) = handles.F7;
guiArray(1,6) = handles.F8;

guiArray(8,7) = handles.G1;
guiArray(7,7) = handles.G2;
guiArray(6,7) = handles.G3;
guiArray(5,7) = handles.G4;
guiArray(4,7) = handles.G5;
guiArray(3,7) = handles.G6;
guiArray(2,7) = handles.G7;
guiArray(1,7) = handles.G8;

guiArray(8,8) = handles.H1;
guiArray(7,8) = handles.H2;
guiArray(6,8) = handles.H3;
guiArray(5,8) = handles.H4;
guiArray(4,8) = handles.H5;
guiArray(3,8) = handles.H6;
guiArray(2,8) = handles.H7;
guiArray(1,8) = handles.H8;
end