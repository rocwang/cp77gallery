#!/usr/bin/env bash

# Fix color space issues from the original image files
# find ./all_goodies/concept_arts -iname '*.jpg' | xargs -P 8 -n 1 mogrify -colorspace RGB
# find ./all_goodies -iname '*.png' | xargs -P 8 -n 10 mogrify

# Clean
find ./public/all_goodies -type f |xargs rm -f

# Convert
find ./all_goodies -iname '*.png' -or -iname '*.jpg' -or -iname '*.pdf' | xargs -P 8 -I {} bash -c \
'
convert "$1" -write mpr:main +delete -respect-parentheses \
\( mpr:main -quality 75 -resize 200x200^   -define webp:lossless=false +write "./public/${1%.*}.200.webp"  \) \
\( mpr:main -quality 75 -resize 400x400^   -define webp:lossless=false +write "./public/${1%.*}.400.webp"  \) \
\( mpr:main -quality 75 -resize 600x600^   -define webp:lossless=false +write "./public/${1%.*}.600.webp"  \) \
\( mpr:main -quality 75 -resize 800x800^   -define webp:lossless=false +write "./public/${1%.*}.800.webp"  \) \
\( mpr:main -quality 75 -resize 1000x1000^ -define webp:lossless=false +write "./public/${1%.*}.1000.webp" \) \
\( mpr:main -quality 75 -resize 1280x720\>  -define webp:lossless=false +write "./public/${1%.*}.1280.webp" \) \
\( mpr:main -quality 75 -resize 1366x768\>  -define webp:lossless=false +write "./public/${1%.*}.1366.webp" \) \
\( mpr:main -quality 75 -resize 1600x900\>  -define webp:lossless=false +write "./public/${1%.*}.1600.webp" \) \
\( mpr:main -quality 75 -resize 1920x1080\> -define webp:lossless=false +write "./public/${1%.*}.1920.webp" \) \
\( mpr:main -quality 75 -resize 2560x1440\> -define webp:lossless=false +write "./public/${1%.*}.2560.webp" \) \
\( mpr:main -quality 75 -resize 3840x2160\> -define webp:lossless=false +write "./public/${1%.*}.3840.webp" \) \
\( mpr:main -quality 75 -resize 5120x2880\> -define webp:lossless=false +write "./public/${1%.*}.5120.webp" \) \
null:
' _ {} \;
