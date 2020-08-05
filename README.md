# LaTeXmk Action

This action compiles LaTeX docs to PDF using latexmk with a minimal texlive image.

## Inputs

- `tex_files`

The main LaTeX file or a list of such files to be compiled.

- `compiler`

Default to `latexmk`, can be changed to `latex` or `pdflatex`.

- `options`

Default options for `latexmk` is set to `-pdf -file-line-error -halt-on-error -interaction=nonstopmode`. The options should be changed correspondingly when the `compiler` has been changed.


## Example

```yaml
name: Build LaTeX document
on: [push]
jobs:
  build_latex:
    runs-on: ubuntu-latest
    steps:
      - name: Set up Git repository
        uses: actions/checkout@v2
      - name: Compile LaTeX document
        uses: fredqi/tl-action@master
        with:
          tex_files: |
	    main.tex
```

## References:

[1] <https://github.com/xu-cheng/latex-action>