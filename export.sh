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
		<meta property="og:title" content="Mark K Cowan">
		<meta property="og:description" content="Mark's CV as of $(date -uIdate)">
		<meta property="og:image" content="me.jpg">
		<meta property="og:url" content="https://battlesnake.github.io/cv/">
		<meta property="og:type" content="article">
		<meta property="og:locale" content="en_GB" />
		<meta name="twitter:card" content="me.jpg">
		<link rel="icon" type="image/png" href="me.jpg">
		<link rel="apple-touch-icon" href="me.jpg">
		<link rel="shortcut icon" type="image/png" href="me.jpg">
	</head>
	<body>
		<h1><a href="$out">Redirecting...</a></h1>
	</body>
</html>
EOF
