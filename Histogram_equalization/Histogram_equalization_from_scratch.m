% DIP lab 2
% histogram equiv using self made functions


clear all;
close all;
clc ;

% Read the input image
input_image = imread('Lenna.png'); % Replace with your image file
if size(input_image, 3) == 3
    input_image = rgb2gray(input_image); % Convert to grayscale
end

[rows, cols] = size(input_image);
total_pixels = rows * cols;

% Compute the histogram image by counting the freq of each pixel value
histogram = zeros(256, 1);
for ii = 1:rows
    for jj = 1:cols
        pixel_value = input_image(ii, jj);
        histogram(pixel_value + 1) = histogram(pixel_value + 1) + 1; %update frequency value
    end
end

% Compute the cumulative distribution function (CDF)
cdf = cumsum(histogram);
cdf_normalized = cdf / total_pixels; % Normalize CDF

% Map the pixel values based on the CDF
equalized_image = uint8(zeros(rows, cols));
for ii = 1:rows
    for jj = 1:cols
        pixel_value = input_image(ii, jj);
        equalized_image(ii, jj) = round(cdf_normalized(pixel_value + 1) * 255);
    end
end

% Compute the histogram of the equalized image
equalized_histogram = zeros(256, 1);
for ii = 1:rows
    for jj = 1:cols
        pixel_value = equalized_image(ii, jj);
        equalized_histogram(pixel_value + 1) = equalized_histogram(pixel_value + 1) + 1;
    end
end

% Compute the cumulative histogram of the equalized image
equalized_cdf = cumsum(equalized_histogram) / total_pixels;

% Display the original image
figure;
subplot(2, 2, 1);
imshow(input_image);
title('Original Image');

% Display the equalized image
subplot(2, 2, 2);
imshow(equalized_image);
title('Equalized Image');

% Plot the histogram of the original image with CDF
subplot(2, 2, 3);
bar(0:255, histogram, 'FaceColor', 'blue', 'EdgeColor', 'none');
hold on;
plot(0:255, cdf_normalized * max(histogram), 'r', 'LineWidth', 2); % Scale CDF to match histogram height
title('Original Histogram with CDF');
xlabel('Pixel Intensity');
ylabel('Frequency');


% Plot the histogram of the equalized image with CDF
subplot(2, 2, 4);
bar(0:255, equalized_histogram, 'FaceColor', 'blue', 'EdgeColor', 'none');
hold on;
plot(0:255, equalized_cdf * max(equalized_histogram), 'r', 'LineWidth', 2); % Scale CDF to match histogram height
title('Equalized Histogram with CDF');
xlabel('Pixel Intensity');
ylabel('Frequency');
