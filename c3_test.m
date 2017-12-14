filepath = 'F:\Courses\Image Processing\images\DIP3E_Original_Images_CH03\Fig0323(a)(mars_moon_phobos).tif';

I0 = imread(filepath);
figure; imshow(I0);
figure;histogram(I0,256*2);