function [a2, b2match] = colorfix(a, b)
    a2 = rgb2gray(a);
    b2 = rgb2gray(b);
    invb2 = imcomplement(b2);%inverts colors for b2 (invert ground bc sharper edges...
    b2match = imadjust(invb2, [0.098 0.42], [0.36 0.578]);
