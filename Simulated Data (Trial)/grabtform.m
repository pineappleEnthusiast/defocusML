  a = imread('C:\Users\kanga\Documents\MATLAB\project\defocusML\Data\Raw Data from Incoherent\TEST\000001.jpg'); %read test
    b = imread('C:\Users\kanga\Documents\MATLAB\project\defocusML\Data\Raw Data from Incoherent\GROUND\000001.jpg'); %read ground
    a = rgb2gray(a);
    b = rgb2gray(b);
%     imshow(a)
%     aroi = imcrop(); %choose sharpest roi on test to take edges from
%     acan = edge(aroi, 'canny', 0.8);
%     
%     imshow(b)
%     broi = imcrop();
%     bcan = edge(broi, 'canny');
%     cpselect(acan, bcan)
    inputptscorr = cpcorr(inputpts, outputpts, aroi,broi);
    mytform = fitgeotrans(inputptscorr,outputpts,'projective');
    outputImage = imwarp(a,mytform);
    imshow(outputImage)
    