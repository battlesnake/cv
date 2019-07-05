#!/bin/bash

set -e

mkdir -p build/

pdflatex -output-directory build/ cv.tex

cp build/cv.pdf "cv_$(date -uIdate)_$(git rev-parse HEAD).pdf"
