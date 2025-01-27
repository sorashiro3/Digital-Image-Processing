clear all
close all
clc

% Read the original image
origi = imread('Game_locked.jpg');

% Convert to grayscale if the image is RGB
if size(origi, 3) == 3
    origi = rgb2gray(origi);
end

[rows, cols] = size(origi);

% Array to store the bit planes
bit_planes = cell(1, 8);

% separate the image bit planes
for i = 1:8
    bit_planes{i} = bitget(origi, i) * 255; % Scale binary to [0, 255]
end

% Display the bit planes
figure;

subplot(2,5,1), imshow(origi), title('Original Image');
for i = 8 : -1 : 1
    subplot(2, 5, 10-i);
    imshow(bit_planes{i}, []); % Show the i-th bit plane
    title(['Bit Plane ', num2str(i)]); % MSB = Plane 8, LSB = Plane 1
end


