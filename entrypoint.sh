#!/usr/bin/env bash

set -e

tex_files="${1}"
compiler="${2}"
options="${3}"

if [[ -z "$tex_files" ]]; then
  echo "Input 'tex_files' is missing."
fi

if [[ -z "$compiler" && -z "$options" ]]; then
  echo "Input 'compiler' and 'options' are both empty. Reset them to default values."
  compiler="latexmk"
  options="-pdf -cd -file-line-error -halt-on-error -interaction=nonstopmode"
fi

while IFS= read -r f; do
  if [[ -z "$f" ]]; then
    continue
  fi

  echo "Compiling $f..."

  if [[ ! -f "$f" ]]; then
    echo "File '$f' cannot be found."
  fi

  ${compiler} ${options} $f
done <<< "$tex_files"
