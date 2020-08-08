%this is for data from BAM
% pathtest = "C:\Users\kanga\Documents\MATLAB\project\defocusML\Data\Raw Data from BAM\blurred rotated 1";
% a = imread(strcat(pathtest, "\20200608_155700.000.jpg"));

%get crop shape
% imshow(a)
% impixelinfo
% acrop = drawrectangle();
% position = customWait(acrop);
% 
% %crop all blurred to square
% testfiles = dir (strcat(pathtest,'/*.jpg'));
% Ltest = length (testfiles);
% pathtestprime = 'C:\Users\kanga\Documents\MATLAB\project\TEMP';
% for i=1:Ltest
%    testimage{i}=imread(strcat(pathtest,'/',testfiles(i).name));  
%    testA = testimage{i};
%    testAPrime = imcrop(testA, position);
%    imwrite(testAPrime, strcat(pathtestprime,'/', int2str(i),'.jpg'), 'jpg');   
% end
% 
pathtest = "C:\Users\kanga\Documents\MATLAB\project\TEMP";
test = imread(strcat(pathtest, "\1.jpg"));
ground = imread("C:\Users\kanga\Documents\MATLAB\project\defocusML\Data\Raw Data from BAM\ground 1\DSC_0001.jpg");
ground=imrotate(ground,90);
degree = -4.9315;

imshow(ground)
impixelinfo
groundcrop = drawrectangle();
position = customWait(groundcrop);

init = imcrop(ground,position);
pathtestprime = 'C:\Users\kanga\Documents\MATLAB\project\defocusML\Data\Fixed Data from BAM\ground';
imwrite(ground, strcat(pathtestprime,'/', '2','.jpg'), 'jpg');   

groundrot1 = imrotate(init,abs(degree),"crop");
result1 = imcrop(init, position);
imwrite(groundrot1, strcat(pathtestprime,'/', '1','.jpg'), 'jpg');   

%groundrot = init;

for i=3:278
   groundrot = imrotate(ground,degree*(i-1),'crop');
   result = imcrop(groundrot, position);
   imwrite(groundrot, strcat(pathtestprime,'/', int2str(i),'.jpg'), 'jpg');   
end

function pos = customWait(hROI)
% Listen for mouse clicks on the ROI
l = addlistener(hROI,'ROIClicked',@clickCallback);
% Block program execution
uiwait;
% Remove listener
delete(l);
% Return the current position
pos = hROI.Position;
end

function clickCallback(~,evt)
if strcmp(evt.SelectionType,'double')
    uiresume;
end
end

%template match ground to each incoherent


