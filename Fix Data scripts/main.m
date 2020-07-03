pathtest = 'F:TEST';
pathground = 'F:GROUND';

a = imread(strcat(pathtest,'/000001.jpg')); %config img to get estimation function
b = imread(strcat(pathground,'/000001.jpg')); %config img to get estimate function

[a2,b2match] = colorfix(a,b);
mytform = registration(a2,b2match); %get registered oblique and color matched ground
test = testtransform(a2, mytform);
        %[test2, ground2] = registration(c,d);
    
imshow(test) %show registered oblique 1 for cropping
impixelinfo %debugging 
acrop = drawrectangle();  %draw rectangle slightly away from edges
pos = customWait(acrop); %wait function to allow interaction
        %test2 = imcrop(test,pos); %cropped registered
        %yeet2 = imcrop(test2,pos);
        
testfiles = dir (strcat(pathtest,'/*.jpg'));
Ltest = length (testfiles);
groundfiles = dir (strcat(pathground,'/*.jpg'));
pathtestprime = 'F:TESTprime';
pathgroundprime = 'F:GROUNDprime';
    %figure,
for i=1372:Ltest
   testimage{i}=imread(strcat(pathtest,'/',testfiles(i).name));  
   groundimage{i}=imread(strcat(pathground,'/',groundfiles(i).name));
   tempa = testimage{i};
   tempb = groundimage{i};
   [tempa2, tempb2match] = colorfix(tempa,tempb);
   temptest = testtransform(tempa2, mytform);
   temptest2 = imcrop(temptest, pos);
   groundcropped = templatematching(temptest2, tempb2match);
   [rowT, colT] = size(temptest2);
   [rowG, colG] = size(groundcropped);
   if rowT ~= rowG || colT ~= colG
       temptest2 = imresize(temptest2,[rowG,colG]);
   end
   imwrite(temptest2, strcat(pathtestprime,'/',testfiles(i).name),'jpg');
   imwrite(groundcropped, strcat(pathgroundprime,'/',groundfiles(i).name),'jpg');
       
        %subplot(2,3,i); imshow(groundcropped); 
   %resize images to match size
   %write image to folder  
end
        %groundcropped = templatematching(test2,ground); %crop ground to match
        %compress cropped registered to match groundcropped size
        % imshow(ground);
        % bcrop = drawrectangle('Position',pos);
        % pos2 = customWait(bcrop);
        % yeet3 = imcrop(ground, pos2);
        % figure,
        % subplot(2,2,1); imshow(test); title('crooked test');
        % %subplot(2,2,2); imshow(test2); title('crooked test2');
        % subplot(2,2,2); imshow(ground); title('full ground');
        % subplot(2,2,3); imshow(test2); title('cropped test');
        % subplot(2,2,4); imshow(groundcropped); title('cropped ground');
        % %subplot(2,2,4); imshow(yeet2); title('cropped test2');

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