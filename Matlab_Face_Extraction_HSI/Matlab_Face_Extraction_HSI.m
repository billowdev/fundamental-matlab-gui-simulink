%Pre process
% Mode HSI
clear
clc
f = imread('testimg.png')
figure(1), imshow(f)

%Process
% ref: https://www.imageeprocessing.com/2013/05/converting-rgb-image-to-hsi.html
%------------------ rgb2hsi ---------------------%
%Represent the RGB image in [0 1] range
g = double(f)/255;
R = g(:, :, 1);
G = g(:, :, 2);
B = g(:, :, 2);

% Hue
numi = 1/2*((R-G)+(R-B));
denom = ((R-G).^2+((R-B).*(G-B))).^0.5;

%To avoid divide by zero exception add a small number in the denominator
H = acosd(numi./(denom+0.000001));

% If B>G then H = 360 - Theta
H(B>G) = 360-H(B>G);

%Saturation
S = 1-(3./(sum(f,3)+0.000001)).*double(min(f, [], 3));

% Intensity
% I=sum(f,3)./3;
I = (R + G + B)/3;

%HSI
HSI=zeros(size(f));
HSI(:, :, 1) = H;
HSI(:, :, 2) = S;
HSI(:, :, 3) = I; 
%----------End HSI --------%

% Intensity
%figure,imshow(HSI);title('HSI Image');
%figure('Name',"H Img"), imshow(H) % H: Hue it work
%figure('Name',"S Img"), imshow(S) % Saturation
%figure('Name',"I Img"), imshow(I) % I not Show 

hImage = HSI(:, :, 1);
sImage = HSI(:, :, 2);
iImage = HSI(:, :, 3);
%------------------End rgb2hsi---------------------%


%Process
g = rgb2hsv(f)
H = g(:,:,1);
S = g(:,:,2);
V = g(:,:,3);

face = zeros(size(g,1), size(g,3));

for i=1:size(g,1)
    for j=1:size(g,2)
%https://www.researchgate.net/publication/340690739_Comparison_of_Video_Face_Detection_methods_Using_HSV_HSL_and_HSI_Color_Spaces
% https://arxiv.org/ftp/arxiv/papers/1708/1708.02694.pdf
    
        if(H(i,j) <= 1 & 0.23 <= S(i,j) <= 0.88) 
            face(i,j,1) = f(i,j,1);
            face(i,j,2) = f(i,j,2);
            face(i,j,3) = f(i,j,3);
        end
    end
end


face = mat2gray(face);
figure('Name', "Face Mode HSI"), imshow(face)
