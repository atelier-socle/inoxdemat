#!/bin/bash

# A script to clean and update digital documents to swift package resources.
#
# Usage example:
# > sh docscleaner.sh

echo "[🚀] ... running Documents cleaner.."

rm -rf ../Sources/InoxDemat/Resources/Pdfs/Excelium/*
rm -rf ../Sources/InoxDemat/Resources/Pdfs/MaRetraite/*

echo "[🚀] ... move Documents to swift package ressources `Pdfs` directory.."

mv sources/pdfs/Excelium/*.pdf ../Sources/InoxDemat/Resources/Pdfs/Excelium/
mv sources/pdfs/MaRetraite/*.pdf ../Sources/InoxDemat/Resources/Pdfs/MaRetraite/
