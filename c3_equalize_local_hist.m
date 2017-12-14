filename = 'Fig0326(a)(embedded_square_noisy_512).tif';
filepath = strcat('F:\Courses\Image Processing\images\DIP3E_Original_Images_CH03\', filename);

M = 512;
N = 512;
mid_idx = round((M*N)/2);
cnt = 0;
for i = 1:M
    for j = 1:N
        cnt = cnt+1;
        if mid_idx == cnt
            padM = i-1;
            padN = j-1;
        end
    end
end

I0 = im2uint8(imread(filepath));
I = padarray(I0, [padM, padN]);

for i = 1:  size(I, 1)-(padM*2+1)
    for j = 1: size(I,2)-(padN*2+1)
        cnt = 0;
        cdf = zeros(256, 1);
        for x = 1:M
            for y = 1:N
                if cnt == mid_idx
                    elm = I(i+x-1, j+y-1) + 1;
                end
                pos = I(i+x-1, j+y-1) + 1;
                cdf(pos) = cdf(pos) + 1;
                cnt = cnt +1;
            end
        end
        
        for pos = 2:256
            cdf(pos) = cdf(pos) + cdf(pos - 1);
        end
        I(i,j) = round(cdf(elm)/(M*N) * 255);
    end 
end

figure, imshow(I0);
figure, imshow(I);


