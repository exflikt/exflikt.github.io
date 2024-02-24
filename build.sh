#!/bin/sh

emacs -Q --script build-site.el
sed -i 's#="file://#="#' $(find public/ -type f -name '*.html')
