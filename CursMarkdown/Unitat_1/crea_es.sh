#!/bin/bash
pandoc 1.Markdown_es.md -o 1.Markdown_es.pdf --from markdown+implicit_figures --template eisvogel --listings --filter pandoc-latex-environment --number-sections --toc
pandoc 2.Edició_es.md -o 2.Edició_es.pdf --from markdown+implicit_figures --template eisvogel --listings --filter pandoc-latex-environment --number-sections --toc
pandoc 3.Corrector_es.md -o 3.Corrector_es.pdf --from markdown+implicit_figures --template eisvogel --listings --filter pandoc-latex-environment --number-sections --toc
