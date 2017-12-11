path = 'F:\Courses\Image Processing\data\standard_test_images\cameraman.tif';
A = imread(path);
B = zeros(size(A));
B = bitset(B, 8, bitget(A,8));
B = bitset(B, 7, bitget(A,7));
B = bitset(B, 6, bitget(A,6));
B = bitset(B, 5, bitget(A,5));

figure, imshow(A)
figure, imshow(B);
