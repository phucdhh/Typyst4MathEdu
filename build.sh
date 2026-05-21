#!/usr/bin/env bash
set -euo pipefail

root_dir="$(cd "$(dirname "$0")" && pwd)"
cd "$root_dir"

version="$(date +%d.%m.%Y)"
cat > assets/version.typ <<EOF
#let version = "$version"
EOF

typst compile book.typ
output_pdf="Typst4MathEdu-${version}.pdf"
if [ -f "book.pdf" ]; then
  mv -f "book.pdf" "$output_pdf"
  echo "Built: $output_pdf"
else
  echo "Error: book.pdf not found after build." >&2
  exit 1
fi

