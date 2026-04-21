#!/usr/bin/env zsh
# Build script for LaTeX assignment
# Runs: pdflatex → biber → pdflatex × 3
# verbose-ibid requires 3 post-biber passes to stabilise the cite tracker

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SRC_DIR="$SCRIPT_DIR/src"
OUT_DIR="$SCRIPT_DIR/out"

mkdir -p "$OUT_DIR"

cd "$SRC_DIR"

echo "📄 [1/5] pdflatex (first pass – generates .bcf for biber)..."
pdflatex -interaction=nonstopmode -output-directory="$OUT_DIR" main.tex > /dev/null || true

echo "📚 [2/5] biber (resolves bibliography → writes .bbl)..."
biber --debug --input-directory "$OUT_DIR" --output-directory "$OUT_DIR" main 2>&1 | grep -E "^(INFO|WARN|ERROR)" || true

# Abort if biber did not produce a .bbl file
if [[ ! -f "$OUT_DIR/main.bbl" ]]; then
  echo "❌ biber failed – out/main.bbl not found. Check out/main.blg for details." >&2
  exit 1
fi

echo "📄 [3/5] pdflatex (second pass – reads .bbl)..."
pdflatex -interaction=nonstopmode -output-directory="$OUT_DIR" main.tex > /dev/null || true

echo "📄 [4/5] pdflatex (third pass – resolves cross-references)..."
pdflatex -interaction=nonstopmode -output-directory="$OUT_DIR" main.tex > /dev/null || true

echo "📄 [5/5] pdflatex (final pass – stabilises verbose-ibid tracker)..."
pdflatex -interaction=nonstopmode -output-directory="$OUT_DIR" main.tex > /dev/null || true

echo "✅ Build complete → out/main.pdf"
