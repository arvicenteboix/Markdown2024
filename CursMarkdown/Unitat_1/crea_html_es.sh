#!/bin/bash
pandoc 1.Markdown_es.md -o 1.Markdown_es.html --from markdown+implicit_figures -c aqua.css --template ./plantilla.html --listings --filter pandoc-latex-environment --number-sections --toc --toc-depth 3
pandoc 2.Edició_es.md -o 2.Edició_es.html --from markdown+implicit_figures -c aqua.css --template ./plantilla.html --listings --filter pandoc-latex-environment --number-sections --toc --toc-depth 3
pandoc 3.Corrector_es.md -o 3.Corrector_es.html --from markdown+implicit_figures -c aqua.css --template ./plantilla.html --listings --filter pandoc-latex-environment --number-sections --toc --toc-depth 3
