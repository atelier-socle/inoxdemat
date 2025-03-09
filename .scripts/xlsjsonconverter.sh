#!/bin/bash

# Preconditions:
# Before using this script, you need to have additional tools. Preferably, use
# your system package manager to install `csv2json`, `jsonlint` and `xslx2csv`.
# Alternatively, if you have `node`, `npm`, `python` and `pip`, run
# > `npm i -g csv2json jsonlint && pip install xlsx2csv` for the unclean way.
# WARNING: You may have to adjust your `$PATH` then and you will need to track
# updates yourself. Do this at your own risk only.

# Usage:
# Simply make this script executable (`chmod +x ./xlsjsonconverter.sh`) and run it
# with an xlsx file as an argument. You probably want to redirect the output to
# a new file or pipe it into a pager of your choice. Examples:
# > sh xlsjsonconverter.sh sources/excel/repository.xlsx > sources/temp/repository.json
# > sh xlsjsonconverter.sh sources/excel/repository.xlsx | less

if [ $# -eq 0 ]
then
  echo "Missing filename"
  exit 1
fi

if [ ! -f "$1" ]
then
  echo "File does not exist"
  exit 1
fi

pipx run xlsx2csv "$1" | csv2json | jsonlint
