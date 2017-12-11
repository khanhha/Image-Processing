A=[10 10 9 9 9 9 4 0 0 0 0 0 10 10 10];

F = [logical(diff(A)) 1];
In = find(F~=0);

Ele=A(In);
C=[In(1) diff(In)];

Result = zeros([numel(Ele) 2]);
Result(:,1)=Ele;
Result(:,2)=C;
disp(Result);