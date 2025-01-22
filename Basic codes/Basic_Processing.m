
clear all;
close all;
clc

% Read the image
I = imread('BLANK.jpg'); % I -> Original color image

% only red color
Ir = I;            % Ir -> Image with only the red color
Ir(:,:,2) = 0;     % green channel to 0
Ir(:,:,3) = 0;     % blue channel to 0

% For only green color
Ig = I;            % Ig -> Image with only the green color
Ig(:,:,1) = 0;     % red channel to 0
Ig(:,:,3) = 0;     % blue channel to 0

% For only blue color
Ib = I;            % Ib -> Image with only the blue color
Ib(:,:,1) = 0;     % red channel to 0
Ib(:,:,2) = 0;     % green channel to 0

% Converting the color image into a grayscale image using the inbuilt function
IG = rgb2gray(I);  % IG -> Grayscale image

% Display the images in subplots
subplot(2,3,1), imshow(I), title('Original Image');
subplot(2,3,2), imshow(IG), title('Grayscale Image');
subplot(2,3,3), imshow(Ir), title('only Red Color');
subplot(2,3,4), imshow(Ig), title('only Green Color');
subplot(2,3,5), imshow(Ib), title('only Blue Color');