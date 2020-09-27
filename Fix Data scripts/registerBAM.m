%register BAM

load('newRegisterVars.mat', 'movingPoints','fixedPoints','movingPoints2','fixedPoints2')

a = imread('C:\Users\kanga\Documents\MATLAB\project\defocusML\Data\Fixed Data from BAM\test\1.jpg');
b = imread('C:\Users\kanga\Documents\MATLAB\project\defocusML\Data\Fixed Data from BAM\ground\1.jpg');
b = rgb2gray(b);
inputptscorr = cpcorr(movingPoints, fixedPoints, a, b);
mytform = fitgeotrans(inputptscorr, fixedPoints, 'affine');
registered = imwarp(a, mytform);
inputptscorr2 = cpcorr(movingPoints2, fixedPoints2, registered, b);
mytform2 = fitgeotrans(inputptscorr2, fixedPoints2, 'affine');
registered2 = imwarp(registered, mytform2);


pathtest = "C:\Users\kanga\Documents\MATLAB\project\defocusML\Data\Fixed Data from BAM\test";
pathground = "C:\Users\kanga\Documents\MATLAB\project\defocusML\Data\Fixed Data from BAM\ground";
pathtestprime = 'C:\Users\kanga\Documents\MATLAB\project\defocusML\Data\Fixed Data from BAM\registered test';
pathgroundprime = "C:\Users\kanga\Documents\MATLAB\project\defocusML\Data\Fixed Data from BAM\bin ground";

for i=1:278
    a = imread(strcat(pathtest,'/',int2str(i),'.jpg'));
    b = imread(strcat(pathground,'/',int2str(i),'.jpg'));
    b = rgb2gray(b);
    imwrite(b, strcat(pathgroundprime,'/', int2str(i),'.jpg'), 'jpg');
    % imshow(a)
    % aroi = imcrop();
    % acan = edge(aroi,'canny',0.2);
    % imshow(acan)
    % bcan = edge(b,'canny',0.2);
    % imshow(bcan)
    % cpselect(acan,bcan)

    
    registered = imwarp(a, mytform);
    registered2 = imwarp(registered,mytform2);

    % imshow(registered)
    % %regroi = imcrop();
    % regcan = edge(registered,'canny',0.095);
    % imshow(regcan)
    % bcan = edge(b,'canny',0.2);
    % imshow(bcan)
    % cpselect(regcan,bcan)

    
    %registered2 = imresize(registered2, 4);

    %figure,imshowpair(b,registered2)
    imwrite(registered2, strcat(pathtestprime,'/', int2str(i),'.jpg'), 'jpg');
end

