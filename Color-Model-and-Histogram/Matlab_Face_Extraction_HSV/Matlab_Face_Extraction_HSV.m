%Pre process
% Mode HSV
clear
clc
f = imread('testimg.png')
figure(1), imshow(f)

%Process
g = rgb2hsv(f)
H = g(:,:,1);
S = g(:,:,2);
V = g(:,:,3);

face = zeros(size(g,1), size(g,3));

for i=1:size(g,1)
    for j=1:size(g,2)
% https://arxiv.org/ftp/arxiv/papers/1708/1708.02694.pdf
        if(H(i,j) <= 50.0 & 0.23 <= S(i,j) <= 0.68) 
            face(i,j,1) = f(i,j,1);
            face(i,j,2) = f(i,j,2);
            face(i,j,3) = f(i,j,3);
        end
    end
end

%Post Process
face = mat2gray(face);
figure(3), imshow(face)
