pathtest = "C:\Users\kanga\Documents\MATLAB\project\TEMP";
test = imread(strcat(pathtest, "\57.jpg"));

pathground = "C:\Users\kanga\Documents\MATLAB\project\defocusML\Data\Fixed Data from BAM\ground";
ground = imread(strcat(pathground,"\57.jpg"));

test = rgb2gray(test);
ground = rgb2gray(ground);

A1 = ground;

%Read the Target Image
B1 = test;

A = A1(:,:,1);
B = B1(:,:,1);


normx_corrmap=normxcorr2(B(:,:),A(:,:));

imshow(normx_corrmap)

maxptx = max(normx_corrmap(:));

[x1,y1]=find(normx_corrmap==maxptx);

if(x1>size(A1,1))
    x1=size(A1,1);
end

if(y1>size(A1,2))
    y1=size(A1,2);
end

c = x1-size(B,1);
if(c<1)
    c=1;
end

d = y1-size(B,2);
if(d<1)
    d=1;
end     

groundcropped = A1(c:x1,d:y1);
figure,
subplot(1,3,1); imshow(test);
subplot(1,3,2); imshow(ground);
subplot(1,3,3); imshow(groundcropped);







