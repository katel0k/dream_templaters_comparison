#!/bin/bash

dune exec test/cover_tests/dream_html.exe

find . -name '*.coverage' | xargs rm -f
dune runtest --instrument-with bisect_ppx --force

bisect-ppx-report html
