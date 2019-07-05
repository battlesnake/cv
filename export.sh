#!/bin/bash

set -euo pipefail

declare -r out="publish/cv_$(date -uIdate)_$(git rev-parse HEAD).pdf"

mkdir -p build/

pdflatex -output-directory build/ cv.tex

cp build/cv.pdf "$out"

cat > index.html <<EOF
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
