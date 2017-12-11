clear all
clc

A = imread('F:\Courses\Image Processing\data\standard_test_images\woman_darkhair.tif');

e = A;
A1 = padarray(A,[1,0],0);


w = size(A1,1);
h = size(A1,2);
for i = 2:w-1
    for j = 2:h
        fx = round(0.5* A1(i,j-1) + 0.5 * A1(i-1,j));
        e(i-1,j) = e(i-1,j) - fx;
    end
end

figure, imshow(A);
figure, imshow(e);

A1 = reshape(A,[], 1);
e1 = reshape(e,[], 1);
%he = hist(e1);
%ha = hist(A1);
figure, histogram(A);
figure, histogram(e);
