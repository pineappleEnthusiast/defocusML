
pathtest = "C:\Users\kanga\Documents\MATLAB\project\TEMP";
pathtestprime = 'C:\Users\kanga\Documents\MATLAB\project\defocusML\Data\Fixed Data from BAM\test';
testfiles = dir (strcat(pathtest,'/*.jpg'));

for i=1:278 
    a=imread(strcat(pathtest,'/',int2str(i),'.jpg'));  
    %imwrite(a, strcat(pathtestprime,'/', int2str(i),'.jpg'), 'jpg');
    a = rgb2gray(a);
    a = imcomplement(a);
    a = histeq(a);

    se = strel('disk', 300);
    bkg = imopen(a,se);
    %bkg = histeq(bkg);

    sigma = 75;
    smoothBKG = imgaussfilt(bkg,sigma);
    smoothBKG = imadjust(smoothBKG, [0,178/256], [0,200/256]);
    %imshow(smoothBKG)
    %imhist(smoothBKG)

     a2 = a - smoothBKG;
     %imshow(a2)
     a3 = imcomplement(a2);
     %imhist(a3)
     a3 = imadjust(a3, [30/256 220/256], [70/256 150/256]);
     a4 = imsharpen(a3);
     imwrite(a4, strcat(pathtestprime,'/', int2str(i),'.jpg'), 'jpg'); 
end

% a = imread("C:\Users\kanga\Documents\MATLAB\project\TEMP\7.jpg");
% a = rgb2gray(a);
% a = imcomplement(a);
% a = histeq(a);
% 
% se = strel('disk', 300);
% bkg = imopen(a,se);
% bkg = histeq(bkg);
% 
% sigma = 75;
% smoothBKG = imgaussfilt(bkg,sigma);
% smoothBKG = imadjust(smoothBKG, [0,178/256], [0,200/256]);
% imshow(smoothBKG)
% imhist(smoothBKG)
% 
%  a2 = a - smoothBKG;
%  imshow(a2)
%  a3 = imcomplement(a2);
%  imhist(a3)
%  a3 = imadjust(a3, [30/256 220/256], [70/256 150/256]);
%  a4 = imsharpen(a3);
%                       
%  
