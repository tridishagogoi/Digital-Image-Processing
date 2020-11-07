clc
close all

myimage=imread('Pic.jpeg');
figure(1)
imshow(myimage);
title('Original Image');

resizedimage=imresize(myimage,[256,256]);
figure(2)
imshow(resizedimage);
title('Resized pic');

grayimage=rgb2gray(myimage);
figure(3)
imshow(grayimage);
title('Gray Scale image');

salt=imnoise(grayimage,'salt & Pepper', 0.05 );
figure(4)
imshow(salt);
title('Salt and Pepper Image');

mymedian=medfilt2(salt,[4 4]);
figure(5)
imshow(mymedian);
title('Output of Median 4x4');

gau=imnoise(grayimage,'gaussian', 0,0.01);
figure(6)
imshow(gau);
title('Gaussian Image');

gaussmask=fspecial('gaussian',3);
filtimage=imfilter(grayimage,gaussmask);
figure(7)
imshow(filtimage,[]);
title('Gaussian Filter');

gaussmask=fspecial('gaussian',5);
filtimage=imfilter(grayimage,gaussmask);
figure(8)
imshow(filtimage,[]);
title('Gaussian Filter with noise');

h=fspecial('unsharp',0.7);
hpt=imfilter(grayimage,h);
figure(9)
imshow(hpt);
title('Unsharp Filter');

avgfilt=[1 1 1 1 1 1 1;
         1 1 1 1 1 1 1;
         1 1 1 1 1 1 1;
         1 1 1 1 1 1 1;
         1 1 1 1 1 1 1;
         1 1 1 1 1 1 1;
         1 1 1 1 1 1 1];
avgfiltmask=avgfilt/sum(avgfilt);
convimage=conv2(double(grayimage),double(avgfiltmask));
figure(10)
imshow(convimage,[]);
title('Average filter with conv2()');
