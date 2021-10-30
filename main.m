clc;
clear;

% Load the image
I = imread('images/img3.bmp');
imshow(I,'border','tight','initialmagnification','fit');
[row,col] = size(I);
set (gcf,'Position',[0,0,col,row]);
axis normal;

% Calculate a histogram for the image
[H, Gray_Level_Bits] = CalculateHistogram(I);

% Calculate the threshold for the image adaptively
Threshold_Level = Otsu_Threhold(H,Gray_Level_Bits);

% Threshold the image to obtain binary images
I_binary = 255*(I<Threshold_Level); % the object in original image is in black

% % Test
% I_binary = imread('images/test.gif');
% I_binary = 255*I_binary;

figure;
title("Binary Image");
imshow(I_binary,'border','tight','initialmagnification','fit');
[row,col] = size(I_binary);
set (gcf,'Position',[0,0,col,row]);
axis normal;


% 2-step thinning algorithm
Output_image = Thinning2Step(I_binary);
Output_image = 255*Output_image;
figure;
title("Skeleton of the image");
imshow(Output_image,'border','tight','initialmagnification','fit');
[row,col] = size(Output_image);
set (gcf,'Position',[0,0,col,row]);
axis normal;

% Medial Axis Transform Based Thinning
[DT_image, MAT_image] = MAT_Thinning(I_binary);
Skeleton_image = (MAT_image > 0)*255;

figure;
title("Distance Transform of the image");
imshow(DT_image, [0,max(max(DT_image))],'border','tight','initialmagnification','fit');
[row,col] = size(DT_image);
set (gcf,'Position',[0,0,col,row]);
axis normal;

figure;
title("Media Axis Transform of the image");
imshow(MAT_image,[0,max(max(MAT_image))],'border','tight','initialmagnification','fit');
[row,col] = size(MAT_image);
set (gcf,'Position',[0,0,col,row]);
axis normal;

figure;
title("Skeleton of the image");
imshow(Skeleton_image,[0,255],'border','tight','initialmagnification','fit');
[row,col] = size(Skeleton_image);
set (gcf,'Position',[0,0,col,row]);
axis normal;

