% Find Histogram without imhist
%bin(f(x,y)+1)= bin(f(x,y)+1)+1
% pre-process
f = imread('testimg.png');

% process
f2 = 255*im2double(f);

bin = zeros(1,256);

for i=1:size(f2,1)
    for j=1:size(f2,2)
        grayLevel = f2(i, j);
        bin(f2(i,j,1)+1) = bin(f2(i,j,1)+1)+1;
    end
end

% ref: Image Analyst
% https://www.mathworks.com/matlabcentral/answers/330385-find-the-histogram-of-the-image-cameraman-without-using-the-matlab-built-in-functions-for-histogram

grayLevels = 0 : 255;
bar(grayLevels, bin, 'BarWidth', 1, 'FaceColor', 'b');
xlabel('Gray Level', 'FontSize', 20);
ylabel('Pixel Count', 'FontSize', 20);
title('Histogram', 'FontSize', 20);

