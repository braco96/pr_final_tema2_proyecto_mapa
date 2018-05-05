% demo_directa.m — aplica M,D a un par (X,Y) de ejemplo
% Supone que ya has estimado M,D (por ejemplo, cargando Xk,Yk,Ek,Nk y llamando a ajuste).
if exist('Xk','var')~=1, fprintf('Carga Xk,Yk,Ek,Nk y ejecuta ajuste primero.\n'); return; end
[M,D] = ajuste(Xk,Yk,Ek,Nk);
X = 1000; Y = 800;         % ejemplo
EN = M * [X;Y] + D;
fprintf('Píxel (%d,%d) -> Coord (E=%.1f, N=%.1f)\n', X,Y, EN(1), EN(2));