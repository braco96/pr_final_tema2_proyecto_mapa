#!/usr/bin/env bash
set -e
REPO_DIR="$(dirname "$0")"
cd "$REPO_DIR"

git init

git config user.name "Luis Bravo"
git config user.email "luisitobravete@gmail.com"

# Helper para commitear con fecha dada
commit_with_date () {
  GIT_AUTHOR_DATE="$1" GIT_COMMITTER_DATE="$1"   git commit -m "$2" --author="Luis Bravo <luisitobravete@gmail.com>" --date="$1"
}

git add README.md enunciado imagenes matlab docs
commit_with_date "Mon, 05 Feb 2018 10:00:00 +0100" "Inicio del proyecto: añado enunciado y estructura base"

git add matlab/ajuste.m
commit_with_date "Mon, 19 Feb 2018 18:30:00 +0100" "Primera versión de ajuste.m (mínimos cuadrados)"

git add matlab/demo_directa.m
commit_with_date "Mon, 05 Mar 2018 12:00:00 +0100" "Demo de transformación directa (X,Y -> E,N)"

git add matlab/demo_inversa_y_ruta.m docs/ruta.mat imagenes/mapa.jpg
commit_with_date "Mon, 19 Mar 2018 21:00:00 +0100" "Transformación inversa y superposición de ruta GPS"

git add matlab/demo_panorama.m
commit_with_date "Mon, 09 Apr 2018 11:00:00 +0200" "Esqueleto de panorama (empalme 2 imágenes)"

git add imagenes/sierra_nieve.jpg enunciado/README_origen.md enunciado/respuestas.doc
commit_with_date "Mon, 23 Apr 2018 16:00:00 +0200" "Incluyo material adicional y respuestas originales"

git add -A
commit_with_date "Mon, 14 May 2018 19:30:00 +0200" "Cierre del proyecto y entrega final"
echo "Repo creado. Revisa 'git log --pretty=fuller'"