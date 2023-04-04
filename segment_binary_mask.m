

% Read image
img = imread('32hrs_cocl2.png');
% img= img(80:410,110:440,:);
% Convert image to LAB color space
img_lab = rgb2lab(img);

% Perform k-means clustering on image to segment it
num_clusters = 2; 
[cluster_indices, ~] = kmeans(reshape(img_lab,[],3), num_clusters);
segmented_img = reshape(cluster_indices,size(img_lab,1),size(img_lab,2));

% Create binary mask from segmented image
segment_value = 2; 
mask = segmented_img == segment_value;

% Display original image and binary mask side by side
% figure(1)
% % subplot(1, 2, 1);
% imshow(img);
% title('Original Image');
figure(2)
% subplot(1, 2, 2);
imshow(mask);
title('Binary Mask');




