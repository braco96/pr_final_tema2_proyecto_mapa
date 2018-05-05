% demo_inversa_y_ruta.m — calcula M',D' e imprime la ruta sobre el mapa
close all; clc;
im = imread(fullfile('..','imagenes','mapa.jpg')); image(im); axis image off; hold on;

if exist('Xk','var')~=1 || exist('Ek','var')~=1
    % Si no se han cargado puntos de control, intentar cargarlos desde un .mat externo
    if exist('calib.mat','file')
        load('calib.mat'); % debe definir Xk,Yk,Ek,Nk
    else
        error('Carga puntos de control en Xk,Yk,Ek,Nk o un calib.mat');
    end
end

[M,D] = ajuste(Xk,Yk,Ek,Nk);

Minv = inv(M);
Dinv = -Minv*D;

% Cargar ruta (E,N)
rutaPath = fullfile('..','docs','ruta.mat');
if exist(rutaPath,'file'), S = load(rutaPath); ruta = S.ruta; else, error('No se encontró docs/ruta.mat'); end

% Transformación inversa: (X,Y) = M' * (E,N) + D'
XY = Minv * ruta + Dinv;

plot(XY(1,:), XY(2,:), 'r:', 'LineWidth', 2);
title('Ruta GPS superpuesta sobre el mapa');