#!/bin/bash

set -euo pipefail

declare -r out="cv_$(date -uIdate)_$(git rev-parse HEAD).pdf"

mkdir -p docs/ build/

pdflatex -interaction nonstopmode -output-directory build/ cv.tex </dev/null

cp build/cv.pdf "docs/$out"

ln -sf "$out" docs/cv.pdf

cat > docs/index.html <<EOF
<!doctype html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Mark's CV - redirecting</title>
		<meta http-equiv="refresh" content="1;url=$out">
	</head>
	<body>
		<h1><a href="$out">Redirecting...</a></h1>
	</body>
</html>
EOF
