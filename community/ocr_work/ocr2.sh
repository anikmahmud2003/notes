#!/bin/bash
set -u
WORK="/home/anik/Desktop/project/All notes/community/ocr_work"
IMGDIR="$WORK/images200"
PAGEDIR="$WORK/pages"
LOGFILE="$WORK/ocr2_log.txt"
mkdir -p "$PAGEDIR"

echo "$(date): Starting optimized OCR ($(ls "$IMGDIR" | wc -l) images)..." >> "$LOGFILE"
ls "$IMGDIR"/page-*.jpg | xargs -P 4 -n 1 -I {} bash -c '
  img="$1"
  base=$(basename "$img" .jpg)
  num=${base#page-}
  out="$2/$num.txt"
  if [ ! -s "$out" ]; then
    OMP_THREAD_LIMIT=1 tesseract "$img" "${out%.txt}" -l eng --psm 3 2>/dev/null
  fi
' _ {} "$PAGEDIR"
echo "$(date): OCR complete. pages=$(ls "$PAGEDIR"/*.txt 2>/dev/null | wc -l)" >> "$LOGFILE"

echo "$(date): Merging into full text..." >> "$LOGFILE"
: > "$WORK/community_full.txt"
for f in "$PAGEDIR"/*.txt; do
  echo -e "\f" >> "$WORK/community_full.txt"
  cat "$f" >> "$WORK/community_full.txt"
done
echo "$(date): DONE." >> "$LOGFILE"