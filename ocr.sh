#!/usr/bin/env bash
# courtesy of : <https://ryanfb.github.io/etc/2014/11/13/command_line_ocr_on_mac_os_x.html>

ocr() {
  # get name of input pdf
  PREFIX=$(basename "$1" .pdf)
  echo "Prefix is: $PREFIX"

  # check for any `tesseract` flags
  if [ ! -z "$TESSERACT_FLAGS" ]; then
    echo "Picked up TESSERACT_FLAGS: $TESSERACT_FLAGS"
  fi

  # use `imagemagick` to convert pdf to individual `.tif` files
  echo "Converting to TIFF..."
  convert -density 300 "$1" -type Grayscale -compress lzw -background white +matte -depth 32 "${PREFIX}_page_%05d.tif"

  # use `tesseract` to OCR those individual `.tif` files
  echo "Performing OCR..."
  if command -v parallel >/dev/null 2>&1; then
    # if you can, parallelize this process using GNU Parallel
    parallel --bar "tesseract $TESSERACT_FLAGS {} {.} pdf 2>/dev/null" ::: "${PREFIX}"_page_*.tif
  else
    for i in "${PREFIX}"_page_*.tif; do
      echo "OCRing $i..."
      tesseract $TESSERACT_FLAGS "$i" "$(basename "$i" .tif)" pdf 2>/dev/null
    done
  fi

  # combine individual OCR'd pdf pages back into a single OCR'd pdf using `ghostscript`
  echo "Combining output to ${PREFIX}-OCR.pdf..."
  gs -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile="${PREFIX}__OCR.pdf" "${PREFIX}"_page_*.pdf >/dev/null 2>&1

  # delete all of the individual files (both `.tif` and `.pdf`)
  echo "Cleaning up..."
  rm "${PREFIX}"_page_*.tif "${PREFIX}"_page_*.pdf
}
