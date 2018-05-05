# Calibración de Mapa y Panoramas — Proyecto MATLAB

**Autor:** Luis Bravo Collado  
**Tema:** Ajuste de datos, transformaciones afines e interpolación de imágenes   

Este repositorio contiene:
- **`/enunciado/Practica_Ajuste_Mapa.pdf`** (enunciado original de la práctica).
- **`/imagenes/`** con el mapa escaneado y una foto de referencia.
- **`/matlab/`** con funciones y scripts (`ajuste.m`, demos de transformación directa/inversa y panoramas).
- **`/docs/`** con ficheros `.mat` de ejemplo (ruta, etc.).

> La práctica original describe la **calibración de un mapa digital** mediante una **transformación afín** (matriz `M` y vector `D`) a partir de **puntos de control** (píxel → coordenadas), el cálculo de la **transformación inversa** para superponer rutas de GPS, y la **creación de panoramas** por empalme de imágenes (“image stitching”). Véase el PDF para los detalles y fórmulas.  

## Estructura

```
.
├── enunciado/
│   ├── Practica_Ajuste_Mapa.pdf
│   ├── README_origen.md        # material adjunto original
│   └── respuestas.doc
├── imagenes/
│   ├── mapa.jpg                # mapa topográfico escaneado
│   └── sierra_nieve.jpg
├── matlab/
│   ├── ajuste.m                # estima M (2x2) y D (2x1) con mínimos cuadrados
│   ├── demo_directa.m          # píxel (X,Y) → coord (E,N) usando M,D
│   ├── demo_inversa_y_ruta.m   # coord (E,N) → píxel (X,Y) con M',D' y superposición de ruta
│   └── demo_panorama.m         # esqueleto para mosaico con dos imágenes
└── docs/
    ├── ruta.mat
    └── porsi.mat
```

## Uso rápido

1. Abrir MATLAB y situar el directorio en la carpeta del proyecto.  
2. Ejecutar `matlab/demo_inversa_y_ruta.m` para cargar `mapa.jpg`, calcular la inversa y **pintar la ruta** (`docs/ruta.mat`) sobre el mapa.  
3. Revisar/ajustar rutas y puntos de control según el enunciado.

## Historial Git reproducible (fechas 2018)
Incluyo un script para **recrear un repositorio con commits fechados** entre el **primer lunes de febrero de 2018** y **mayo de 2018**, firmando como *Luis*. Ver `replay_git_history.sh`.
