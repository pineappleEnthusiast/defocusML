function mytform = registration(a2,b2match) 
    load('registervar.mat', 'inputPoints','outputPoints')
    %a = imread('F:TEST/000001.jpg'); %read test
    %b = imread('F:GROUND/000001.jpg'); %read ground
    %imshow(a2)
    %aroi = imcrop(); %choose sharpest roi on test to take edges from
    acan = edge(a2, 'canny', 0.8);
    % figure,
    % subplot(3,2,1); imshow(a); title('original a');
    % subplot(3,2,2); imshow(a2); title('grayscaled a2');
    % subplot(3,2,3); imshow(b); title('ground b');
    % subplot(3,2,4); imshow(b2); title('gray ground b2');
    % subplot(3,2,5); imshow(b2match); title('matched ground b2match');
    % subplot(3,2,6); imshow(a2); title('comp');
    %imshow(b2match)
    %broi = imcrop();
    bcan = edge(b2match, 'canny');
    %cpselect(acan, bcan)
    mytform = register(inputPoints, outputPoints, acan, bcan, a2);
    
    %optimizedRegistration(a2,b2match)
end

