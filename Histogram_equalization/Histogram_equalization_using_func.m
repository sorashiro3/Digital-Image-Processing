% DIP lab 2


clear all;
close all;
clc ;

% Read the image
I = imread('Lenna.png'); % I -> Original image

if size(I, 3) == 3
    I = rgb2gray(I); % Convert to grayscale
end

% histogram equalization function
equalized_image = histeq(I);

% Compute histograms and cumulative histograms
[original_hist, bin_centers] = imhist(I); % Original histogram
original_cdf = cumsum(original_hist) / numel(I); % Original CDF

[equalized_hist, ~] = imhist(equalized_image); % Equalized histogram
equalized_cdf = cumsum(equalized_hist) / numel(equalized_image); % Equalized CDF

figure;

% Subplot 1: Original Image
subplot(2, 2, 1);
imshow(I);
title('Original Image');

% Subplot 2: Equalized Image
subplot(2, 2, 2);
imshow(equalized_image);
title('Equalized Image');

% Subplot 3: Original Histogram with CDF
subplot(2, 2, 3);
bar(bin_centers, original_hist, 'FaceColor', 'blue', 'EdgeColor', 'none');
hold on;
plot(bin_centers, original_cdf * max(original_hist), 'r', 'LineWidth', 2); % Scale CDF to match histogram height
title('Original Histogram with CDF');
xlabel('Pixel Intensity');
ylabel('Frequency');


% Subplot 4: Equalized Histogram with CDF
subplot(2, 2, 4);
bar(bin_centers, equalized_hist, 'FaceColor', 'blue', 'EdgeColor', 'none');
hold on;
plot(bin_centers, equalized_cdf * max(equalized_hist), 'r', 'LineWidth', 2); % Scale CDF to match histogram height
title('Equalized Histogram with CDF');
xlabel('Pixel Intensity');
ylabel('Frequency');

