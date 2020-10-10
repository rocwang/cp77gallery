#!/usr/bin/env bash

# Fix
# find ./all_goodies/concept_arts -iname '*.jpg' | xargs -P 8 -n 1 mogrify -colorspace RGB
# find ./all_goodies -iname '*.png' | xargs -P 8 -n 10 mogrify

# Convert
# find ./all_goodies -iname '*.png' -or -iname '*.jpg' | xargs -P 8 -I {} bash -c 'cwebp -q 75 -resize 0 300 -noalpha -mt -quiet $1 -o "${1%.*}.h300.webp"' _ {} \;
find ./public/all_goodies -type f |xargs rm -f

find ./all_goodies -iname '*.png' -or -iname '*.jpg' -or -iname '*.pdf' | xargs -P 8 -I {} bash -c \
'
convert "$1" -write mpr:main +delete -respect-parentheses \
\( mpr:main -quality 75 -resize 100x100^   -define webp:lossless=false +write "./public/${1%.*}.100.webp"  \) \
\( mpr:main -quality 75 -resize 200x200^   -define webp:lossless=false +write "./public/${1%.*}.200.webp"  \) \
\( mpr:main -quality 75 -resize 300x300^   -define webp:lossless=false +write "./public/${1%.*}.300.webp"  \) \
\( mpr:main -quality 75 -resize 400x400^   -define webp:lossless=false +write "./public/${1%.*}.400.webp"  \) \
\( mpr:main -quality 75 -resize 500x500^   -define webp:lossless=false +write "./public/${1%.*}.500.webp"  \) \
\( mpr:main -quality 75 -resize 600x600^   -define webp:lossless=false +write "./public/${1%.*}.600.webp"  \) \
\( mpr:main -quality 75 -resize 2560x1440^ -define webp:lossless=false +write "./public/${1%.*}.1440.webp"  \) \
null:
' _ {} \;