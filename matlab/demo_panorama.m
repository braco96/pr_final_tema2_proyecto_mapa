% demo_panorama.m — esqueleto para crear un panorama de dos imágenes
% Requiere obtener previamente M1,D1 con puntos de control entre img2->img1 usando ajuste.m

im1 = imread('img1.jpg');  % coloca tus archivos reales
im2 = imread('img2.jpg');

[alto, ancho, ~] = size(im2);
DX = 1150; DY = 50;
pano = uint8(zeros(1000, 3600, 3));
for k = 1:1000
    for j = 1:3600
        x2 = j - DX; y2 = k - DY;
        if (y2>=1) && (y2<=alto) && (x2>=1) && (x2<=ancho)
            pano(k,j,:) = im2(y2,x2,:);
            continue;
        end
        % Necesitas M1,D1: coords de img2 -> img1
        if exist('M1','var') && exist('D1','var')
            xy1 = M1*[x2;y2] + D1;
            x1 = round(xy1(1)); y1 = round(xy1(2));
            [h1,w1,~] = size(im1);
            if (y1>=1) && (y1<=h1) && (x1>=1) && (x1<=w1)
                pano(k,j,:) = im1(y1,x1,:);
                continue;
            end
        end
    end
end
figure; image(pano); axis image off; title('Panorama (demo)');