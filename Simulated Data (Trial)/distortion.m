%store undistorted images
filepath = "C:\Users\kanga\Documents\MATLAB\project\defocusML\Simulated Data (Trial)\Undistorted Images from Internet\";
a = imread(filepath+"1.jpg");
b = imread(filepath+"2.jpg");
c = imread(filepath+"3.jpeg");
d = imread(filepath+"4.jpg");
e = imread(filepath+"5.jpg");

%rotate images
%no point segmenting them since i got 5 diff images in the mix, there's
%enuf variety of detail so not worth the effort
% newpath = "C:\Users\kanga\Documents\MATLAB\project\defocusML\Simulated Data (Trial)\Undistorted Images from Internet\Rotated Images\";
% for i=1:360
%     save = imrotate(e,i,'crop');
%     imwrite(save, strcat(newpath,'/', int2str(i+1800),'.jpg'), 'jpg');  
% end

%perspective distortion 
% T = [0.997864729838916,0.00298986627430914,-0.000109959249393314;
%     -0.0213521511592894,0.569236822946354,-2.56774558305337e-05;
%     -68.5126256838356,61.6669589695105,1];
% 
% mytform = projective2d(inv(T));
% 
 oldpath = "C:\Users\kanga\Documents\MATLAB\project\defocusML\Simulated Data (Trial)\Undistorted Images from Internet\Rotated Images\";
 newpath = "C:\Users\kanga\Documents\MATLAB\project\defocusML\Simulated Data (Trial)\Distorted Images\";
% for i=1:2160
%     a = imread(oldpath+int2str(i)+ ".jpg");
%     save = imwarp(a, mytform);
%     imwrite(save, strcat(newpath,'/', int2str(i),'.jpg'), 'jpg');  
% end

% I = imread('rice.png');
% se = strel('disk',15);
% background = imopen(I,se);

 sigma=8;
 H_filt = fspecial('gaussian',[5 5], sigma);
newnewpath = "C:\Users\kanga\Documents\MATLAB\project\defocusML\Simulated Data (Trial)\Blurred Images\";
% 
% for i=1801:2160
%     test = imread(newpath+int2str(i)+".jpg");
%     %test = rgb2gray(test);
%     background = imresize(background, size(test));
%     test = imnoise(test,'gaussian');
%     blur = imfilter(test,H_filt);
%     save = blur + background;
%     imwrite(save, strcat(newnewpath,'/', int2str(i),'.jpg'), 'jpg');
% end

