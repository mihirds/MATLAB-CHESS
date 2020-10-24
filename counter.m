function [currentCount] = counter(dataHandle)

struct = get(dataHandle, 'UserData');
x = struct.counter;
x = x + 1;
currentCount = x;
struct.counter = x;
if x == 2
    struct.counter = 0;
end
set(dataHandle, 'UserData', struct);
end