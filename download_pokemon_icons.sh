#!/usr/bin/env bash
set -euo pipefail

OUT_DIR="pokemon_map/assets/pokemon"
mkdir -p "$OUT_DIR"
rm -f "$OUT_DIR"/*

BASE_URL="https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon"

for id in $(seq 1 100); do
    filename="poke_${id}.png"
    url="${BASE_URL}/${id}.png"

    echo "→ #$id"
    curl -s -L "$url" -o "$OUT_DIR/$filename"
done

echo "Done."
