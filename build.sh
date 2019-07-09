#!/bin/bash

set -euo pipefail

mkdir -p build/

pdflatex -interaction nonstopmode -output-directory build/ cv.tex </dev/null

if ! (( ${nopreview:-0} )); then
	xdg-open build/cv.pdf &>/dev/null
fi
