#!/bin/bash

dune exec dream_eml/cover_test.exe
dune exec dream_html/cover_test.exe
dune exec mlx/cover_test.exe
dune exec tyxml/cover_test.exe
dune exec tyxml_percent/cover_test.exe

find . -name '*.coverage' | xargs rm -f
dune runtest --instrument-with bisect_ppx --force

bisect-ppx-report html
