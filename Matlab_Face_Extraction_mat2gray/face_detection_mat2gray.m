%Pre process
clear
clc
f = imread('woman-pixabayTestImg.jpg')
figure(1), imshow(f)

%Process
g = rgb2ycbcr(f)
cb = g(:,:,2);
cr = g(:,:,3);
face = zeros(size(g,1), size(g,3));

for i=1:size(g,1)
    for j=1:size(g,2)
        if(cr(i,j)>140 & cr(i,j)<165 & cb(i,j)>105 & cb(i,j)<135)
            face(i,j,1) = f(i,j,1);
            face(i,j,2) = f(i,j,2);
            face(i,j,3) = f(i,j,3);
        end
    end
end

%Post Process
face = mat2gray(face);
figure(2), imshow(face)
