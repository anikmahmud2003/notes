#!/bin/bash
# Full OCR pipeline: render PDF pages to images, OCR each, save per-page text.
set -u

WORK="/home/anik/Desktop/project/All notes/community/ocr_work"
PDF="/home/anik/Desktop/project/All notes/community/community medicine endeavour guide.pdf"
IMGDIR="$WORK/images"
PAGEDIR="$WORK/pages"
LOGFILE="$WORK/ocr_log.txt"

mkdir -p "$IMGDIR" "$PAGEDIR"

echo "$(date): Rendering PDF pages to JPEG (300 DPI)..." >> "$LOGFILE"
pdftoppm -jpeg -r 300 -jpegopt quality=90 "$PDF" "$IMGDIR/page"

echo "$(date): OCR-ing all pages with tesseract (4 parallel)..." >> "$LOGFILE"
ls "$IMGDIR"/page-*.jpg | xargs -P 4 -n 1 -I {} bash -c '
  img="$1"
  base=$(basename "$img" .jpg)          # page-0001
  num=${base#page-}                      # 0001
  out="$2/$num.txt"
  if [ ! -s "$out" ]; then
    tesseract "$img" "${out%.txt}" -l eng --psm 3 2>/dev/null
  fi
' _ {} "$PAGEDIR"

echo "$(date): OCR complete. Merging pages into full text..." >> "$LOGFILE"
: > "$WORK/community_full.txt"
for f in "$PAGEDIR"/*.txt; do
  echo -e "\f" >> "$WORK/community_full.txt"
  cat "$f" >> "$WORK/community_full.txt"
done

echo "$(date): Done." >> "$LOGFILE"
echo "PAGES=$(ls "$PAGEDIR"/*.txt 2>/dev/null | wc -l)" >> "$LOGFILE"