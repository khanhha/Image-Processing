%filepath = 'F:\\Courses\\Image Processing\\data\\standard_test_images\\cameraman.tif';
filepath = 'F:\Courses\Image Processing\images\DIP3E_Original_Images_CH03\Fig0316(2)(2nd_from_top).tif';

I0 = im2uint8(imread(filepath));
I = I0;

[counts, x] = imhist(I);
nbins = size(counts, 1);
npixels = size(I,1) *size(I,2);
s  = zeros(nbins, 1);
acc = cumsum(counts);
w = (nbins - 1) / npixels;
%w = 1/npixels;
for r = 1 : nbins
   s(r) = round(w*acc(r));
end

for i = 1 : size(I, 1)
    for j = 1: size(I,2)
        idx = I(i,j);
        I(i,j) = s(idx);
    end
end

[counts_e, x_e] = imhist(I);

figure; imshow(I0);
figure; imshow(I);
figure; bar(x, counts);
figure; bar(x_e, counts_e);