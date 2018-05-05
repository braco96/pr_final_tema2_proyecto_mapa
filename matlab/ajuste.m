function [M, D] = ajuste(Xk, Yk, Ek, Nk)
% AJUSTE  Estima la transformación afín de píxeles (X,Y) a coords (E,N)
%   [M,D] = ajuste(Xk,Yk,Ek,Nk)
%   H = [Xk, Yk, 1];  se resuelve H * cE ≈ Ek y H * cN ≈ Nk por mínimos cuadrados.
%
% Salidas:
%   M = [cE(1) cE(2); cN(1) cN(2)]   (2x2)
%   D = [cE(3); cN(3)]               (2x1)

    N = numel(Xk);
    D = [0;0];
    M = eye(2);
    if N < 3, return; end

    H = [Xk(:), Yk(:), ones(N,1)];
    cE = H \ Ek(:);
    cN = H \ Nk(:);

    M = [cE(1) cE(2); cN(1) cN(2)];
    D = [cE(3); cN(3)];

    % Residuos (opcional)
    resE = Ek(:) - H*cE;
    resN = Nk(:) - H*cN;
    fprintf('Residuos Este (m):'); fprintf(' %.1f', resE); fprintf('\n');
    fprintf('Residuos Norte (m):'); fprintf(' %.1f', resN); fprintf('\n');
end