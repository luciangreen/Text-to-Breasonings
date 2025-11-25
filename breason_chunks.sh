#!/usr/bin/env bash
set -euo pipefail

# Stand-alone parallel breasoner (macOS-compatible)
#
# Usage:
#   ./breason_chunks.sh file.txt

BASE_DIR="$HOME/Dropbox/GitHub/Text-to-Breasonings"
cd "$BASE_DIR"

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <file.txt>"
    exit 1
fi

INPUT="$1"

if [ ! -f "$INPUT" ]; then
    echo "Error: File does not exist: $INPUT"
    exit 1
fi

BASENAME="$(basename "$INPUT")"
CHUNK_DIR="chunks_${BASENAME}"
OUTFILE="${BASENAME}_breasoned.txt"

echo "Preparing output..."
rm -f "$OUTFILE"
mkdir -p "$CHUNK_DIR"
rm -f "$CHUNK_DIR"/* || true

echo "Splitting $INPUT into 2MB chunks (macOS BSD split)..."
split -b 2m -a 3 "$INPUT" "$CHUNK_DIR/${BASENAME}."

# Rename chunks to include .txt extension
for f in "$CHUNK_DIR"/${BASENAME}.*; do
    mv "$f" "$f.txt"
done

echo "Chunks created in $CHUNK_DIR/"

CHUNK_LIST="$CHUNK_DIR/chunk_list.txt"
ls "$CHUNK_DIR"/*.txt > "$CHUNK_LIST"

echo "Launching parallel breasoning..."

if command -v parallel >/dev/null 2>&1; then
    echo "Using GNU parallel..."
    parallel -j 100% \
      'swipl --stack-limit=54G -g "['"'"'text_to_breasonings.pl'"'"'],N=u,M=u,texttobr2(N,\"{}\",u,M,[auto,on]),N=u,M=u,texttobr(N,\"{}\",u,M)" -t halt' \
      :::: "$CHUNK_LIST"
else
    echo "GNU parallel not found. Using xargs -P 4..."
    cat "$CHUNK_LIST" | xargs -P 4 -I {} sh -c \
      'swipl --stack-limit=54G -g "['"'"'text_to_breasonings.pl'"'"'],N=u,M=u,texttobr2(N,\"{}\",u,M,[auto,on]),N=u,M=u,texttobr(N,\"{}\",u,M)" -t halt'
fi

echo "Combining breasoned files into $OUTFILE..."
for chunk in $(cat "$CHUNK_LIST"); do
    if [ -f "${chunk}.br" ]; then
        cat "${chunk}.br" >> "$OUTFILE"
        rm -f "${chunk}.br"
    fi
    rm -f "$chunk"
done

# Cleanup
if [ -z "$(ls -A "$CHUNK_DIR")" ]; then
    rmdir "$CHUNK_DIR"
fi

rm -f "$CHUNK_LIST"

echo "Breasoning complete."
echo "Final output: $OUTFILE"