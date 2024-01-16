#!/bin/bash
pandoc 1.Markdown.md -o 1.Markdown.html --from markdown+implicit_figures -c theme.css --template ./plantilla.html --listings --filter pandoc-latex-environment --number-sections --toc --toc-depth 3
pandoc 2.Edició.md -o 2.Edició.html --from markdown+implicit_figures -c theme.css --template ./plantilla.html --listings --filter pandoc-latex-environment --number-sections --toc --toc-depth 3
pandoc 3.Corrector.md -o 3.Corrector.html --from markdown+implicit_figures -c theme.css --template ./plantilla.html --listings --filter pandoc-latex-environment --number-sections --toc --toc-depth 3
