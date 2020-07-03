function mytform = register(inputpts,outputpts, inimg,outimg, test) 
    inputptscorr = cpcorr(inputpts, outputpts, inimg,outimg);
    mytform = fitgeotrans(inputptscorr,outputpts,'projective');
    %testtransform(mytform)
     %registered = imwarp(test,mytform);
%     imshow(registered)
end