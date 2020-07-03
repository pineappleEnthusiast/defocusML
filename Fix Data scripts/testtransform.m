function registered = testtransform(test, tform)
    %ground = imread('F:GROUND/000111.jpg');
    %test2 = rgb2gray(test);
    %ground2 = rgb2gray(ground);
    %invground2 = imcomplement(ground2);
    %invground2match = imadjust(invground2, [0.098 0.42], [0.36 0.578]);
     registered = imwarp(test,tform);
%     registered2 = medfilt2(registered,[1 1]);
%     figure, 
%     subplot(1,2,1); imshow(registered); title('Registered');
%     subplot(1,2,2); imshow(registered2); title('Denoised');
%     imshow(registered)
%     roi = imrect;
%     mask = createMask(roi);
%     f = @(x)imsharpen(x,'Amount',2, 'Threshold', 0.7);
%     regsharp = roifilt2(registered, mask, f);
%     figure, 
%     subplot(1,2,1); imshow(registered); title('registered');
%     subplot(1,2,2); imshow(regsharp); title('sharpened');
    
       
    
 
    %blockdeblur(registered)
    %blockdeblur(registered, test2, invground2match)
    %deblur(registered)
%     figure, 
%     subplot(1,3,1); imshow(registered); title('registered');
%     subplot(1,3,2); imshow(test2); title('test');
%     subplot(1,3,3); imshow(invground2match); title('ground');
end
    
    