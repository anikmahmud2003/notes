#!/bin/bash
# Resume-safe OCR: continue rendering unrendered pages, OCR everything, merge.
set -u

WORK="/home/anik/Desktop/project/All notes/community/ocr_work"
PDF="/home/anik/Desktop/project/All notes/community/community medicine endeavour guide.pdf"
IMGDIR="$WORK/images"
PAGEDIR="$WORK/pages"
LOGFILE="$WORK/ocr_log.txt"
TOTAL=722

mkdir -p "$IMGDIR" "$PAGEDIR"

# 1. Find highest existing rendered page image
LAST=0
for f in "$IMGDIR"/page-*.jpg; do
  [ -e "$f" ] || continue
  n=$(basename "$f" .jpg); n=${n#page-}
  n=$((10#$n))
  [ "$n" -gt "$LAST" ] && LAST=$n
done
START=$((LAST+1))

echo "$(date): Already rendered $LAST pages. Rendering $START..$TOTAL..." >> "$LOGFILE"
if [ "$START" -le "$TOTAL" ]; then
  pdftoppm -jpeg -r 300 -jpegopt quality=90 -f "$START" -l "$TOTAL" "$PDF" "$IMGDIR/page"
fi

echo "$(date): Rendering done. Starting OCR..." >> "$LOGFILE"
ls "$IMGDIR"/page-*.jpg | xargs -P 4 -n 1 -I {} bash -c '
  img="$1"
  base=$(basename "$img" .jpg)
  num=${base#page-}
  out="$2/$num.txt"
  if [ ! -s "$out" ]; then
    tesseract "$img" "${out%.txt}" -l eng --psm 3 2>/dev/null
  fi
' _ {} "$PAGEDIR"

echo "$(date): OCR complete. Merging into full text..." >> "$LOGFILE"
: > "$WORK/community_full.txt"
for f in "$PAGEDIR"/*.txt; do
  echo -e "\f" >> "$WORK/community_full.txt"
  cat "$f" >> "$WORK/community_full.txt"
done

echo "$(date): DONE. pages=$(ls "$PAGEDIR"/*.txt 2>/dev/null | wc -l)" >> "$LOGFILE"