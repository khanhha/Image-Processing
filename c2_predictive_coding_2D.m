clear all
clc

A = imread('F:\Courses\Image Processing\data\standard_test_images\cameraman.tif');
disp(A)

e = A;
A1 = padarray(A,[1,0],0);
disp(A1)

w = size(A1,1);
h = size(A1,2);
for i = 2:w-1
    for j = 2:h
        fx = round(A1(i,j-1) + A1(i-1,j));
        e(i-1,j) = e(i-1,j) - fx;
    end
end
disp(e)

C= reshape(e, [], 1);
[D1,x] =hist(C, min(min(e)):max(max(e)));
sym = x(D1>0);
prob = D1(D1>0)/numel(e);
[dict, avglen] = huffmandict(sym, prob);
comp = huffmanenco(C, dict);

dsig = huffmandeco(comp, dict);
e = reshape(dsig, size(A,1), size(A,2));

d = e;
e1 = padarray(e, [1,0], 0);
for i = 2:size(e1,1) - 1
    for j = 2:size(e1,2)
        fx = round(e1(i,j-1)+e1(i-1,j));
        d(i-1,j) = d(i-1,j) +fx;
        e1 = padarray(d,[1,0],0);
    end
end

%disp(d)