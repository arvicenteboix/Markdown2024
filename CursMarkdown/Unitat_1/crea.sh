#!/bin/bash
pandoc 1.Markdown.md -o 1.Markdown.pdf --from markdown+implicit_figures --template eisvogel --listings --filter pandoc-latex-environment --number-sections --toc
pandoc 2.Edició.md -o 2.Edició.pdf --from markdown+implicit_figures --template eisvogel --listings --filter pandoc-latex-environment --number-sections --toc
pandoc 3.Corrector.md -o 3.Corrector.pdf --from markdown+implicit_figures --template eisvogel --listings --filter pandoc-latex-environment --number-sections --toc
